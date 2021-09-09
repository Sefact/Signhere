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
	private String cmCode;
	private String cmName;
	//아마도 회사와 직급과 부서가 PK FK로 엮여있던 시절의 빈임
	private List<CompanyBean> company;
}