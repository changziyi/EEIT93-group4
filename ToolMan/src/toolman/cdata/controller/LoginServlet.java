package toolman.cdata.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		// 設定輸入資料的編碼
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
		
		if (!errorMsgs.isEmpty()) {
			RequestDispatcher rd = req.getRequestDispatcher("/cdata/login-in.jsp");
			rd.forward(req, resp);
			return;//中斷
		}
		
		
		
		CdataService cs = new CdataService();
		CdataVO  c = cs.login_in(c_id, c_pwd);
		if (c != null){
			session.setAttribute("LoginOK", c);//物件放入Session範圍內，識別字串為"LoginOK"，表示此使用者已經登入
		}else{
			errorMsgs.put("LoginError", "該帳號不存在或密碼錯誤");
		}
		
		if(errorMsgs.isEmpty()){//是否為空值
			String contextPath = getServletContext().getContextPath();
			
			String target = (String)session.getAttribute("target");
			if (target != null) {
			    resp.sendRedirect(resp.encodeRedirectURL(contextPath + target));
			}else{
			    resp.sendRedirect(resp.encodeRedirectURL(contextPath + "/cdata/index.jsp"));
			}			
			return;
		}else{
			RequestDispatcher rd = req.getRequestDispatcher("/cdata/login-in.jsp");//錯誤導向
															//InsertCdataError.jsp /login-in.jsp
			rd.forward(req, resp);
			return;			
		}
		
		
		}
	}

}
