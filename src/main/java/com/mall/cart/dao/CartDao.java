package com.mall.cart.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.OrderInfoVO;
import com.mall.table.vo.UserInfoVO;

@MapperScan(basePackages="com.mall.cart.dao")
public interface CartDao {
	
	public List<CartInfoVO> selectCartList(CartInfoVO vo) throws Exception;
	
	public int deleteCartInfo(CartInfoVO vo) throws Exception;
		
	public UserInfoVO selectUserList(UserInfoVO vo) throws Exception;
	
	public String selectNewOrderNo(OrderInfoVO vo) throws Exception;
	
	public int insertOrderInfo(OrderInfoVO vo) throws Exception;
	
	public int insertOrderGoods(OrderInfoVO vo) throws Exception;
	
	public int deleteCartOrderInfo(OrderInfoVO vo) throws Exception;
}