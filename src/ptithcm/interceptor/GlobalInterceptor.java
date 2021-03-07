package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class GlobalInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	SessionFactory factory;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("from");
		String from = request.getRequestURI().toString();
		from = from.substring(from.substring(1).indexOf("/") + 2);
		httpSession.setAttribute("from", from);
//		System.out.println(httpSession.getAttribute("from"));
		return true;
	}
}
