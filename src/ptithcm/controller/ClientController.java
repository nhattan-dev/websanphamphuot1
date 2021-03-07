package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ptithcm.entity.Cart;
import ptithcm.entity.CartItem;
import ptithcm.entity.Category;
import ptithcm.entity.Image;
import ptithcm.entity.Product;
import ptithcm.entity.Search;
import ptithcm.entity.UserLogin;
import ptithcm.entity.UserLoginForAdd;
import ptithcm.entity.info;

@SuppressWarnings("unused")
@Controller
@RequestMapping("")
public class ClientController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("register")
	public String register(ModelMap model) {
		model.addAttribute("newUser", new UserLoginForAdd());
		return "client/sanpham/register";
	}

	@RequestMapping(value = "register", params = "btnRegister")
	public String register(@ModelAttribute("newUser") UserLoginForAdd user, BindingResult errors) {
		Session session = null;
		Transaction transaction = null;
		if (is_Valid_User(user, errors)) {
			try {
				session = factory.openSession();
				transaction = session.beginTransaction();
				UserLogin userLogin = new UserLogin();
				userLogin.setEmail(user.getEmail());
				userLogin.setUsername(user.getUsername());
				userLogin.setPassword(user.getPassword());
				userLogin.setRole_id("USER");
				userLogin.setAvatar("");
				session.save(userLogin);
				transaction.commit();
				return "redirect:/index.htm";
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			} finally {
				session.close();
			}
		}
		return "client/sanpham/register";
	}

	private boolean is_Valid_User(UserLoginForAdd user, BindingResult errors) {
		Session session = null;
		if (user.getEmail().trim().equals("")) {
			errors.rejectValue("email", "newUser", "Không được để trống email !");
		} else {
			try {
				session = factory.openSession();
				Query query = session.createQuery("FROM UserLogin WHERE email LIKE '" + user.getEmail().trim() + "'");
				if (query.list().size() > 0) {
					errors.rejectValue("email", "newUser", "Email đã được sử dụng !");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if (user.getUsername().trim().equals("")) {
			errors.rejectValue("username", "newUser", "Không được để trống username !");
		} else {
			try {
				session = factory.openSession();
				Query query = session
						.createQuery("FROM UserLogin WHERE username LIKE '" + user.getUsername().trim() + "'");
				if (query.list().size() > 0) {
					errors.rejectValue("username", "newUser", "Username đã được sử dụng !");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if (user.getPassword().trim().equals("")) {
			errors.rejectValue("password", "newUser", "Không được để trống password !");
		}
		if (user.getConfirm().trim().equals("")) {
			errors.rejectValue("confirm", "newUser", "Không được để trống confirm !");
		}
		if (!user.getConfirm().trim().equalsIgnoreCase(user.getPassword().trim())) {
			errors.rejectValue("confirm", "newUser", "Mật khẩu không khớp !");
		}
		if (errors.hasErrors()) {
			return false;
		}
		return true;
	}

	@RequestMapping("pay")
	@ResponseBody
	public String pay(HttpServletRequest request, HttpServletResponse response) {
		Session session = null;
		Transaction transaction = null;
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			UserLogin user = (UserLogin) request.getSession().getAttribute("user");
			if (user == null)
				return "nologgedin";
			if (user.getCart().size() > 0) {
				Query query = session.createQuery("SELECT MAX(id) FROM Cart");
				int cart_id = 1;
				try {
					cart_id = (int) query.uniqueResult() + 1;
				} catch (Exception e) {
					// TODO: handle exception
				}
				session.save(new Cart(cart_id, new Date(), user));
				for (Product product : user.getCart()) {
					session.save(new CartItem(product.getId(), cart_id, product.getQuantity(), product.getPrice()));
					Product prod = (Product) session.get(Product.class, product.getId());
					prod.setQuantity(prod.getQuantity() - product.getQuantity());
					session.update(prod);
				}
				transaction.commit();
				user.setCart(new ArrayList<Product>());
				return "success";
			}
		} catch (Exception e) {
			// e.printStackTrace();
			transaction.rollback();
			return "failure";
		} finally {
			session.close();
		}
		return "failure";
	}

	@RequestMapping(value = "add")
	@ResponseBody
	public String xyz(@RequestParam int id, HttpServletRequest request) {
		Session session = null;
		HttpSession httpSession = request.getSession();
		UserLogin user = (UserLogin) httpSession.getAttribute("user");
		if (user == null)
			return "nologgedin";
		for (Product product : user.getCart()) {
			if (product.getId() == id) {
				try {
					session = factory.openSession();
					Product prod = (Product) session.get(Product.class, id);
					System.out.println(prod.getQuantity());
					if (prod.getQuantity() <= product.getQuantity() || prod.getQuantity() == 0) {
						return "failquantity";
					}
				} catch (Exception e) {
					// TODO: handle exception
					if (session != null) {
						session.close();
					}
				}
				product.setQuantity(product.getQuantity() + 1);
				return "" + user.getCart().size();// new info(user.getCart().size()+"", id, product.getQuantity());
			}
		}
		Product np = new Product();
		np.setId(id);
		np.setQuantity(1);
		ArrayList<Product> nl = user.getCart();
		nl.add(np);
		user.setCart(nl);
		return "" + user.getCart().size();// new info(user.getCart().size()+"", id, np.getQuantity());
	}

	@RequestMapping("remove")
	@ResponseBody
	public String remove(@RequestParam int id, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		UserLogin user = (UserLogin) httpSession.getAttribute("user");
		if (user == null)
			return "nologgedin";
		for (Product product : user.getCart()) {
			if (product.getId() == id) {
				ArrayList<Product> list = user.getCart();
				list.remove(product);
				user.setCart(list);
				break;
			}
		}
		return user.getCart().size() + "";
	}

	@RequestMapping("minus")
	@ResponseBody
	public String yzx(@RequestParam int id, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		UserLogin user = (UserLogin) httpSession.getAttribute("user");
		if (user == null)
			return "nologgedin";
		for (Product product : user.getCart()) {
			if (product.getId() == id) {
				product.setQuantity(product.getQuantity() == 0 ? 0 : product.getQuantity() - 1);
				return product.getQuantity() + "";
			}
		}
		return "0";
	}

	@RequestMapping("plus")
	@ResponseBody
	public String plus(@RequestParam int id, HttpServletRequest request) {
		Session session = null;
		HttpSession httpSession = request.getSession();
		UserLogin user = (UserLogin) httpSession.getAttribute("user");
		if (user == null)
			return "nologgedin";
		for (Product product : user.getCart()) {
			if (product.getId() == id) {
				try {
					session = factory.openSession();
					Product prod = (Product) session.get(Product.class, id);
					if (prod.getQuantity() <= product.getQuantity() || prod.getQuantity() == 0) {
						return "failquantity";
					}
				} catch (Exception e) {
					// TODO: handle exception
					if (session != null) {
						session.close();
					}
				}
				product.setQuantity(product.getQuantity() + 1);
				return product.getQuantity() + "";
			}
		}
		return "0";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		return "client/sanpham/index";
	}

	@RequestMapping("product/search")
	public String Search(@RequestParam("srchTxt") String key, @RequestParam("srchOpt") String scope, ModelMap model) {
		Session session = null;
		try {
			session = factory.openSession();
			String hql = "";
			if (scope.equalsIgnoreCase("All")) {
				hql = "FROM Product WHERE name LIKE '%" + key + "%'";
			} else {
				hql = "FROM Product WHERE category.cate_id = " + scope + " AND name LIKE '%" + key + "%'";
			}
			Query query = session.createQuery(hql);
			model.addAttribute("prods", query.list());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "client/sanpham/products";
	}

	@Transactional
	@RequestMapping("product_details/{id}")
	public String product_details(ModelMap model, @PathVariable("id") int id) {
		Session session = null;
		Product product = null;
		String hql = "";
		try {
			session = factory.getCurrentSession();
			hql = "FROM Product WHERE id = '" + id + "'";
			Query query = session.createQuery(hql);
			product = (Product) query.list().get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("product", product);
		return "client/sanpham/product_details";
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@RequestMapping(value = "login", params = "btnLogin")
	public String login(@RequestParam("inputEmail") String username, @RequestParam("inputPassword") String password,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = null;
		Session session = null;
		List<UserLogin> users = null;
		String hql = "";
		try {
			session = factory.getCurrentSession();
			hql = "FROM UserLogin WHERE username = '" + username + "' AND password = '" + password + "'";
			Query query = session.createQuery(hql);
			users = query.list();
			if (users.size() > 0) {
				httpSession = request.getSession();
				httpSession.setAttribute("user", users.get(0));
				String from;
				if (httpSession.getAttribute("from") == null) {
					from = "index.htm";
				} else {
					from = httpSession.getAttribute("from").toString();
				}
				return "redirect:/" + from;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user-login.htm";
	}

	@RequestMapping("user-login")
	public String user_login() {
		return "client/sanpham/user-login";
	}

	@Transactional
	@RequestMapping(value = "logout", params = "btnLogout")
	public String logout(HttpServletRequest request) {
		HttpSession httpSession = null;
		try {
			httpSession = request.getSession();
			httpSession.removeAttribute("user");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String from;
		if (httpSession.getAttribute("from") == null) {
			from = "index.htm";
		} else {
			from = httpSession.getAttribute("from").toString();
		}
		return "redirect:/" + from;
	}

	@Transactional
	@RequestMapping("product/summary")
	public String summary(HttpServletRequest request) {
		HttpSession httpSession = null;
		try {
			httpSession = request.getSession();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "client/sanpham/product_summary";
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@RequestMapping("category/{cate_id}")
	public String prods(ModelMap model, @PathVariable("cate_id") String cate_id) {
		Session session = null;
		List<Product> products = null;
		String hql = "";
		try {
			session = factory.getCurrentSession();
			hql = "FROM Product WHERE category.cate_id = " + cate_id + "";
			Query query = session.createQuery(hql);
			products = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("prods", products);
		return "client/sanpham/products";
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("fullfaces")
	public List<Product> fullfaces() {
		Session session = null;
		List<Product> products = null;
		try {
			session = factory.openSession();
			String hql = "FROM Product ORDER BY id DESC";
			Query query = session.createQuery(hql);
			products = query.list();
			for (int i = 0; i < products.size(); i++) {
				if (!products.get(i).getCategory().getDescription().trim().equalsIgnoreCase("FULLFACE")) {
					products.remove(i);
					i--;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return products;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("categorys")
	public List<Category> categorys() {
		Session session = null;
		List<Category> categorys = null;
		try {
			session = factory.openSession();
			String hql = "FROM Category";
			Query query = session.createQuery(hql);
			categorys = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		for (int i = 0; i < categorys.size(); i++) {
			if (categorys.get(i).getDescription().trim().equalsIgnoreCase("SLIDE")) {
				categorys.remove(i);
				i--;
			}
		}
		return categorys;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("featured")
	public List<Product> featured() {
		Session session = null;
		List<Product> products = null;
		try {
			session = factory.openSession();
			String hql = "FROM Product ORDER BY id DESC";
			Query query = session.createQuery(hql);
			products = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return products;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("products")
	public List<Product> products() {
		Session session = null;
		List<Product> products = null;
		try {
			session = factory.openSession();
			String hql = "FROM Product ORDER BY id DESC";
			Query query = session.createQuery(hql);
			products = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return products;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("relatedProducts")
	public List<Product> relatedProducts(HttpServletRequest request) {
		Session session = null;
		List<Product> products = new ArrayList<Product>();
		try {
			session = factory.openSession();
			if (request.getSession().getAttribute("from") != null) {
				String from = request.getSession().getAttribute("from").toString();
				int id = Integer.parseInt(from.substring(from.lastIndexOf("/") + 1, from.lastIndexOf(".")));
				String hql = "FROM Product WHERE id = " + id;
				Query query = session.createQuery(hql);
				List<Product> list = query.list();
				if (list.size() > 0) {
					Product product = (Product) query.list().get(0);
					hql = "FROM Product WHERE cate_id = " + product.getCategory().getCate_id();
					query = session.createQuery(hql);
					products = query.list();
					products = products.subList(0, Math.min(6, products.size()));
				}

			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return products;
	}

	@ModelAttribute("carts")
	public List<Product> carts(HttpSession session) {
		UserLogin user = (UserLogin) session.getAttribute("user");
		if (user != null) {
			List<Product> prods = products();
			for (Product product : user.getCart()) {
				for (Product product2 : prods) {
					if (product.getId() == product2.getId()) {
						product.setDes(product2.getDes());
						product.setPrice(product2.getPrice());
						product.setImages(product2.getImages());
						product.setName(product2.getName());
						break;
					}
				}
			}
			return user.getCart();
		}
		return new ArrayList<>();
	}
}
