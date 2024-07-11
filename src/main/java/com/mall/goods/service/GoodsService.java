package com.mall.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.goods.dao.GoodsDao;
import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.GoodsImgVO;
import com.mall.table.vo.GoodsInfoVO;



@Service
public class GoodsService {

	@Autowired
	private GoodsDao dao;
	
	
	public GoodsInfoVO selectGoodsContent(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsContent(vo);
	}
	
	public List<GoodsImgVO> selectGoodsImg(GoodsImgVO vo)throws Exception{
		return dao.selectGoodsImg(vo);
	}
	
	public int insertCartList(CartInfoVO vo)throws Exception{
		return dao.insertCartList(vo);
	}
	
	public int selectCartCount(CartInfoVO vo)throws Exception{
		return dao.selectCartCount(vo);
	}
}
