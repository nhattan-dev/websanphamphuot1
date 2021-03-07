package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptithcm.entity.UserLogin;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("null")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserLogin user = (UserLogin) session.getAttribute("user");
		//if is not login yet, redirect to user-login.htm
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/user-login.htm");
			return false;
		}
		//if logged in but not an admin, redirect to index.htm
		else if (!user.getRole_id().trim().equalsIgnoreCase("ADMIN")) {
			response.sendRedirect(request.getContextPath() + "/index.htm");
			return false;
		}
		return true;
	}
}
