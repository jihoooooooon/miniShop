package com.the.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.the.dao.ICartDao;
import com.the.dto.CartDto;

@Service
public class CartServiceImpl implements ICartService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(CartDto dto) throws Exception {
		ICartDao dao=sqlSession.getMapper(ICartDao.class);
		dao.insert(dto);
		
	}

	
	@Override
	public void delete(int p_id) throws Exception {
		ICartDao dao=sqlSession.getMapper(ICartDao.class);
		dao.delete(p_id);
		
		
	}
	

	@Override
	public ArrayList<CartDto> selectAll(String userId) throws Exception {
		ICartDao dao=sqlSession.getMapper(ICartDao.class);
		return dao.selectAll(userId);
	}


	@Override
	public void buy(int p_id) throws Exception {
		ICartDao dao=sqlSession.getMapper(ICartDao.class);
		dao.buy(p_id);
		
	}


	
	

	
}
