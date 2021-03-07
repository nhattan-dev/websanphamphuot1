package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class NotLoggedInInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getSession().getAttribute("user") == null) {
			String from;
			if (request.getSession().getAttribute("from") == null) {
				from = "index.htm";
			} else {
				from = request.getSession().getAttribute("from").toString();
			}
			response.sendRedirect(request.getContextPath() + "/" + from);
			return false;
		}
		return true;
	}
	
}
