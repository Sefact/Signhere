package com.signhere.beans;

import java.util.List;

import lombok.Data;

@Data
public class UserBean {
	private String userId;
	private String userPwd;
	private String userName;
	private String userMail;
	private int pwInital;
	private String admin;
	private String dpCode;
	private String dpName;
	private String grCode;
	private String grName;
	private List<CompanyBean> company;
}

