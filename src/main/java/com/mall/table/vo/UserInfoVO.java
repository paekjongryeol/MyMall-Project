package com.mall.table.vo;

public class UserInfoVO {
	private String userId;		//회원ID	
	private String userName;	//회원명
	private String userPwd;		//패스워드
	private String phone;		//연락처
	private String email;		//이메일
	private String addr;		//주소
	private String addrDtl;		//주소상세
	private String withdrawYn;		//탈퇴여부
	private String withdrawDt;		//탈퇴일
	private String joinDt;		//가입일
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getWithdrawYn() {
		return withdrawYn;
	}
	public void setWithdrawYn(String withdrawYn) {
		this.withdrawYn = withdrawYn;
	}
	public String getWithdrawDt() {
		return withdrawDt;
	}
	public void setWithdrawDt(String withdrawDt) {
		this.withdrawDt = withdrawDt;
	}
	public String getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(String joinDt) {
		this.joinDt = joinDt;
	}
	
	
}
