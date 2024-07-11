package com.mall.inquiry.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.inquiry.service.InquiryService;
import com.mall.inquiry.vo.InquiryVO;
import com.mall.table.vo.InquiryInfoVO;
import com.mall.table.vo.UserInfoVO;

@Controller	
public class InquiryController {
	
	@Autowired
	InquiryService service;
	
	@RequestMapping("/inquiry/board")
	public String main() throws Exception {
		return "inquiry/board";
	}
	
	@RequestMapping("/search/board")
	@ResponseBody
	public InquiryVO searchlist(@ModelAttribute("InquiryInfoVO") InquiryInfoVO vo) throws Exception {
		
		int totalPage = service.selectTotalInquiryCount(vo); 
		
		List<InquiryInfoVO> list = service.selectInquiryList(vo);
		//3. Client에 넘겨줄 데이터 세팅.
		InquiryVO inquiryvo = new InquiryVO();
				
		inquiryvo.setInquirylist(list);
		inquiryvo.setTotal(totalPage); //총 데이터수.
		inquiryvo.setStartPage(vo.getStartPage()); 
		inquiryvo.setCurrentPage(vo.getCurrentPage());//현재페이지
				return inquiryvo;
	}
	
	@RequestMapping("/inquiry/userdetail")
	@ResponseBody
	public InquiryInfoVO inquirydetail(@ModelAttribute("InquiryInfoVO") InquiryInfoVO vo) throws Exception {
		vo = (InquiryInfoVO) service.selectInquiryInfo(vo);		
	    return vo;
	}
	
	@RequestMapping("/inquiry/insertInfo")
	@ResponseBody
	public int insertInfo(@ModelAttribute("InquiryInfoVO") InquiryInfoVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");
	    vo.setUserId(uservo.getUserId());
		int c = service.insertInquiry(vo);
		return c;
	}
}
	