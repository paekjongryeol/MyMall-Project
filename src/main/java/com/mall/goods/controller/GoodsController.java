package com.mall.goods.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.goods.service.GoodsService;
import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.GoodsImgVO;
import com.mall.table.vo.GoodsInfoVO;
import com.mall.table.vo.UserInfoVO;

@Controller	
public class GoodsController {
	
	@Autowired
	GoodsService service;
	
	@RequestMapping("/goods/view")
	public String main(@ModelAttribute GoodsInfoVO vo, Model model) throws Exception {
		model.addAttribute("vo", vo);
		return "goods/goodsinfo";
	}
	
	@RequestMapping("/goods/content")
	@ResponseBody
	public GoodsInfoVO goodsContent(GoodsInfoVO vo) throws Exception {
		vo = service.selectGoodsContent(vo);
	    return vo;
	}

	@RequestMapping("/main/itemImg")
	@ResponseBody
	public List<GoodsImgVO> goodsImg(@ModelAttribute("GoodsImgVO") GoodsImgVO vo) throws Exception {	
		List<GoodsImgVO> list = service.selectGoodsImg(vo);
		return list;
	}
	
	@RequestMapping("/goods/cartUp")
	@ResponseBody
	public int newUp(@ModelAttribute CartInfoVO vo, HttpServletRequest request) throws Exception {
	
	HttpSession session = request.getSession();
	UserInfoVO uservo = (UserInfoVO)session.getAttribute("MallUser");
	
	vo.setUserId(uservo.getUserId());
	int c = service.selectCartCount(vo);
		if(c>0) {
			c=0;
		}else {
			c = service.insertCartList(vo);
		}
	    return c;
	}
}
	