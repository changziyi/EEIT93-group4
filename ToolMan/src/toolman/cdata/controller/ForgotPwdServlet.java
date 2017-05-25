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

import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
import toolman.cdata.controller.javamail;

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
//				System.out.print(email.getC_email() + ",");
//				System.out.print(email.getC_id()+ ",");
//				System.out.println(email.getC_pwd());
//				System.out.println("-----------------------");
			if((c_email != null) && (c_email.equals(email.getC_email()))){//成功
					checked = true;
					session.setAttribute("c_email", c_email);
					String c_name = null;
					System.out.println("c_name"+c_name);
					javamail.getSession();
//					javamail.sendmail(c_email);//test
				}
			}
			if(checked == false){
				System.out.println("錯誤");
				errorMsgs.put("erroremail", "信箱錯誤");
				try {
					Thread.sleep(200);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				RequestDispatcher rd = req.getRequestDispatcher("/cdata/forgetpassword.jsp");
				rd.forward(req, resp);		
			}else{
				req.setAttribute("email",c_email);
				RequestDispatcher rd = req.getRequestDispatcher("/cdata/forgetpassword.jsp");
				rd.forward(req, resp);		
//				resp.sendRedirect(getServletContext().getContextPath()+"/cdata/updatepassword.jsp");
			}									
	}
	
}
