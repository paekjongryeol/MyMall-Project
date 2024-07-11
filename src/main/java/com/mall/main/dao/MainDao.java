package com.mall.main.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.GoodsCategoryVO;
import com.mall.table.vo.GoodsInfoVO;

@MapperScan(basePackages="com.mall.main.dao")
public interface MainDao {

	public List<GoodsInfoVO> selectGoodsInfo(GoodsInfoVO vo)  throws Exception;
	
	public List<GoodsCategoryVO> selectGoodsCategory(GoodsInfoVO vo)  throws Exception;

}