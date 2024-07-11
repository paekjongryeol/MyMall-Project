package com.mall.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.cart.service.CartService;
import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.OrderInfoVO;
import com.mall.table.vo.UserInfoVO;

@Controller	
public class CartController {
	
	@Autowired
	CartService service;

	@RequestMapping("/cart/list")
	public String main() throws Exception {
		return "cart/list";
	}
	
	@RequestMapping("/cart/orderlist")
	@ResponseBody
	public List<CartInfoVO> cartList(@ModelAttribute("CartInfoVO") CartInfoVO vo, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");


	    vo.setUserId(uservo.getUserId());
	    List<CartInfoVO> list = service.selectCartList(vo);
	    return list;
	}

	
	@RequestMapping("/cart/order")
	public String ordermain() throws Exception {
		return "cart/order";
	}
	@RequestMapping("/cart/deInfo")
	@ResponseBody
	public int deInfo(@ModelAttribute("CartInfoVO") CartInfoVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");
	    vo.setUserId(uservo.getUserId());
		int c = service.deleteCartInfo(vo);
		return c;
	}
	
	@RequestMapping("/cart/orderUser")
	@ResponseBody
	public UserInfoVO orderUser(@ModelAttribute UserInfoVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");
	    vo.setUserId(uservo.getUserId());
		vo = service.selectUserList(vo);
		return vo;
	}
	
	
	
	@RequestMapping("/cart/orderOn")
	@ResponseBody
	public int orderOn(@ModelAttribute OrderInfoVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");
	    vo.setUserId(uservo.getUserId());
	    
	    //주문번호 생성.
	  	String orderNo = service.selectNewOrderNo(vo);
	  	vo.setOrderNo(orderNo);
	  		
		//1.주문정보 등록.
		service.insertOrderInfo(vo);
	    
		//2. 주문상세품목 등록.
		service.insertOrderGoods(vo);
		
		//3. 장바구니 삭제
		int c = service.deleteCartOrderInfo(vo);
		
	    return c;
		
	}
	
}