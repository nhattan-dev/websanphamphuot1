package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity
@IdClass(CartItemID.class)
public class CartItem {
	@Id
	private int pro_id;
	@Id
	private int cart_id;
	private int quantity;
	private float unitprice;

	public CartItem() {
		super();
	}

	public CartItem(int pro_id, int cart_id, int quantity, float unitprice) {
		this.pro_id = pro_id;
		this.cart_id = cart_id;
		this.quantity = quantity;
		this.unitprice = unitprice;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public float getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(float unitprice) {
		this.unitprice = unitprice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getUnitPrice() {
		return unitprice;
	}

	public void setUnitPrice(float unitPrice) {
		this.unitprice = unitPrice;
	}

}
