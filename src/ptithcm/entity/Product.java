package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Product {
	@Id
	private int id;
	private String name;
	private float price;
	private String des;
	private int quantity;
	@ManyToOne
	@JoinColumn(name = "cate_id")
	Category category;
	@OneToMany(mappedBy = "pro_id", fetch = FetchType.EAGER)
	Collection<CartItem> cartItems;
	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	Collection<Image> images;
//	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
//	Collection<Color> colors;

//	public Collection<Color> getColors() {
//		return colors;
//	}
//
//	public void setColors(Collection<Color> colors) {
//		this.colors = colors;
//	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Collection<Image> getImages() {
		return images;
	}

	public void setImages(Collection<Image> images) {
		this.images = images;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Collection<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Collection<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
}
