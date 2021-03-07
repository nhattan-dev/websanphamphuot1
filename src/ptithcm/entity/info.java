package ptithcm.entity;

public class info {
	private String message;
	private int id;
	private int quantity;

	public info(String message, int id, int quantity) {
		super();
		this.message = message;
		this.id = id;
		this.quantity = quantity;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
