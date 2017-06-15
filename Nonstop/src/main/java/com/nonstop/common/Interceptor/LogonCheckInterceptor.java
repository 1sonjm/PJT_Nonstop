
package com.nonstop.common.Interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nonstop.domain.User;

/*
 * FileName : LogonCheckInterceptor.java
 *  ㅇ Controller 호출전 interceptor 를 통해 선처리/후처리/완료처리를 수행
 *     - preHandle() : Controller 호출전 선처리   
 *          (true return ==> Controller 호출 / false return ==> Controller 미호출 ) 
 *     - postHandle() : Controller 호출 후 후처리
 *       - afterCompletion() : view 생성후 처리
 *    
 *    ==> 로그인한 회원이면 Controller 호출 : true return
 *    ==> 비 로그인한 회원이면 Controller 미 호출 : false return
 */
public class LogonCheckInterceptor extends HandlerInterceptorAdapter
{

/// Field

/// Constructor
public LogonCheckInterceptor()
{
	System.out.println("\nCommon :: "+this.getClass()+"\n");
}

/// Method
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
{
	HttpSession session = request.getSession(true);
	
	if(session.getAttribute("user")!=null)
	// ==> 로그인된 회원
	{
		String uri = request.getRequestURI();
		
		if(uri.indexOf("addUser")!=-1||uri.indexOf("login")!=-1||uri.indexOf("checkDuplication")!=-1)
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
		String uri = request.getRequestURI();
		
		if(uri.indexOf("addUser")!=-1||uri.indexOf("login")!=-1||uri.indexOf("checkDuplication")!=-1)
		{
			System.out.println("[LogonCheckInterceptor] : Proceeding Logon\n");
			return true;
		}else if(uri.indexOf("list")!=-1 || uri.indexOf("getPortfolio")!=-1){
			System.out.println("[LogonCheckInterceptor] : Allow Not Logon User\n");
			return true;
		}else{
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("[LogonCheckInterceptor] : Not Logon User Deny\n");
			return false;
		}
	}
}
}// end of class
