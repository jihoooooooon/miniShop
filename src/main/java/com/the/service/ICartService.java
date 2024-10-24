package com.the.service;

import java.util.ArrayList;

import com.the.dto.CartDto;


public interface ICartService {
	public void insert(CartDto dto) throws Exception;
	public void delete(int p_id) throws Exception;
	public ArrayList<CartDto> selectAll(String userId) throws Exception;
	public void buy(int p_id)throws Exception;
	
	
	

}
