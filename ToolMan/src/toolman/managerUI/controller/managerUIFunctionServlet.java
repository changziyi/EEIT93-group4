package toolman.managerUI.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;

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
		int lastindex = toggledcheckbox.lastIndexOf("\""); 
		String[] arraytoggled = toggledcheckbox.replaceAll("\\[", "").replaceAll("\\]", "").split("");
		
		if(functionaction.equals("applicationreviewm")){
			List<MdataVO> list = new ArrayList<MdataVO>();
			for(String m_id:arraytoggled){
			MdataService mdataservice = new MdataService();
			MdataVO mdataVO =mdataservice.findByPrimaryKey(Integer.parseInt(m_id));
			}
			request.setAttribute("mdataVO", list);
			RequestDispatcher rd = request.getRequestDispatcher("MasterPage.jsp");
			rd.forward(request, response);	
		}
		
		if(functionaction.equals("suspensionm")){
			List<MdataVO> list = new ArrayList<MdataVO>();
			for(String m_id:arraytoggled){
			MdataService mdataservice = new MdataService();
			mdataservice.updatemasterSname(Integer.parseInt(m_id),"m_sus");
			}
			RequestDispatcher rd = request.getRequestDispatcher("MasterPage.jsp");
			rd.forward(request, response);	
			
		}
		
		if(functionaction.equals("sendmessagem")){
			List<MdataVO> list = new ArrayList<MdataVO>();
			for(String m_id:arraytoggled){
			MdataService mdataservice = new MdataService();
			MdataVO mdataVO =mdataservice.findByPrimaryKey(Integer.parseInt(m_id));
			}
			request.setAttribute("mdataVO", list);
			RequestDispatcher rd = request.getRequestDispatcher("MasterPage.jsp");
			rd.forward(request, response);	
			
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
