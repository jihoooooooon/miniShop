package com.the.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.the.dao.IProductDao;
import com.the.dto.ProductDto;

@Service
public class ProductServiceImpl implements IProductService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<ProductDto> selectAll() throws Exception {
		IProductDao dao=sqlSession.getMapper(IProductDao.class);
		System.out.println(dao.selectAll());
		return dao.selectAll();
	}

	@Override
	public void insert(ProductDto dto) throws Exception {
		IProductDao dao=sqlSession.getMapper(IProductDao.class);
		dao.insert(dto);
		
	}

	@Override
	public void update(ProductDto dto) throws Exception {
		IProductDao dao=sqlSession.getMapper(IProductDao.class);
		dao.update(dto);
		
		
	}

	@Override
	public void delete(int p_id) throws Exception {
		IProductDao dao=sqlSession.getMapper(IProductDao.class);
		dao.delete(p_id);
		
		
	}

	
	@Override
	public ProductDto selectId(int id) throws Exception {
		IProductDao dao=sqlSession.getMapper(IProductDao.class);
		return dao.selectId(id);
	}

	@Override
	public void updateProduct(List<ProductDto> products) throws Exception {
		IProductDao dao=sqlSession.getMapper(IProductDao.class);
		// 여러 상품 업데이트 처리
        for (ProductDto product : products) {
            dao.updateProduct(product);
        }
		
	}

	@Override
	public void productAdd(ProductDto productDto) throws Exception {
		IProductDao dao=sqlSession.getMapper(IProductDao.class);
		dao.productAdd(productDto);
		
	}

	
}
