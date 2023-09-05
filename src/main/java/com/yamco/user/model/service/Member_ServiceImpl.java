package com.yamco.user.model.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.Member_DAO;
import com.yamco.user.model.vo.Member_Search_VO;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.Member_meta_VO;

@Service
public class Member_ServiceImpl implements Member_Service {
	@Autowired
	private Member_DAO member_DAO;

	@Override
	public int getMemberJoin(Member_VO mvo) {
		return member_DAO.getMemberJoin(mvo);
	}

	@Override
	public int getMemberIdChk(String m_id) {
		return member_DAO.getMemberIdChk(m_id);
	}

	// 회원 검색
	@Override
	public List<Member_VO> getMemberList(Member_Search_VO msvo) {
		String keyword = msvo.getKeyword();
		if (keyword != null && !keyword.isBlank()) {
			if (msvo.getKeyword_type().equalsIgnoreCase("like")) { // 키워드 포함
				switch (msvo.getKeyword_category()) {
				case "1":
					msvo.setLike_id(keyword);
					break;
				case "2":
					msvo.setLike_nick(keyword);
					break;
				case "3":
					msvo.setLike_phone(keyword);
					break;
				case "4":
					msvo.setLike_birthday(keyword);
					break;
				}
			} else { // 키워드 일치
				switch (msvo.getKeyword_category()) {
				case "1":
					msvo.setM_id(keyword);
					break;
				case "2":
					msvo.setM_nick(keyword);
					break;
				case "3":
					msvo.setM_phone(keyword);
					break;
				case "4":
					msvo.setM_birthday(keyword);
					break;
				}
			}
		}

		String start_date = msvo.getStart_date();
		String end_date = msvo.getEnd_date();

		if (start_date != null && !start_date.isBlank()) {
			if (msvo.getPeriod_category().equals("1")) { // 가입일 기준
				msvo.setRegdate_start(start_date);
			} else { // 탈퇴일 기준
				msvo.setOut_date_start(start_date);
			}
		}

		if (end_date != null && !end_date.isBlank()) {
			LocalDate end = LocalDate.parse(end_date);
			end = end.plusDays(1);
			end_date = end.toString();
			if (msvo.getPeriod_category().equals("1")) { // 가입일 기준
				msvo.setRegdate_end(end_date);
			} else { // 탈퇴일 기준
				msvo.setOut_date_end(end_date);
			}
		}

		String member_type = msvo.getMember_type();
		if (member_type != null) {
			if (member_type.equalsIgnoreCase("self")) {
				msvo.setM_login_type("1"); // 1 자체가입 계정
			} else if (member_type.equalsIgnoreCase("social")) {
				msvo.setM_login_type("2"); // 2 ~ 4 소셜가입 계정
			}
		}

		String member_state = msvo.getMember_state();
		if (member_state == null) {
			msvo.setM_status("1"); // 일반사용자
		} else {
			if (member_state.equalsIgnoreCase("ban")) {
				msvo.setM_status("4"); // 작성금지회원
			} else if (member_state.equalsIgnoreCase("dropout")) {
				msvo.setM_status("3"); // 탈퇴회원
			}
		}
		return member_DAO.getMemberList(msvo);
	}
	
	// 명예의 전당 가져오기
	@Override
	public List<Member_meta_VO> getAwardList() {
		return member_DAO.getAwardList();
	} 

	// 닉네임 설정하기
	@Override
	public int setNick(Member_VO m_vo) {
		return member_DAO.setNick(m_vo);
	}

	// 자체 로그인
	@Override
	public Member_VO getMemberLogin(Member_VO mvo) {
		return member_DAO.getMemberLogin(mvo);
	}

	// 틀린 횟수 업데이트
	@Override
	public int getFailCountUp(Member_VO mvo) {
		return member_DAO.getFailCountUp(mvo);
	}
	// 비밀번호 변경
	@Override
	public int getChangePw(Member_VO mvo) {
		return member_DAO.getChangePw(mvo);
	}
	// idx로 멤버정보 가져오기
	@Override
	public Member_VO getMemberOne(String m_idx) {
		return member_DAO.getMemberOne(m_idx);
	}
	// 내 정보 변경
	@Override
	public int changeMyInfo(Member_VO mvo) {
		return member_DAO.changeMyInfo(mvo);
	}
	// 회원 탈퇴
	@Override
	public int leaveMember(Member_VO mvo) {
		return member_DAO.leaveMember(mvo);
	}
	
	// 토큰, 날짜 생성
	@Override
	public int setMakeToken(Member_VO mvo) {
		return member_DAO.setMakeToken(mvo);
	}

	// 비밀번호 변경 대상 사용자 검색
	@Override
	public Member_VO getEmailId(Member_VO mvo) {
		return member_DAO.getEmailId(mvo);
	}

	// 비밀번호 변경 후 토큰 삭제
	@Override
	public int getTokenDelete(Member_VO mvo) {
		return member_DAO.getTokenDelete(mvo);
	}
	
	// 찜목록
	@Override
	public List<String> getMyWishList(String m_idx) {
		return member_DAO.getMyWishList(m_idx);
	}
}
