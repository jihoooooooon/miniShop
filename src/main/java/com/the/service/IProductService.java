package com.the.service;

import java.util.ArrayList;
import java.util.List;

import com.the.dto.ProductDto;

public interface IProductService {
	public void insert(ProductDto dto) throws Exception;
	public void update(ProductDto dto) throws Exception;
	public void delete(int p_id) throws Exception;
	public ArrayList<ProductDto> selectAll() throws Exception;
	public ProductDto selectId(int id) throws Exception;
	public void updateProduct(List<ProductDto> products) throws Exception;
	public void productAdd(ProductDto productDto) throws Exception;
	
	

}
