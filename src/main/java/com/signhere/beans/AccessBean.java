package com.signhere.beans;

import lombok.Data;

@Data
public class AccessBean {
	private String userId;
	private String userPwd;
	private String publicIp;
	private String privateIp;
	private String method;
	private String admin;
	private String pwInitial;
	private String cmCode;
	private String browser;
}
