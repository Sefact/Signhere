package com.signhere.services;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Management {
	@Autowired
	SqlSessionTemplate sqlSession;
}
