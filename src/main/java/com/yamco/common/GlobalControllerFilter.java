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

import org.springframework.beans.factory.annotation.Autowired;

import com.yamco.admin.model.dao.Log_DAO;

// TODO 상우 세션 생성될 때마다 count하는 코드
public class GlobalControllerFilter implements Filter {
	// ★ 두번 실행되는 오류 필터에 있을 수도 있음
	// Spring에서 Filter는 웹 요청을 가로채고 수정하는 역할을 합니다. 
	// Filter 내에서 Spring의 `@Autowired`로 의존성 주입을 시도하면 일반적으로 작동하지 않습니다. 
	// 이는 Filter가 Servlet 컨텍스트와는 별개로 동작하고, Spring ApplicationContext와는 직접적인 관련이 없기 때문입니다.

	// 따라서 Filter 내에서 Spring의 Service나 Controller를 직접 호출하는 것은 권장되지 않습니다. 
	// 대신 필요한 로직을 Service나 Controller에서 처리하고, 그 결과를 Filter에서 활용할 수 있도록 설계하는 것이 더 좋은 방법입니다.

	// 예를 들어, Filter에서 세션 정보를 확인하고 로그인 상태 등을 판단하려면 필요한 정보를 세션에 저장한 후, 
	// Filter에서는 세션 정보만을 활용하여 로직을 처리하는 것이 일반적인 방법입니다.

	// Filter의 주요 역할은 요청과 응답의 헤더를 변경하거나, 요청을 가로채어 특정 조건을 검사하여 처리할지 말지를 결정하는 것입니다. 
	// 필요한 로직은 Filter 이후에 Controller나 Service에서 처리하는 것이 좋습니다.
	
//	@Autowired
//	private Log_Controller log_Controller;
//	@Autowired
//	private Log_Service log_Service;
	@Autowired
	private Log_DAO log_DAO;
	
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false); // 이미 생성된 세션이 있는 경우만 가져옴
        //System.out.println("세션 있는지 여부 체크 : (common패키지 안 GlobalControllerFilter.java파일에서 찍고 있어용)" + session);
        
        // 세션이 null이 아니고, 실행이 안 되었을 때
        if (session != null && session.getAttribute("filterExecuted") == null) {
        	// visitorCount는 daily, month, year 추가하여 DB에 담아두자. 아니면 daily만 해서 DB에서 가져와서 쓰자.
            Integer visitorCount = (Integer) session.getServletContext().getAttribute("visitorCount");
            if (visitorCount == null) {
                visitorCount = 0;
            }
            visitorCount++;
            // 증가된 방문자 수 맞춰서 update + 1
            // System.out.println("방문자수 올렸다!");
            // ★ 작동 안한다 (방문자수 up시키는 db 접근법)
            // log_Service.visitorUp();
            // DAO로 바로 접근해도 안된다!
            // log_DAO.visitorUp();
            
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
// TODO 상우 세션 생성될 때마다 count하는 코드
}
