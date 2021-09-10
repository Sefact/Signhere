package com.signhere.beans;

import lombok.Data;

@Data
public class AccessBean {
	private String userId;
	private String userName;
	private String userPwd;
	private String userMail;
	private String publicIp;
	private String privateIp;
	private String method;
	private String admin;
	private String pwInitial;
	private String cmCode;
	private String cmName;
	private String dpName;
	private String dpCode;
	private String grCode;
	private String grName;
	private String browser;
}
