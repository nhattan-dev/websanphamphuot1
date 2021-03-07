package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class SecurityInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	SessionFactory factory;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		//if not logged in, redirect to user-login.htm
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/user-login.htm");
			return false;
		}
		return true; 
	}
	
}
