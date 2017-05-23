package toolman.cdata.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toolman.cdata.model.CdataDAO;
import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;

@WebServlet("/updatePwdServlet")
public class updatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {	
		HttpSession session = req.getSession();
		String c_email = (String)session.getAttribute("c_email");
		System.out.println("c_email = " + c_email);
		
//		CdataService cs = new CdataService();
//		List<CdataVO> i = cs.getAll();
		 
	       String c_pwd = req.getParameter("newPassword");  
	        String new_c_pwd = req.getParameter("newPassword2");  
	        Map<String,String> errors = new HashMap<>();	        
	        if (c_pwd == null || (c_pwd.trim()).length() == 0) {  
	        	errors.put("newPassword", "新密碼不能為空白！"); 
	        }     
	        if (new_c_pwd == null || (new_c_pwd.trim()).length() == 0) {  
	        	errors.put("newPassword2", "確認新密碼不能為空白！");  
	        }  
	        
	        if (c_pwd.equals(new_c_pwd) == false) {  
	        	errors.put("passwordError", "兩次輸入密碼不一致！");  
	        }else{	        	
	        	CdataService cs = new CdataService();	        	
	        	cs.updateMemberfwd(c_email, c_pwd);
	        	System.out.println("c_pwd = " + c_pwd);
	        	System.out.println("Success");       	
	        }
	        if (!errors.isEmpty()) {  
	            req.setAttribute("errors", errors);  	           
	            RequestDispatcher rd = req.getRequestDispatcher(
	            		"/cdata/updatepassword.jsp");
	            rd.forward(req, resp);
	            return;  
	        }  
	        try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
	        resp.sendRedirect(getServletContext().getContextPath()+"/index.jsp");
	}

}
