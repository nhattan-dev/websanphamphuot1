package ptithcm.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class CartItemID implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6483402796889283112L;
	protected int pro_id;
	protected int cart_id;

	public CartItemID() {
		super();
	}

	public CartItemID(int pro_id, int cat_id) {
		super();
		this.pro_id = pro_id;
		this.cart_id = cat_id;
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}
}
