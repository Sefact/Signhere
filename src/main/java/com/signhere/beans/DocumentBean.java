package com.signhere.beans;

import java.util.Date;

import lombok.Data;

@Data
public class DocumentBean {
	private String dmNum;
	private String apCode;
	private String apName;
	private String cmCode;
	private String cmName;
	private String dmWriteId;
	private String dmWriter;
	private String dmTitle;
	private Date dmDate;
	private String dmCode;
	private String dmName;
}