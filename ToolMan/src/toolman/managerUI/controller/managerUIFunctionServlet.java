package toolman.managerUI.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class managerUIFunctionServlet
 */
@WebServlet("/toolman.managerUI.controller/ManagerUIFunctionServlet.do")
public class managerUIFunctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public managerUIFunctionServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String functionaction = request.getParameter("functionaction");
		String toggledcheckbox = request.getParameter("toggledcheckbox");
		
		if(functionaction.equals("applicationreviewm")){
			
			
			
		}
		if(functionaction.equals("suspensionm")){
			
			
		}
		if(functionaction.equals("sendmessagem")){
			
			
		}
		if(functionaction.equals("blacklistm")){
			
			
		}
		if(functionaction.equals("suspensionc")){
			
			
		}
		if(functionaction.equals("sendmessagec")){
			
			
		}
		if(functionaction.equals("sendmessageo")){
			
			
		}
		
		
		
	}

}
