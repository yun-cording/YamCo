package com.yamco.admin.model.service;

import java.util.List;
import java.util.Map;

import com.yamco.admin.model.vo.Admin_Banner_VO;
import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Admin_Report_Chk_VO;
import com.yamco.admin.model.vo.Member_count_summary_VO;
import com.yamco.admin.model.vo.Report_VO;
import com.yamco.admin.model.vo.Admin_Report_VO;

public interface AdminService {
	public Admin_Dash_VO getDashBoard( );

	public boolean blindDo(Admin_Report_VO vo);

	public List<List<Admin_Banner_VO>> total_list();

	public void noticeDel(String notice_idx);

	public void pplDel(String ppl_idx);

	public void foodingDel(String food_idx);

	public List<List<Admin_Banner_VO>> total_delete_list();

	// 공지사항, 광고(ppl), 재료(food_ing) 추가
	public int insertAdminImage(String category, String title, String img);

	public void noticeUp(String idx);

	public void pplUp(String idx);

	public void foodingUp(String idx);


	// 회원수 요약 가져오기
	public Member_count_summary_VO getMemberCountSummary();

	public boolean blindCancelDo(Admin_Report_VO vo);
	
	// 신고된 내용들 전부 불러오기
	public List<List<Admin_Report_Chk_VO>> admin_report_All();
	
	// TODO 상우 신고 기능 넣기 시작
	public String reportInsert(Report_VO revo);

	// 신고 답변 전달
	public int answer_report(Admin_Report_Chk_VO arcvo);
}
