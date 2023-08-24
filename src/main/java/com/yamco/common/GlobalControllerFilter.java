package com.yamco.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class GlobalControllerFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false); // 이미 생성된 세션이 있는 경우만 가져옴
        //System.out.println("세션 있는지 여부 체크 : (GlobalControllerFilter.java파일에서 찍고 있어용)" + session);
        
        
        // 세션이 null이 아니고, 실행이 안 되었을 때
        if (session != null && session.getAttribute("filterExecuted") == null) {
        	// visitorCount는 daily, month, year 추가하여 DB에 담아두자. 아니면 daily만 해서 DB에서 가져와서 쓰자.
            Integer visitorCount = (Integer) session.getServletContext().getAttribute("visitorCount");
            if (visitorCount == null) {
                visitorCount = 0;
            }
            visitorCount++;
            session.getServletContext().setAttribute("visitorCount", visitorCount);
            //System.out.println("냠냠시치 지금까지 방문자 수는 : " + visitorCount);
            
            // 해당 값을 DB에 넣어주자.

            // 필터가 실행되었음을 표시하기 위해 세션에 속성 추가
            session.setAttribute("filterExecuted", true);
        }

        // 다음 필터 or 컨트롤러로 진행
        chain.doFilter(request, response);
    }

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void destroy() {
	}

}
