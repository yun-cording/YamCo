package com.yamco.api.model.service;

import com.yamco.api.model.vo.Public_VO;

public interface Api_Service {
	public Public_VO getDetailedInfo();

	public boolean getIdChk(String id);

}
