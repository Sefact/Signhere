package com.signhere.beans;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
	private String dmDate;
	private String dmDate2;
	private String dmCode;
	private String dmName;
	private char searchCode;
	private String[] dmNumArr;
}