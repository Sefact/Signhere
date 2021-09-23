package com.signhere.beans;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ApprovalBean {
	private String aplId;
	private String aplName;
	private int aplSeq;
	private String dmNum;
	private String aplLocation;
	private String aplReceiverId;
	private String aplReceiver;
	private MultipartFile fileList;
	private String apComment;
	private String signature;
}
