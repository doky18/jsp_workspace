package com.jspshop.util;


public class MessageObject {
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	private int code;		//성공 또는 실패를 식별하는 식별코드 1,0
	private String msg;		//클라이언트에게 전송하고픈 말
	
}
