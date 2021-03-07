package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Cart {
	@Id
	private int id;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date buyDate;
	@ManyToOne
	@JoinColumn(name = "u_id")
	UserLogin user;
	@OneToMany(mappedBy = "cart_id", fetch = FetchType.EAGER)
	Collection<CartItem> cartItems;

	public Cart() {
	}

	public Cart(int id, Date buyDate, UserLogin user) {
		super();
		this.id = id;
		this.buyDate = buyDate;
		this.user = user;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public Collection<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Collection<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public UserLogin getUser() {
		return user;
	}

	public void setUser(UserLogin user) {
		this.user = user;
	}

}
