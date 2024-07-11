package com.mall.inquiry.vo;

import java.util.List;

import com.mall.table.vo.InquiryInfoVO;
import com.mall.table.vo.PageVO;

public class InquiryVO extends PageVO{
	
	private List<InquiryInfoVO> inquirylist ;
	
	public List<InquiryInfoVO> getinquirylist() {
		return inquirylist;
	}
	
	public void setInquirylist(List<InquiryInfoVO> inquirylist) {
		this.inquirylist = inquirylist;
	}
	
}
