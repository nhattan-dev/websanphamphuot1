package ptithcm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Category;
import ptithcm.entity.Image;
import ptithcm.entity.Product;
import ptithcm.entity.ProductForAdd;
import ptithcm.entity.UserLogin;

@SuppressWarnings("unused")
@Controller
@RequestMapping("")
public class AdminController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

	@RequestMapping("admin")
	public String index(ModelMap model) {
		return "admin/admin";
	}

	@RequestMapping("insert-product")
	public String insert_product(ModelMap model) {
//		Session session = factory.openSession();
//		Query query = session.createQuery("SELECT MAX(id) FROM Product");
//		int max = 1;
//		try {
//			max = (int) query.uniqueResult() + 1;
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		ProductForAdd product = new ProductForAdd();
//		product.setId(max);
		model.addAttribute("newProd", product);
		return "admin/insert-product";
	}

	@RequestMapping("insert-cate")
	public String insert_Category(ModelMap model) {
		Session session = factory.openSession();
		Query query = session.createQuery("SELECT MAX(id) FROM Category");
		int max = 1;
		try {
			max = (int) query.uniqueResult() + 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		Category category = new Category();
		category.setCate_id(max);
		model.addAttribute("newCate", category);
		return "admin/insert-cate";
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

	private boolean isValid_Product(ProductForAdd product, BindingResult errors) {
		if (product.getName().trim().equals("")) {
			errors.rejectValue("name", "newProd", "Không được để trống tên sản phẩm !");
		}
		try {
			if (product.getQuantity() < 0) {
				errors.rejectValue("quantity", "newProd", "Số lượng >= 0 !");
			}
		} catch (Exception e) {
			errors.rejectValue("quantity", "newProd", "Nhập sai định dạng !");
		}
		try {
			if (product.getPrice() <= 0) {
				errors.rejectValue("price", "newProd", "Giá > 0 !");
			}
		} catch (Exception e) {
			errors.rejectValue("price", "newProd", "Nhập sai định dạng !");
		}
		if (product.getImg1().isEmpty()) {
			errors.rejectValue("img1", "newProd", "Vui lòng nhập ảnh 1 !");
		} else {
			String a1PathString = product.getImg1().getOriginalFilename()
					.substring(product.getImg1().getOriginalFilename().indexOf(".") + 1);
			if (!(a1PathString.equalsIgnoreCase("JPG") || a1PathString.equalsIgnoreCase("PNG"))) {
				errors.rejectValue("img1", "newProd", "Chỉ nhận file .jpg hoặc .png !");
			}
		}
		if (product.getImg2().isEmpty()) {
			errors.rejectValue("img2", "newProd", "Vui lòng nhập ảnh 2 !");
		} else {
			String a2PathString = product.getImg2().getOriginalFilename()
					.substring(product.getImg2().getOriginalFilename().indexOf(".") + 1);
			if (!(a2PathString.equalsIgnoreCase("JPG") || a2PathString.equalsIgnoreCase("PNG"))) {
				errors.rejectValue("img2", "newProd", "Ảnh 2: Chỉ nhận file .jpg hoặc .png !");
			}
		}
		if (product.getImg3().isEmpty()) {
			errors.rejectValue("img3", "newProd", "Vui lòng nhập ảnh 3 !");
		} else {
			String a3PathString = product.getImg3().getOriginalFilename()
					.substring(product.getImg3().getOriginalFilename().indexOf(".") + 1);
			if (!(a3PathString.equalsIgnoreCase("JPG") || a3PathString.equalsIgnoreCase("PNG"))) {
				errors.rejectValue("img3", "newProd", "Ảnh 3: Chỉ nhận file .jpg hoặc .png !");
			}
		}
		if (errors.hasErrors()) {
			return false;
		}
		return true;
	}

	private boolean isValid_Product_Edit(ProductForAdd product, BindingResult errors) {
//		System.out.println(product.getId());
//		System.out.println(product.getCate_id());
//		System.out.println(product.getDes());
//		System.out.println(product.getName());
//		System.out.println(product.getPrice());
//		System.out.println(product.getQuantity());
//		System.out.println(product.getImg1().isEmpty());
//		System.out.println(product.getImg2().getOriginalFilename());
//		System.out.println(product.getImg3().getOriginalFilename());
		if (product.getName().trim().equals("")) {
			errors.rejectValue("name", "product", "Không được để trống tên sản phẩm !");
		}
		try {
			if (product.getQuantity() < 0) {
				errors.rejectValue("quantity", "product", "Số lượng >= 0 !");
			}
		} catch (Exception e) {
			errors.rejectValue("quantity", "product", "Nhập sai định dạng !");
		}
		try {
			if (product.getPrice() <= 0) {
				errors.rejectValue("price", "product", "Giá > 0 !");
			}
		} catch (Exception e) {
			errors.rejectValue("price", "product", "Nhập sai định dạng !");
		}
		if (product.getImg1().isEmpty()) {
			if (product.getImgString1().equals("")) {
				errors.rejectValue("img1", "product", "Vui lòng nhập ảnh 1 !");
			}
		} else {
			String a1PathString = product.getImg1().getOriginalFilename()
					.substring(product.getImg1().getOriginalFilename().indexOf(".") + 1);
			if (!(a1PathString.equalsIgnoreCase("JPG") || a1PathString.equalsIgnoreCase("PNG"))) {
				errors.rejectValue("img1", "product", "Chỉ nhận file .jpg hoặc .png !");
			}
		}
		if (product.getImg2().isEmpty()) {
			if (product.getImgString2().equals("")) {
				errors.rejectValue("img2", "product", "Vui lòng nhập ảnh 2 !");
			}
		} else {
			String a2PathString = product.getImg2().getOriginalFilename()
					.substring(product.getImg2().getOriginalFilename().indexOf(".") + 1);
			if (!(a2PathString.equalsIgnoreCase("JPG") || a2PathString.equalsIgnoreCase("PNG"))) {
				errors.rejectValue("img2", "product", "Ảnh 2: Chỉ nhận file .jpg hoặc .png !");
			}
		}
		if (product.getImg3().isEmpty()) {
			if (product.getImgString3().equals("")) {
//				product.setImg1(createMultipartFile(product.getImgString1()));
				errors.rejectValue("img3", "product", "Vui lòng nhập ảnh 3 !");
			}
		} else {
			String a3PathString = product.getImg3().getOriginalFilename()
					.substring(product.getImg3().getOriginalFilename().indexOf(".") + 1);
			if (!(a3PathString.equalsIgnoreCase("JPG") || a3PathString.equalsIgnoreCase("PNG"))) {
				errors.rejectValue("img3", "product", "Ảnh 3: Chỉ nhận file .jpg hoặc .png !");
			}
		}
		if (errors.hasErrors()) {
			return false;
		}
		return true;
	}

//	private boolean isValid_Product(Product product, BindingResult errors) {
//		if (product.getName().trim().equals("")) {
//			errors.rejectValue("name", "newProd", "Không được để trống tên sản phẩm !");
//		}
//		try {
//			if (product.getQuantity() < 0) {
//				errors.rejectValue("quantity", "newProd", "Số lượng >= 0 !");
//			}
//		} catch (Exception e) {
//			errors.rejectValue("quantity", "newProd", "Nhập sai định dạng !");
//		}
//		try {
//			if (product.getQuantity() <= 0) {
//				errors.rejectValue("price", "newProd", "Giá > 0 !");
//			}
//		} catch (Exception e) {
//			errors.rejectValue("price", "newProd", "Nhập sai định dạng !");
//		}
//		if (errors.hasErrors()) {
//			return false;
//		}
//		return true;
//	}

	@RequestMapping(value = "save-product", params = "btnSave")
	public String save_product(@ModelAttribute("newProd") ProductForAdd product, BindingResult errors) {
		if (isValid_Product(product, errors)) {
			Session session = null;
			Transaction transaction = null;
			try {
				session = factory.openSession();
				Query query = session.createQuery("SELECT MAX(id) FROM Product");
				int id = 1;
				try {
					id = (int) query.uniqueResult() + 1;
				} catch (Exception e) {
				}
				transaction = session.beginTransaction();
				// transfer images to /images/
				String a1Path = context
						.getRealPath("./images/" + product.getCate_id() + "-" + id + "-1" + product.getImg1()
								.getOriginalFilename().substring(product.getImg1().getOriginalFilename().indexOf(".")));
				product.getImg1().transferTo(new File(a1Path));
				String a2Path = context
						.getRealPath("./images/" + product.getCate_id() + "-" + id + "-2" + product.getImg2()
								.getOriginalFilename().substring(product.getImg2().getOriginalFilename().indexOf(".")));
				product.getImg2().transferTo(new File(a2Path));
				String a3Path = context
						.getRealPath("./images/" + product.getCate_id() + "-" + id + "-3" + product.getImg3()
								.getOriginalFilename().substring(product.getImg3().getOriginalFilename().indexOf(".")));
				System.out.println("./images/" + product.getCate_id() + "-" + id + "-3" + product.getImg3()
						.getOriginalFilename().substring(product.getImg3().getOriginalFilename().indexOf(".")));
				product.getImg3().transferTo(new File(a3Path));
				// create object images
				Image img1 = new Image();
				Image img2 = new Image();
				Image img3 = new Image();
				String a1pString = product.getCate_id() + "-" + id + "-1" + product.getImg1().getOriginalFilename()
						.substring(product.getImg1().getOriginalFilename().indexOf("."));
				String a2pString = product.getCate_id() + "-" + id + "-2" + product.getImg2().getOriginalFilename()
						.substring(product.getImg2().getOriginalFilename().indexOf("."));
				String a3pString = product.getCate_id() + "-" + id + "-3" + product.getImg3().getOriginalFilename()
						.substring(product.getImg3().getOriginalFilename().indexOf("."));
				Product prod = new Product();
				prod.setId(id);
				img1.setImage(a1pString);
				img1.setProduct(prod);
				img2.setImage(a2pString);
				img2.setProduct(prod);
				img3.setImage(a3pString);
				img3.setProduct(prod);
				// save images
				session.save(img1);
				session.save(img2);
				session.save(img3);
				// save product
				prod.setId(id);
				Category category = new Category();
				category.setCate_id(product.getCate_id());
				prod.setCategory(category);
				prod.setDes(product.getDes());
				prod.setName(product.getName());
				prod.setPrice(product.getPrice());
				prod.setQuantity(product.getQuantity());

				session.save(prod);
				transaction.commit();
				return "redirect:/admin.htm";
			} catch (Exception e) {
				e.printStackTrace();
				if (transaction != null)
					transaction.rollback();
			} finally {
				session.close();
			}
		}

		return "admin/insert-product";
	}

	@RequestMapping(value = "save-product", params = "btnExit")
	public String exit_Product() {
		return "redirect:/admin.htm";
	}

	@RequestMapping(value = "save-product", params = "btnReset")
	public String reset_product(@ModelAttribute("newProd") ProductForAdd product) {
		product.setDes("");
		product.setName("");
		product.setPrice(0);
		product.setQuantity(0);
		return "admin/insert-product";
	}

	@RequestMapping("edit-product/{id}")
	public String edit_Product(@PathVariable("id") int id, ModelMap model) {
		Session session = null;
		try {
			session = factory.openSession();
			Product product = (Product) session.get(Product.class, id);
//			ArrayList<Image> list = new ArrayList<Image>(product.getImages());
//			MultipartFile a1 = createMultipartFile(list.get(0).getImage());
//			MultipartFile a2 = createMultipartFile(list.get(1).getImage());
//			MultipartFile a3 = createMultipartFile(list.get(2).getImage());
//			ProductFAKE productFAKE = new ProductFAKE(product, a1, a2, a3);
			ProductForAdd prod = new ProductForAdd();
			try {
				prod.setImg1(createMultipartFile(new ArrayList<>(product.getImages()).get(0).getImage()));
				prod.setImg2(createMultipartFile(new ArrayList<>(product.getImages()).get(1).getImage()));
				prod.setImg3(createMultipartFile(new ArrayList<>(product.getImages()).get(2).getImage()));
			} catch (Exception e) {
			}
			try {
				prod.setImgString1(prod.getImg1().getOriginalFilename());
				prod.setImgString2(prod.getImg2().getOriginalFilename());
				prod.setImgString3(prod.getImg3().getOriginalFilename());
			} catch (Exception e) {
			}
			prod.setCate_id(product.getCategory().getCate_id());
			prod.setDes(product.getDes());
			prod.setId(product.getId());
			prod.setName(product.getName());
			prod.setPrice(product.getPrice());
			prod.setQuantity(product.getQuantity());
			model.addAttribute("product", prod);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "admin/edit-product";
	}

	private MultipartFile createMultipartFile(String path) {
		File file = null;
		InputStream inputStream = null;
		try {
			inputStream = new FileInputStream(new File(context.getRealPath("/images/" + path)));
			return new MockMultipartFile("file", path, "text/plain",
					org.apache.commons.io.IOUtils.toByteArray(inputStream));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "edit-product/check", params = "btnSave")
	public String edit_Product(@ModelAttribute("product") ProductForAdd product, BindingResult errors) {
		Session session = null;
		Transaction transaction = null;
		try {
			if (product.getImg1().isEmpty())
				product.setImg1(createMultipartFile(product.getImgString1()));
			if (product.getImg2().isEmpty())
				product.setImg2(createMultipartFile(product.getImgString2()));
			if (product.getImg3().isEmpty())
				product.setImg3(createMultipartFile(product.getImgString3()));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (isValid_Product_Edit(product, errors)) {
			try {
				session = factory.openSession();
				transaction = session.beginTransaction();
				// update product
				Product prod = new Product();
				prod.setId(product.getId());
				Category category = new Category();
				category.setCate_id(product.getCate_id());
				prod.setCategory(category);
				prod.setDes(product.getDes());
				prod.setName(product.getName());
				prod.setPrice(product.getPrice());
				prod.setQuantity(product.getQuantity());
				System.out.println(product.getImg2().getOriginalFilename());
				session.update(prod);
				// update img
				if (!product.getImg1().isEmpty() || !product.getImg2().isEmpty() || !product.getImg3().isEmpty()) {
					Query query = session.createQuery("FROM Image WHERE pro_id = " + product.getId() + " ORDER BY id ");
					List<Image> list = query.list();
					Image img1 = list.get(0);
					Image img2 = list.get(1);
					Image img3 = list.get(2);
					if (!product.getImg1().isEmpty()) {
						// save to disk
						String a1Path = context.getRealPath("./images/" + img1.getImage());
						product.getImg1().transferTo(new File(a1Path));
						session.update(img1);
					}
					if (!product.getImg2().isEmpty()) {
						// save to disk
						String a2Path = context.getRealPath("./images/" + img2.getImage());
						product.getImg2().transferTo(new File(a2Path));
						session.update(img2);
					}
					if (!product.getImg3().isEmpty()) {
						// save to disk
						String a3Path = context.getRealPath("./images/" + img3.getImage());
						product.getImg3().transferTo(new File(a3Path));
						session.update(img3);
					}
				}
				transaction.commit();
				return "redirect:/admin.htm";
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();
			} finally {
				session.close();
			}

		}
		return "admin/edit-product";
	}

	@RequestMapping(value = "edit-product/check", params = "btnReset")
	public String reset_edit_Product(@ModelAttribute("product") ProductForAdd product) {
		return "redirect:/edit-product/" + product.getId() + ".htm";
	}

	@RequestMapping(value = "edit-product/check", params = "btnExit")
	public String edit_Product() {
		return "redirect:/admin.htm";
	}

	@RequestMapping("delete-product/{id}")
	@ResponseBody
	public String delete_Product(@PathVariable("id") int id, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		UserLogin user = (UserLogin) httpSession.getAttribute("user");
		if (user == null)
			return "nologgedin";
		Session session = null;
		Transaction transaction = null;
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			Product product = (Product) session.get(Product.class, id);
			deleteImagebyProduct(id);
			session.delete(product);
			transaction.commit();
			return "done";
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "fail";
	}

	@RequestMapping("delete-cate/{id}")
	@ResponseBody
	public String delete_Category(@PathVariable("id") String id, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		UserLogin user = (UserLogin) httpSession.getAttribute("user");
		if (user == null)
			return "nologgedin";
		Session session = null;
		Transaction transaction = null;
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Category WHERE cate_id = '" + id + "'");
			Category category = (Category) query.list().get(0);
			// delete image
			for (Product product : category.getProducts()) {
				deleteImagebyProduct(product.getId());
				session.delete(product);
			}
			session.delete(category);
			transaction.commit();
			return "done";
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "fail";
	}

	@SuppressWarnings("unchecked")
	private void deleteImagebyProduct(int prod_id) {
		Session session = null;
		Transaction transaction = null;
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Image WHERE pro_id = " + prod_id);
			List<Image> list = query.list();
			for (Image image : list) {
				session.delete(image);
			}
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		} finally {
			session.close();
		}
	}

	private boolean isValid_Category(Category category, BindingResult errors) {
		if (category.getCate_name().trim().equals("")) {
			errors.rejectValue("cate_name", "newCate", "Không được để trống tên loại !");
		}
		if (category.getCate_id() == 0) {
			errors.rejectValue("cate_id", "newCate", "Không được để trống mã loại !");
		}
		if (errors.hasErrors()) {
			return false;
		}
		return true;
	}

	private boolean isExist_Category(Category category, BindingResult errors) {
		Session session = null;
		Category cate = null;
		try {
			session = factory.openSession();
			cate = (Category) session.get(Category.class, category.getCate_id());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (cate != null) {
			errors.rejectValue("cate_id", "newCate", "Mã loại đã tồn tại !");
		}
		if (errors.hasErrors()) {
			return false;
		}
		return true;
	}

	@RequestMapping(value = "save-cate", params = "btnSave")
	public String save_Category(@ModelAttribute("newCate") Category category, BindingResult errors) {
		if (isValid_Category(category, errors) && isExist_Category(category, errors)) {
			Session session = null;
			Transaction transaction = null;
			try {
				session = factory.openSession();
				transaction = session.beginTransaction();
				category.setCate_id(category.getCate_id());
				category.setDescription("");
				session.save(category);
				transaction.commit();
				return "redirect:/admin.htm";
			} catch (Exception e) {
				transaction.rollback();
				e.printStackTrace();
			} finally {
				session.close();
			}
		}
		return "admin/insert-cate";
	}

	@RequestMapping(value = "save-cate", params = "btnExit")
	public String exit_Category() {
		return "redirect:/admin.htm";
	}

	@RequestMapping(value = "save-cate", params = "btnReset")
	public String reset_Category(@ModelAttribute("newCate") Category category) {
		category.setCate_name("");
		return "admin/insert-cate";
	}

	@RequestMapping("edit-cate/{id}")
	public String edit_Category(@PathVariable("id") int id, ModelMap model) {
		Session session = null;
		try {
			session = factory.openSession();
			Category category = (Category) session.get(Category.class, id);
			model.addAttribute("category", category);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "admin/edit-cate";
	}

	@RequestMapping(value = "edit-cate/check", params = "btnSave")
	public String edit_Category(@ModelAttribute("category") Category category, BindingResult errors) {
		Session session = null;
		Transaction transaction = null;
		if (isValid_Category(category, errors)) {
			try {
				session = factory.openSession();
				transaction = session.beginTransaction();
				session.update(category);
				transaction.commit();
				return "redirect:/admin.htm";
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();
			} finally {
				session.close();
			}
		}
		return "admin/edit-cate";
	}

	@RequestMapping(value = "edit-cate/check", params = "btnReset")
	public String reset_edit_Category(@ModelAttribute("category") Category category) {
		return "redirect:/edit-cate/" + category.getCate_id() + ".htm";
	}

	@RequestMapping(value = "edit-cate/check", params = "btnExit")
	public String edit_Category() {
		return "redirect:/admin.htm";
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("categories")
	public List<Category> categories() {
		Session session = null;
		List<Category> categories = null;
		try {
			session = factory.openSession();
			String hql = "FROM Category ORDER BY cate_id DESC";
			Query query = session.createQuery(hql);
			categories = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		for (int i = 0; i < categories.size(); i++) {
			if (categories.get(i).getDescription().trim().equalsIgnoreCase("SLIDE")) {
				categories.remove(i);
				i--;
			}
		}
		return categories;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("userlogin")
	public List<UserLogin> userlogin() {
		Session session = null;
		List<UserLogin> users = null;
		try {
			session = factory.openSession();
			String hql = "FROM UserLogin ORDER BY id DESC";
			Query query = session.createQuery(hql);
			users = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return users;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("categoriesS")
	public Map<Category, String> categoriesS() {
		Session session = null;
		List<Category> categories = null;
		Map<Category, String> categoriesMap = new HashMap<Category, String>();
		try {
			session = factory.openSession();
			String hql = "FROM Category";
			Query query = session.createQuery(hql);
			categories = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		for (int i = 0; i < categories.size(); i++) {
			if (categories.get(i).getDescription().trim().equalsIgnoreCase("SLIDE")) {
				categories.remove(i);
				i--;
			}
		}
		for (Category category : categories) {
			categoriesMap.put(category, category.getCate_name());
		}
		return categoriesMap;
	}
}
