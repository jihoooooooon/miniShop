package com.the.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.the.dao.AuthoritiesDao;
import com.the.dto.AuthoritiesDto;

@Service
public class AuthoritiesServiceImpl implements AuthoritiesService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(AuthoritiesDto dto) throws Exception {
		AuthoritiesDao dao=sqlSession.getMapper(AuthoritiesDao.class);
		dao.insert(dto);		
	}

}
