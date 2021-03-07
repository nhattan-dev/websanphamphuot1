package ptithcm.entity;

import org.springframework.web.multipart.MultipartFile;

public class UserLoginForAdd {
	private int id;
	private String email;
	private String username;
	private String password;
	private String confirm;
	private MultipartFile avatar;
	private String avatarString;

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
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

	public MultipartFile getAvatar() {
		return avatar;
	}

	public void setAvatar(MultipartFile avatar) {
		this.avatar = avatar;
	}

	public String getAvatarString() {
		return avatarString;
	}

	public void setAvatarString(String avatarString) {
		this.avatarString = avatarString;
	}
}
