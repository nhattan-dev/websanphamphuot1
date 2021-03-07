package ptithcm.entity;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

enum UserType {
	USER, ADMIN
}

@Entity
public class UserLogin {
	@Id
	@GeneratedValue
	private int id;
	private String email;
	private String username;
	private String password;
	private String avatar;
	private String role_id;
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	Collection<Cart> carts;
	@Transient
	private ArrayList<Product> cart = new ArrayList<Product>();

	public float totalPrice() {
		int s = 0;
		for (Product product : cart) {
			s += (product.getQuantity() * product.getPrice());
		}
		return s;
	}

	public ArrayList<Product> getCart() {
		return cart;
	}

	public void setCart(ArrayList<Product> cart) {
		this.cart = cart;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Collection<Cart> getCarts() {
		return carts;
	}

	public void setCarts(Collection<Cart> carts) {
		this.carts = carts;
	}

}
