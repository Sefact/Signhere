package com.signhere.beans;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class DocumentBean {
	private String dmNum;
	private String dmNumCheck;
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
	//APPROVALLINE테이블의 APPROVAL_ID가 담길 BEAN
	private String apId;
	//REFERENCE 테이블의 REFERENCE_ID가 담길 BEAN
	private String refId;
	//REFERENCE 테이블의 READING_ID가 담길 BEAN
	private String readingId;
	//APPROVALLINE테이블의 APPROVAL_SEQ가 담길 BEAN
	private int aplSeq;
	private char searchCode;
	private String[] dmNumArr;
	private List<ApprovalBean> aplBean;
	private List<ReadingReferenceBean> rfBean;
}