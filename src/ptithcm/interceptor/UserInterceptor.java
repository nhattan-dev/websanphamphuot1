package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptithcm.entity.UserLogin;

public class UserInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	SessionFactory factory;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserLogin user = (UserLogin) session.getAttribute("user");
		//if logged in but not an user, redirect to admin.htm
		if(user != null) {
			if (!user.getRole_id().trim().equalsIgnoreCase("USER")) {
				response.sendRedirect(request.getContextPath() + "/admin.htm");
				return false;
			}
		}
		return true;
	}
}
