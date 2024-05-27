package Com.User;

public class loanList{
	private loan ln;
	private String name;
	private String approval;
	private int id;
	private int id3;
	
	
	
	public loanList(loan ln, String name, String approval, int id, int id3) {
		super();
		this.ln = ln;
		this.name = name;
		this.approval = approval;
		this.id = id;
		this.id3 = id3;
	}


	public loanList() {
		super();
	}

	public loan getLn() {
		return ln;
	}

	public void setLn(loan ln) {
		this.ln = ln;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getApproval() {
		return approval;
	}



	public void setApproval(String approval) {
		this.approval = approval;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}
	
	
	public int getId3() {
		return id3;
	}



	public void setId3(int id3) {
		this.id3 = id3;
	}
}