package com.signhere.beans;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EntrustBean {
	private String etNum;
	private String etSender;
	private String etSenderId;
	private String etReceiver;
	private String etReceiverId;
	private String etSet;
	private String etReason;
}
