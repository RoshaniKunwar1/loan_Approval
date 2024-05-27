package Com.User;

public class calculate{
	private int id;
	private String  name;
	private String email;
	private String phone;
	private String amount;
	private double interest;
	private String months;
	private double emi;
	private String loantype;
	
	public calculate(int id, String name, String email, String phone, double emi, String amount, double interest, String months, String loantype) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.emi = emi;
		this.amount = amount;
		this.interest = interest;
		this.months = months;
		this.loantype = loantype;
	}


	public calculate() {
		super();
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


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public double getEmi() {
		return emi;
	}


	public void setEmi(double emi) {
		this.emi = emi;
	}

	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}


	public double getInterest() {
		return interest;
	}


	public void setInterest(double interest) {
		this.interest = interest;
	}


	public String getMonths() {
		return months;
	}


	public void setMonths(String months) {
		this.months = months;
	}


	public String getLoantype() {
		return loantype;
	}


	public void setLoantype(String loantype) {
		this.loantype = loantype;
	}


	@Override
	public String toString() {
		return "calculate [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", amount=" + amount
				+ ", interest=" + interest + ", months=" + months + ", emi=" + emi + ", loantype=" + loantype + "]";
	}


	
}