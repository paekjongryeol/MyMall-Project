package com.mall.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.main.service.MainService;
import com.mall.table.vo.GoodsCategoryVO;
import com.mall.table.vo.GoodsInfoVO;

@Controller	
public class MainController {
	
	@Autowired
	MainService service;
	
	@RequestMapping("/main/mall")
	public String main() throws Exception {
		return "main";
	}
	
	
	@RequestMapping("/main/hotItem")
	@ResponseBody
	public List<GoodsInfoVO> goodsmain(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		List<GoodsInfoVO> list = service.selectGoodsInfo(vo);
		
	    return list;
	}
	
	@RequestMapping("/main/goodsCategory")
	@ResponseBody
	public List<GoodsCategoryVO> goodscategory(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		

		List<GoodsCategoryVO> list = service.selectGoodsCategory(vo);
	    return list;
	}
	

}
