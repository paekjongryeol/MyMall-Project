package com.mall.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.main.dao.MainDao;
import com.mall.table.vo.GoodsCategoryVO;
import com.mall.table.vo.GoodsInfoVO;



@Service
public class MainService {

	@Autowired
	private MainDao dao;
	
	
	public List<GoodsInfoVO> selectGoodsInfo(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsInfo(vo);
	}
	
	public List<GoodsCategoryVO> selectGoodsCategory(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsCategory(vo);
	}
	
}
