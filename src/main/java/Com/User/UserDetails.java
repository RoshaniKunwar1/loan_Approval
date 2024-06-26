package Com.User;

public class UserDetails{
	private int id;
	private String name;
	private String email;
	private double phone;
	private String password;
	
	public UserDetails() {
		super();
	}

	public UserDetails(int id, String name, String email,double phone, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getPhone() {
		return phone;
	}
	
	public void setPhone(double phone) {
		this.phone = phone;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "UserDetails [name=" + name + ", email=" + email + ", phone="+phone+" password=" + password + "]";
	}	
}