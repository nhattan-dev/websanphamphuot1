package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptithcm.entity.UserLogin;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	SessionFactory factory;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserLogin user = (UserLogin) session.getAttribute("user");
		// if logged in
		if (user != null) {
			//if an admin, redirect to admin.htm
			if (user.getRole_id().trim().equalsIgnoreCase("ADMIN")) {
				response.sendRedirect(request.getContextPath() + "/admin.htm");
			}
			//if an user, redirect to admin.htm
			if (user.getRole_id().trim().equalsIgnoreCase("USER")) {
				response.sendRedirect(request.getContextPath() + "/index.htm");
			}
			return false;
		}
		return true;
	}
}
