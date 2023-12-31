package com.yamco.admin.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.admin.model.dao.AdminDAO;
import com.yamco.admin.model.vo.Admin_Banner_VO;
import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Admin_Report_Chk_VO;
import com.yamco.admin.model.vo.Admin_Report_VO;
import com.yamco.admin.model.vo.Member_count_summary_VO;
import com.yamco.admin.model.vo.Report_VO;
import com.yamco.user.model.dao.Report_DAO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private Report_DAO report_DAO;

	@Override
	public Admin_Dash_VO getDashBoard() {
		Admin_Dash_VO vo = adminDAO.getDashBoard();

		return vo;
	}

	@Override
	public boolean blindDo(Admin_Report_VO vo) {
		return adminDAO.blindDo(vo);
	}

	@Override
	public List<List<Admin_Banner_VO>> total_list() {
		return adminDAO.total_list();
	}

	@Override
	public void noticeDel(String notice_idx) {
		adminDAO.noticeDel(notice_idx);
	}

	@Override
	public void pplDel(String ppl_idx) {
		adminDAO.pplDel(ppl_idx);
	}

	@Override
	public void foodingDel(String food_idx) {
		adminDAO.foodingDel(food_idx);
	}

	@Override
	public List<List<Admin_Banner_VO>> total_delete_list() {
		return adminDAO.total_delete_list();
	}

	// 공지사항, 광고(ppl), 재료(food_ing) 추가
	@Override
	public int insertAdminImage(String category, String title, String img) {
		int result = 0;

		Admin_Banner_VO abvo = new Admin_Banner_VO();

		switch (category) {
		case "notice": {
			abvo.setNotice_title(title);
			abvo.setNotice_img(img);
			abvo.setNotice_status("0");
			result = adminDAO.insertNotice(abvo);
			break;
		}
		case "ppl": {
			abvo.setPpl_title(title);
			abvo.setPpl_img(img);
			abvo.setPpl_status("0");
			result = adminDAO.insertPpl(abvo);

			break;
		}
		case "food_ing": {
			abvo.setFood_title(title);
			abvo.setFood_img(img);
			abvo.setFood_status("0");
			result = adminDAO.insertFood_ing(abvo);

			break;
		}
		}

		return result;
	}

	@Override
	public void noticeUp(String idx) {
		adminDAO.noticeUp(idx);
	}

	@Override
	public void pplUp(String idx) {
		adminDAO.pplUp(idx);
	}

	@Override
	public void foodingUp(String idx) {
		adminDAO.foodingUp(idx);
	}

	// 회원수 요약 가져오기
	@Override
	public Member_count_summary_VO getMemberCountSummary() {
		return adminDAO.getMemberCountSummary();
	}
	
	// 신고 내역 전부 불러오기
	@Override
	public List<List<Admin_Report_Chk_VO>> admin_report_All() {
		return adminDAO.getReportAll();
	}

	@Override
	public boolean blindCancelDo(Admin_Report_VO vo) {
		return adminDAO.blindCancelDo(vo);
	}
	
	// TODO 상우 신고 기능 넣기 시작
	public String reportInsert(Report_VO revo) {
		return report_DAO.reportInsert(revo); 
	}
	// TODO 상우 신고 기능 넣기 완료
	
	//신고 답변
	@Override
	public int answer_report(Admin_Report_Chk_VO arcvo) {
		return adminDAO.answer_report(arcvo);
	}
}
