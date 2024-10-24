package com.the.dao;

import java.util.ArrayList;

import com.the.dto.ProductDto;

public interface IProductDao {
	public void insert(ProductDto dto) throws Exception;
	public void update(ProductDto dto) throws Exception;
	public void delete(int p_id) throws Exception;
	public ArrayList<ProductDto> selectAll() throws Exception;
	public ProductDto selectId(int id) throws Exception;
	public void updateProduct(ProductDto product) throws Exception;
	public void productAdd(ProductDto productDto) throws Exception;
	
}
