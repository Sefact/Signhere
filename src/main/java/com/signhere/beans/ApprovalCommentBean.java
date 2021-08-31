package com.signhere.beans;

import java.util.Date;

import lombok.Data;

@Data
public class ApprovalCommentBean {
	private String dmNum;
	private String  acReason;
	private String acId;
	private String acName;
	private Date acDate;
}
