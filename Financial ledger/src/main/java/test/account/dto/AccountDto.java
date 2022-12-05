package test.account.dto;

public class AccountDto {
	
	private String contents;
	private String income;
	private String expenditure;
	private String regdate;
	
	//페이징 처리할때 필요한 필드
	private int startRowNum;
	private int endRowNum;
	
	public AccountDto() {}

	public AccountDto(String contents, String income, String expenditure, String regdate, int startRowNum,
			int endRowNum) {
		super();
		this.contents = contents;
		this.income = income;
		this.expenditure = expenditure;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getIncome() {
		return income;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getExpenditure() {
		return expenditure;
	}

	public void setExpenditure(String expenditure) {
		this.expenditure = expenditure;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	
	
}
