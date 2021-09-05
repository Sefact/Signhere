package com.signhere.mapper;

import java.util.List;

import com.signhere.beans.DocumentBean;

public interface DocumentInter {
	public List<DocumentBean> selectAllCompletedDocs(DocumentBean db);
}
