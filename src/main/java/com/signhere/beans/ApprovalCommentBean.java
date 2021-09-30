package com.signhere.beans;

import java.util.Date;

import lombok.Data;

@Data
public class ApprovalCommentBean {
	
	private String dmNum;
	private String dpName;
	private String grName;	
	private String acContents;
	private String acId;
	private String acName;
	private Date acDate;
}
