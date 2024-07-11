package com.mall.goods.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.CartInfoVO;
import com.mall.table.vo.GoodsImgVO;
import com.mall.table.vo.GoodsInfoVO;

@MapperScan(basePackages="com.mall.goods.dao")
public interface GoodsDao {

	public GoodsInfoVO selectGoodsContent(GoodsInfoVO vo) throws Exception;
	
	public List<GoodsImgVO> selectGoodsImg(GoodsImgVO vo) throws Exception;
	
	public int insertCartList(CartInfoVO vo) throws Exception;
	
	public int selectCartCount(CartInfoVO vo) throws Exception;
}