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

import org.apache.catalina.filters.CsrfPreventionFilter;

import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;


@WebServlet("/ForgotPwdServlet")
public class ForgotPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {		
		doPost(req, resp); 
				  
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		Map<String, String> errorMsgs = new HashMap<>();
		HttpSession session = req.getSession();
		req.setAttribute("errorMsgs", errorMsgs);		
		CdataService cs = new CdataService();
		String c_email = req.getParameter("Email");
		System.out.println("c_email = " + c_email);
		 List<CdataVO> list = cs.geteMailAll(c_email);
		 Boolean checked = false;
			for (CdataVO email : list) {
				System.out.println(email.getC_email() + ",");
			if((c_email != null) && (c_email.equals(email.getC_email()))){//成功
					checked = true;
//					System.out.println("成功");
//					System.out.println("email.getC_email() = "+email.getC_email());
				}
			}
			if(checked == false){
				System.out.println("錯誤");
				errorMsgs.put("erroremail", "信箱錯誤");				
				RequestDispatcher rd = req.getRequestDispatcher("/cdata/forgetpassword.jsp");
				rd.forward(req, resp);
				
			}else{
				resp.sendRedirect(getServletContext().getContextPath()+"/cdata/updatepassword.jsp");
			}									
	}
	
}
