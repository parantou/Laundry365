package com.acorn.boram.qna.dto;

public class HyrQnaReplyDto {
	private int rnum;
	private int ref_num;
	private String writer;
	private String content;
	private String regdate;


public HyrQnaReplyDto() {}


public HyrQnaReplyDto(int rnum, int ref_num, String writer, String content, String regdate) {
	super();
	this.rnum = rnum;
	this.ref_num = ref_num;
	this.writer = writer;
	this.content = content;
	this.regdate = regdate;
}


public int getRnum() {
	return rnum;
}


public void setRnum(int rnum) {
	this.rnum = rnum;
}


public int getRef_num() {
	return ref_num;
}


public void setRef_num(int ref_num) {
	this.ref_num = ref_num;
}


public String getWriter() {
	return writer;
}


public void setWriter(String writer) {
	this.writer = writer;
}


public String getContent() {
	return content;
}


public void setContent(String content) {
	this.content = content;
}


public String getRegdate() {
	return regdate;
}


public void setRegdate(String regdate) {
	this.regdate = regdate;
}

}
