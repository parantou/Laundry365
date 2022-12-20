package com.acorn.boram.users.dto;

public class LsgUsersDto {
	private String id;
	private String pwd;
	private String newPwd;
	private String name;
	private int countryCode;
	private String phone;
	private String email;
	private String profile;
	private String addr;
	private String regdate;
	private String manager;
	//아이디 저장여부
	private boolean saveId;
	//페이징 처리
	private int startRowNum;
	private int endRowNum;
	
	public LsgUsersDto() {}

	public LsgUsersDto(String id, String pwd, String newPwd, String name, int countryCode, String phone, String email,
			String profile, String addr, String regdate, String manager, boolean saveId, int startRowNum,
			int endRowNum) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.newPwd = newPwd;
		this.name = name;
		this.countryCode = countryCode;
		this.phone = phone;
		this.email = email;
		this.profile = profile;
		this.addr = addr;
		this.regdate = regdate;
		this.manager = manager;
		this.saveId = saveId;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public boolean isSaveId() {
		return saveId;
	}

	public void setSaveId(boolean saveId) {
		this.saveId = saveId;
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
