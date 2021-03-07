package ptithcm.entity;

import org.springframework.web.multipart.MultipartFile;

public class ProductForAdd {
	private int id;
	private String name;
	private float price;
	private String des;
	private int quantity;
	private int cate_id;
	private MultipartFile img1;
	private MultipartFile img2;
	private MultipartFile img3;
	private String imgString1;
	private String imgString2;
	private String imgString3;

	public String getImgString1() {
		return imgString1;
	}

	public void setImgString1(String imgString1) {
		this.imgString1 = imgString1;
	}

	public String getImgString2() {
		return imgString2;
	}

	public void setImgString2(String imgString2) {
		this.imgString2 = imgString2;
	}

	public String getImgString3() {
		return imgString3;
	}

	public void setImgString3(String imgString3) {
		this.imgString3 = imgString3;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	public MultipartFile getImg1() {
		return img1;
	}

	public void setImg1(MultipartFile img1) {
		this.img1 = img1;
	}

	public MultipartFile getImg2() {
		return img2;
	}

	public void setImg2(MultipartFile img2) {
		this.img2 = img2;
	}

	public MultipartFile getImg3() {
		return img3;
	}

	public void setImg3(MultipartFile img3) {
		this.img3 = img3;
	}

}
