package toolman.cdata.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/loginoutServlet")
public class loginoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	public loginoutServlet(){
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("LoginOK");
		System.out.println("------------- 登 出  -------------");
		response.sendRedirect(getServletContext().getContextPath()+"/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
		

	}

}
