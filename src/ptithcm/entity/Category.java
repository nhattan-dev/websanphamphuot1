package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	private int cate_id;
	private String cate_name;
	private String description;
	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	Collection<Product> products;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public Collection<Product> getProducts() {
		return products;
	}

	public void setProducts(Collection<Product> products) {
		this.products = products;
	}
}
