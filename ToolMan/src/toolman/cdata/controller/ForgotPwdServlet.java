package toolman.cdata.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		CdataService cs = new CdataService();
		String c_email = req.getParameter("Email");
		System.out.println("c_email = " + c_email);
		 List<CdataVO> cdataVO = cs.geteMailAll(c_email);
		if(cdataVO != null && cdataVO.size() != 0){
			CdataVO cdataVO1 = cdataVO.get(0);
			System.out.println("cdataVO1.getC_email()" + cdataVO1.getC_email());			
			req.setAttribute("forgetmail", cdataVO1);
			System.out.println("信箱正確,"+cdataVO.size());
//			resp.sendRedirect(getServletContext().getContextPath()+"cdata/updatepassword.jsp");
		}else{
			System.out.println("信箱錯誤");			
//			RequestDispatcher rd = req.getRequestDispatcher(getServletContext().getContextPath()+"cdata/forgetpassword.jsp");
//			rd.forward(req, resp);
//			return;
//			cs.forgetpwd(c_email);
//			cs.findUserByNameOrEmail(NameOrEmail);
//	        req.setAttribute("errorMsg", NameOrEmail + "，不存在！");  
//	        req.getRequestDispatcher("/updatepwd2.jsp").forward(req, resp);  
//	        return; 
		}
	}

}
