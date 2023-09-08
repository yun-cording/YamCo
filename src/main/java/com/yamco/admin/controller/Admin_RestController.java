package com.yamco.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yamco.admin.model.service.AdminService;
import com.yamco.admin.model.vo.Admin_Report_VO;

@RestController
public class Admin_RestController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("/blind.do")
	public boolean blindDo(Admin_Report_VO vo) {
		return adminService.blindDo(vo);
	}
	
	@RequestMapping("/blindCancel.do")
	public boolean blindCancelDo(Admin_Report_VO vo) {
		return adminService.blindCancelDo(vo);
	}
}
