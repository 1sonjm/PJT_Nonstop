
package com.nonstop.common.Interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogonCheckInterceptor extends HandlerInterceptorAdapter
{

public LogonCheckInterceptor()
{
	System.out.println("\nCommon :: "+this.getClass()+"\n");
}

public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
{
	HttpSession session = request.getSession(true);
	String uri = request.getRequestURI();
	
	boolean isLogonProcess = uri.contains("addUser")||uri.contains("login")||uri.contains("checkUserId");
	boolean isNonMemberContent = uri.contains("list")||uri.contains("getPortfolio")||uri.contains("JSON");
	
	if(session.getAttribute("user")!=null)
	// ==> 로그인된 회원
	{
		
		if(isLogonProcess)
		{
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("[LogonCheckInterceptor] : invalid logon request, already logon\n");
			return false;
		}
		// System.out.println("[LogonCheckInterceptor] : now Logon\n");
		return true;
	}else
	// ==> 미 로그인한 화원
	{
		if(isLogonProcess)
		{
			System.out.println("[LogonCheckInterceptor] : Proceeding Logon\n");
			return true;
		}else if(isNonMemberContent)
		{
			System.out.println("[LogonCheckInterceptor] : Allow Not Logon User\n");
			return true;
		}else
		{
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("[LogonCheckInterceptor] : Not Logon User Deny\n");
			return false;
		}
	}
}
}
