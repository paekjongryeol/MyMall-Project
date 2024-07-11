package com.mall.inquiry.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.mall.table.vo.InquiryInfoVO;

@MapperScan(basePackages="com.mall.inquiry.dao")
public interface InquiryDao {
	
	public InquiryInfoVO selectInquiryInfo(InquiryInfoVO vo) throws Exception;
		
	public List<InquiryInfoVO> selectInquiryList(InquiryInfoVO vo)  throws Exception;
	
	public int selectTotalInquiryCount(InquiryInfoVO vo) throws Exception;
	
	public int insertInquiry(InquiryInfoVO vo) throws Exception;
}