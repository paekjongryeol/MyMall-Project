package com.mall.table.vo;

public class InquiryInfoVO extends PageVO{

	private String userId;			//회원아이디
	private String userName;		//회원명
	private String boardSeq;		//문의순번
	private String boardType;		//문의유형
	private String title;			//제목
	private String content;			//내용
	private String attchFile;		//첨부파일
	private String replyYn;			//답변여부
	private String replyContent;	//답변내용
	private String regDt;			//등록일
	private String delYn;			//삭제여부
	private String replyDt;			//답변등록일
	
	
	//조건추가
	private String regDtFrom;	//등록일From
	private String regDtTo;		//등록일To
	
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRegDtFrom() {
		return regDtFrom;
	}
	public void setRegDtFrom(String regDtFrom) {
		this.regDtFrom = regDtFrom;
	}
	public String getRegDtTo() {
		return regDtTo;
	}
	public void setRegDtTo(String regDtTo) {
		this.regDtTo = regDtTo;
	}
	public String getReplyDt() {
		return replyDt;
	}
	public void setReplyDt(String replyDt) {
		this.replyDt = replyDt;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAttchFile() {
		return attchFile;
	}
	public void setAttchFile(String attchFile) {
		this.attchFile = attchFile;
	}
	public String getReplyYn() {
		return replyYn;
	}
	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	
	
}
