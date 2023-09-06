package com.yamco.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.Image_DAO;
import com.yamco.user.model.vo.Notice_VO;

@Service
public class Images_ServiceImpl implements Images_Service {

	@Autowired
	private Image_DAO image_DAO ;
	
	@Override
	public List<Notice_VO> getNoticeList() {
		return image_DAO.getNoticeList() ;
	}
	
}
