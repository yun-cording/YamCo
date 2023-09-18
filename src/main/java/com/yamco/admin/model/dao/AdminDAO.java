package com.yamco.admin.model.dao;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.admin.model.vo.Admin_Banner_VO;
import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Admin_Report_Chk_VO;
import com.yamco.admin.model.vo.Admin_Report_VO;
import com.yamco.admin.model.vo.Member_count_summary_VO;
import com.yamco.user.model.vo.Comment_VO;
import com.yamco.user.model.vo.Comment_meta_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Admin_Dash_VO getDashBoard() {
		Admin_Dash_VO dash_VO = new Admin_Dash_VO();
		// 조회수 관련
		String hit_total = sqlSessionTemplate.selectOne("admin.hitTotal");
		String hit_user = sqlSessionTemplate.selectOne("admin.hitUser");
		String hit_public = sqlSessionTemplate.selectOne("admin.hitPublic");
		// 방문자수 관련
		String visit_total = sqlSessionTemplate.selectOne("admin.visitTotal");
		String visit_am = sqlSessionTemplate.selectOne("admin.visitAm");
		String visit_pm = sqlSessionTemplate.selectOne("admin.visitPm");
		// 레시피 관련
		String recipe_new = sqlSessionTemplate.selectOne("admin.recipeNew");
		String recipe_user = sqlSessionTemplate.selectOne("admin.recipeUser");
		String recipe_total = String.valueOf(Integer.parseInt(recipe_user) + 200);
		// 기타
		String client_new = sqlSessionTemplate.selectOne("admin.clientNew");
		String male_count = sqlSessionTemplate.selectOne("admin.maleCount");
		String female_count = sqlSessionTemplate.selectOne("admin.femaleCount");
		List<String> week_hit_count = sqlSessionTemplate.selectList("admin.weekHitCount");
		List<String> week_visit_count = sqlSessionTemplate.selectList("admin.weekVisitCount");
		List<String> daysOfWeek = new ArrayList<>(
				Arrays.asList("'월요일'", "'화요일'", "'수요일'", "'목요일'", "'금요일'", "'토요일'", "'일요일'"));
		DayOfWeek currentDayOfWeek = LocalDate.now().getDayOfWeek();
		int currentDayIndex = currentDayOfWeek.getValue();
		// 현재 요일을 기준으로 요일 배열을 회전
		for (int i = 0; i < currentDayIndex; i++) {
			String day = daysOfWeek.remove(0); // 첫 번째 요일을 제거하고
			daysOfWeek.add(day); // 마지막으로 추가
		}
		// 신고관련
		List<Admin_Report_VO> recent_report_list = sqlSessionTemplate.selectList("admin.recentReport");
		List<Admin_Report_VO> recent_report_list2 = new ArrayList<Admin_Report_VO>();
		List<Admin_Report_VO> recipe_report_list = sqlSessionTemplate.selectList("admin.recipeReport");
		List<Admin_Report_VO> comment_report_list = sqlSessionTemplate.selectList("admin.commentReport");
		List<Admin_Report_VO> final_report_list = new ArrayList<Admin_Report_VO>();
		for (Admin_Report_VO k : recipe_report_list) {
			String idx = k.getRcp_idx();
			U_recipe_meta_VO vo = sqlSessionTemplate.selectOne("u_recipe.metaData", idx); // 게시글 번호로 닉네임, 제목 가져오기
			if(vo!=null) {
				if(vo.getU_rcp_status().equals("0")) {
					k.setM_nick(vo.getM_nick());
					k.setU_rcp_title(vo.getU_rcp_title());
					final_report_list.add(k);
				}
			}
		}
		for (Admin_Report_VO k : comment_report_list) {
			Comment_VO cvo = new Comment_VO();
			cvo.setC_idx(k.getC_idx());
			Comment_meta_VO vo = sqlSessionTemplate.selectOne("comment.selectListByVO", cvo); // 댓글 번호로 닉네임, 내용 가져오기
			if(vo!=null) {
				if(vo.getC_status().equals("0")) {
					k.setC_status(vo.getC_status());
					k.setM_nick(vo.getM_nick());
					k.setC_contents(vo.getC_contents());
					final_report_list.add(k);
				}
			}
		}
		for (Admin_Report_VO k : recent_report_list) {
			String idx = k.getRcp_idx();
			if(idx!=null) { // 게시글이면 
				U_recipe_meta_VO vo = sqlSessionTemplate.selectOne("u_recipe.metaData", idx); // 게시글 번호로 제목가져오기
				if(vo!=null) {
					String inputString = k.getR_time();
					
					// SimpleDateFormat을 사용하여 문자열을 날짜 객체로 변환
					SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date date = null;
					try {
						date = inputFormat.parse(inputString);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					// 출력 형식을 지정한 SimpleDateFormat을 사용하여 원하는 형식으로 변환
					SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분ss초");
					String outputString = outputFormat.format(date);
					k.setR_time(outputString);
					k.setU_rcp_title(vo.getU_rcp_title());
					recent_report_list2.add(k);
				}
			}else {
				Comment_VO cvo = new Comment_VO();
				cvo.setC_idx(k.getC_idx());
				Comment_meta_VO vo = sqlSessionTemplate.selectOne("comment.selectListByVO", cvo); // 댓글 번호로 닉네임, 내용 가져오기
				if(vo!=null) {
					String inputString = k.getR_time();
			        // SimpleDateFormat을 사용하여 문자열을 날짜 객체로 변환
			        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			        Date date = null;
			        try {
			            date = inputFormat.parse(inputString);
			        } catch (Exception e) {
			            e.printStackTrace();
			        }

			        // 출력 형식을 지정한 SimpleDateFormat을 사용하여 원하는 형식으로 변환
			        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분ss초");
			        String outputString = outputFormat.format(date);
			        k.setR_time(outputString);
					k.setC_contents(vo.getC_contents());
					recent_report_list2.add(k);
				}
			}
		}
		Collections.sort(final_report_list, new Comparator<Admin_Report_VO>() {
			@Override
			public int compare(Admin_Report_VO vo1, Admin_Report_VO vo2) {
				int count1 = Integer.parseInt(vo1.getCount());
				int count2 = Integer.parseInt(vo2.getCount());
				return Integer.compare(count1, count2);
			}
		});
		
		
		
		dash_VO.setFinal_report_list(final_report_list);
		dash_VO.setRecipe_new(recipe_new);
		dash_VO.setHit_total(hit_total);
		dash_VO.setClient_new(client_new);
		dash_VO.setVisit_total(visit_total);
		dash_VO.setHit_public(hit_public);
		dash_VO.setHit_user(hit_user);
		dash_VO.setVisit_pm(visit_pm);
		dash_VO.setVisit_am(visit_am);
		dash_VO.setRecipe_user(recipe_user);
		dash_VO.setRecipe_total(recipe_total);
		dash_VO.setMale_count(male_count);
		dash_VO.setFemale_count(female_count);
		dash_VO.setWeek_hit_count(week_hit_count);
		dash_VO.setWeek_visit_count(week_visit_count);
		dash_VO.setDaysOfWeek(daysOfWeek);
		dash_VO.setRecent_report_list(recent_report_list2);
		
		return dash_VO;
	}

	public Member_count_summary_VO getMemberCountSummary() {
		return sqlSessionTemplate.selectOne("admin.memberCountSummary");
	}
	
	public boolean blindDo(Admin_Report_VO vo) {
		int res=0;
		if(vo.getRcp_idx()!=null) { // rcp_idx가 있을때 --> 레시피
			res = sqlSessionTemplate.update("admin.rcpBlind",vo);
		}else {
			res = sqlSessionTemplate.update("admin.commentBlind",vo);
		}
		if(res>0) {
			return true;
		}else {
			return false; 
		}
	}

	public List<List<Admin_Banner_VO>> total_list() {
		List<Admin_Banner_VO> list = new ArrayList<Admin_Banner_VO>();
		List<List<Admin_Banner_VO>> total_list = new ArrayList<List<Admin_Banner_VO>>();
		list = sqlSessionTemplate.selectList("admin.ppl_notice");
		total_list.add(list);
		list = sqlSessionTemplate.selectList("admin.ppl_ppl");
		total_list.add(list);
		list = sqlSessionTemplate.selectList("admin.ppl_fooding");
		total_list.add(list);
		
		return total_list;
	}

	public void noticeDel(String notice_idx) {
		sqlSessionTemplate.update("admin.noticeDel", notice_idx);
	}

	public void pplDel(String ppl_idx) {
		sqlSessionTemplate.update("admin.pplDel", ppl_idx);
	}

	public void foodingDel(String food_idx) {
		sqlSessionTemplate.update("admin.foodingDel",food_idx);
	}

	public List<List<Admin_Banner_VO>> total_delete_list() {
		List<Admin_Banner_VO> list = new ArrayList<Admin_Banner_VO>();
		List<List<Admin_Banner_VO>> total_delete_list = new ArrayList<List<Admin_Banner_VO>>();
		list = sqlSessionTemplate.selectList("admin.ppl_deleted_notice");
		total_delete_list.add(list);
		list = sqlSessionTemplate.selectList("admin.ppl_deleted_ppl");
		total_delete_list.add(list);
		list = sqlSessionTemplate.selectList("admin.ppl_deleted_fooding");
		total_delete_list.add(list);
		return total_delete_list;
	}

	public void noticeUp(String idx) {
		sqlSessionTemplate.update("admin.noticeUp",idx);
	}

	public void pplUp(String idx) {
		sqlSessionTemplate.update("admin.pplUp",idx);
	}

	public void foodingUp(String idx) {
		sqlSessionTemplate.update("admin.foodingUp", idx);
	}

	public boolean blindCancelDo(Admin_Report_VO vo) {
		int res = sqlSessionTemplate.update("admin.rcpBlindCancel",vo);
		if(res>0) {
			return true;
		}else {
			return false; 
		}
	}


	// report_t 테이블 가져오기
	public List<List<Admin_Report_Chk_VO>> getReportAll() {
		List<List<Admin_Report_Chk_VO>> total_list = new ArrayList<List<Admin_Report_Chk_VO>>();
		List<Admin_Report_Chk_VO> list = sqlSessionTemplate.selectList("admin.getReportAll");
		List<Admin_Report_Chk_VO> c_list = new ArrayList<Admin_Report_Chk_VO>();
		List<Admin_Report_Chk_VO> rcp_list = new ArrayList<Admin_Report_Chk_VO>();
		List<Admin_Report_Chk_VO> answerC_list = new ArrayList<Admin_Report_Chk_VO>();
		List<Admin_Report_Chk_VO> answerRcp_list = new ArrayList<Admin_Report_Chk_VO>();
		//total_list.add(rcp_list);
		//total_list.add(c_list);
		
		for (Admin_Report_Chk_VO k : list) {
			if(k.getRcp_idx() != null) {
				if(k.getR_answer() != null) { // 답변 처리가 된것들
					String recipe_attacknick = sqlSessionTemplate.selectOne("admin.recipe_attacknick",k.getM_idx());
					Admin_Report_Chk_VO arcvo = sqlSessionTemplate.selectOne("admin.getRecipe_info",k.getRcp_idx());
					k.setU_rcp_status(arcvo.getU_rcp_status());
					k.setU_rcp_title(arcvo.getU_rcp_title());
					k.setRecipe_attacknick(recipe_attacknick);
					k.setRecipe_defencenick(arcvo.getM_nick());
					answerRcp_list.add(k);
				}else {
				String recipe_attacknick = sqlSessionTemplate.selectOne("admin.recipe_attacknick",k.getM_idx());
				Admin_Report_Chk_VO arcvo = sqlSessionTemplate.selectOne("admin.getRecipe_info",k.getRcp_idx());
				k.setU_rcp_status(arcvo.getU_rcp_status());
				k.setU_rcp_title(arcvo.getU_rcp_title());
				k.setRecipe_attacknick(recipe_attacknick);
				k.setRecipe_defencenick(arcvo.getM_nick());
				rcp_list.add(k);
				}
				//recipe_defencenick
			}else if(k.getC_idx() != null ){
				if(k.getR_answer() != null) { // 답변 처리가 된것들
					String comment_attacknick  = sqlSessionTemplate.selectOne("admin.comment_attacknick",k.getM_idx());// 신고자 닉네임가져오기
					//System.out.println("comment_attacknick : "+comment_attacknick);
					Admin_Report_Chk_VO arcvo = sqlSessionTemplate.selectOne("admin.comment_defencenick",k.getC_idx()); // 작성자 닉네임
					String comment_defencenick = arcvo.getM_nick();
					k.setC_status(arcvo.getC_status());
					k.setC_contents(arcvo.getC_contents());
					k.setComment_attacknick(comment_attacknick);
					k.setComment_defencenick(comment_defencenick);
					answerC_list.add(k);
				}else {
				String comment_attacknick  = sqlSessionTemplate.selectOne("admin.comment_attacknick",k.getM_idx());// 신고자 닉네임가져오기
				//System.out.println("comment_attacknick : "+comment_attacknick);
				Admin_Report_Chk_VO arcvo = sqlSessionTemplate.selectOne("admin.comment_defencenick",k.getC_idx()); // 작성자 닉네임
				String comment_defencenick = arcvo.getM_nick();
				k.setC_status(arcvo.getC_status());
				k.setC_contents(arcvo.getC_contents());
				k.setComment_attacknick(comment_attacknick);
				k.setComment_defencenick(comment_defencenick);
				c_list.add(k);
				}
			}
			
		}
		
		total_list.add(rcp_list);
		total_list.add(c_list);
		total_list.add(answerRcp_list);
		total_list.add(answerC_list);
		
		
		return total_list;
	}
	
	// 공지사항 추가
	public int insertNotice(Admin_Banner_VO abvo) {
		return sqlSessionTemplate.insert("admin.insertNotice", abvo);
	}

	// 광고(ppl) 추가
	public int insertPpl(Admin_Banner_VO abvo) {
		return sqlSessionTemplate.insert("admin.insertPpl", abvo);
	}

	// 재료(food_ing) 추가
	public int insertFood_ing(Admin_Banner_VO abvo) {
		return sqlSessionTemplate.insert("admin.insertFood_ing", abvo);

	}
	
	//신고내용 답변 업데이트
	public int answer_report(Admin_Report_Chk_VO arcvo) {
		int result = sqlSessionTemplate.update("admin.reportanswerupdate",arcvo);
		return result;
	}

}