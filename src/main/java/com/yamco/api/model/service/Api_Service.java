package com.yamco.api.model.service;

import com.yamco.api.model.vo.Public_VO;
import com.yamco.user.model.vo.Member_VO;

public interface Api_Service {
	public Public_VO getDetailedInfo();

	public Member_VO getIdChk(String id);

}
