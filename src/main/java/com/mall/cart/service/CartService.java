package com.mall.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.cart.dao.CartDao;
import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.OrderInfoVO;
import com.mall.table.vo.UserInfoVO;


	@Service
	public class CartService {
		
		@Autowired
		private CartDao dao;
		
		
		public List<CartInfoVO> selectCartList(CartInfoVO vo)throws Exception{
			return dao.selectCartList(vo);
		}
		
		public int deleteCartInfo(CartInfoVO vo)throws Exception{
			return dao.deleteCartInfo(vo);
		}
		
		public UserInfoVO selectUserList(UserInfoVO vo) throws Exception{
			return dao.selectUserList(vo);
		}
		
		public String selectNewOrderNo(OrderInfoVO vo) throws Exception{
			return dao.selectNewOrderNo(vo);
		}
		
		public int insertOrderInfo(OrderInfoVO vo) throws Exception{
			return dao.insertOrderInfo(vo);
		}
		
		public int insertOrderGoods(OrderInfoVO vo) throws Exception{
			return dao.insertOrderGoods(vo);
		}

		public int deleteCartOrderInfo(OrderInfoVO vo) throws Exception{
			return dao.deleteCartOrderInfo(vo);
		}
		
}