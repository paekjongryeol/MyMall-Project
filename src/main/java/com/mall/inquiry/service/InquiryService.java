package com.mall.inquiry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.inquiry.dao.InquiryDao;
import com.mall.table.vo.InquiryInfoVO;

@Service
public class InquiryService {

	@Autowired
	private InquiryDao dao;
	
	public InquiryInfoVO selectInquiryInfo(InquiryInfoVO vo) throws Exception{
		return dao.selectInquiryInfo(vo);
	}
	
	public List<InquiryInfoVO> selectInquiryList(InquiryInfoVO vo)throws Exception{
		return dao.selectInquiryList(vo);
	}
	
	public int selectTotalInquiryCount(InquiryInfoVO vo) throws Exception {
		return dao.selectTotalInquiryCount(vo);
	}
	
	public int insertInquiry(InquiryInfoVO vo) throws Exception {
		return dao.insertInquiry(vo);
	}
}