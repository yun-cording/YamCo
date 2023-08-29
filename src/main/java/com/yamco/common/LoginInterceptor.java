package com.yamco.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.AsyncHandlerInterceptor;

public class LoginInterceptor implements AsyncHandlerInterceptor{
	// controller로 가기전에 실행
		// 결과가 true이면 Controller로, 결과가 false이면 특정 jsp로 간다.
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			// 로그인 체크를 해서 false일 경우 false저장
			HttpSession session = request.getSession(true);
			// session에서 true의 의미는
			// session이 삭제된 상태라면 새로운 session을 생성해준다.
			// 삭제가 안된 상태라면 사용하고 있던 session을 그대로 전달해 준다.
			Object obj = session.getAttribute("loginChk");
			if(obj == null) {
				// 로그인 하지 않은 상태
				request.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(request, response);
				return false;
			}
			return true;
		}
}
