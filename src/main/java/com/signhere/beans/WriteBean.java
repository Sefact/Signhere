package com.signhere.beans;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class WriteBean {
	/* 문서(문서번호, 결재코드, 파일위치, 기안자, 문서제목, 날짜, 회사코드, 문서종류코드) */
	private String logId;
	private String dmNum;
	private String apCode;
	private String fileLoc;
	private String dmWriter;
	private String dmTitle;
	private String dmDate;
	private String cmCode;
	private String dmCode;
	private String dmNumCheck;
	private String dmWriteId;
	/* 참조자 */
	private String refId;
	/* 결재의견(결재의견, 의견작성자, 날짜) */
	private String aplComment;
	private String aplWriter;
	private String aplDate;
	/* 결재선(결재자, 결재순서, 사인위치) */
	private String aplId;
	private int aplSeq;
	private String signLoc;
	/*위임여부*/
	private String receiver;
	/*문서종류*/
	private String dmName;
	/* 결재선(부서) */
	private List<ApprovalBean> aplBean;
	private List<ReadingReferenceBean> refBean;
}