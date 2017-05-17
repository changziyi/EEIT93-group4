package toolman.cdata.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.runtime.Context;
import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doPost(req,resp);

	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		Map<String, String> errorMsgs = new HashMap<>();
		req.setAttribute("errorMsgs", errorMsgs);
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		/******************************** 登入 ***********************************/
		String login_mumber = req.getParameter("login_mumber");
		if("login_on_mumber".equals(login_mumber)){
		
		String c_id = req.getParameter("id");
		if (c_id == null || c_id.trim().length() == 0) {
			errorMsgs.put("c_id", "請輸入帳號");
		}
		String c_pwd = req.getParameter("pswd");
		if (c_pwd  == null || c_pwd.trim().length() == 0) {
			errorMsgs.put("c_pwd", "請輸入密碼");
		}
		//reCAPTCHA
		String gRecaptchaResponse = req
				.getParameter("g-recaptcha-response");
		System.out.println(gRecaptchaResponse);		
		boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
		System.out.println(" Name = " + c_id + "::password = " + c_pwd 
				+ "::Captcha Verify"+verify);		

		CdataService cs = new CdataService();
		CdataVO  cdataVO = cs.login_in(c_id, c_pwd);		
		//cross-database
        if (cdataVO != null && c_id.equals(cdataVO.getC_id()) 
        		&& c_pwd.equals(cdataVO.getC_pwd())){
        	session.setAttribute("LoginOK", cdataVO);//登入成功
        }else{
			errorMsgs.put("LoginError", "該帳號不存在或密碼錯誤");
			RequestDispatcher rd = req.getRequestDispatcher
					(req.getContextPath()+"/cdata/login-in.jsp");
		}
		if (!errorMsgs.isEmpty()) {
			RequestDispatcher rd = req.getRequestDispatcher("/cdata/login-in.jsp");
			rd.forward(req, resp);
			return;//中斷
		}			//true
        if(verify == false){ 
        	 resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath()+"/index.jsp"));
//        	 resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath()+"/cdata/index.jsp"));//王修改
//       	 resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath()+"/master/List.jsp"));
//        	 resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath()+"/wishpool/Wishing+waterfall.jsp"));
        	 
//        	 System.out.println("C_id = " + cdataVO.getC_id());
//        	 System.out.println("cdataVO = " + cdataVO);
        }else{
        	errorMsgs.put("gRecaptchaResponse", "請驗證我不是機器人");
        	RequestDispatcher rd = req.getRequestDispatcher("/cdata/login-in.jsp");
        	rd.forward(req, resp);
        	return;
        }
			
		}

	}

}