package toolman.managerUI.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
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
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String functionaction = request.getParameter("functionaction");
		String toggledcheckbox = request.getParameter("toggledcheckbox");
		int lastindex = toggledcheckbox.lastIndexOf("\""); 
		String[] arraytoggled = toggledcheckbox.split("\\,");
		System.out.println(arraytoggled);
		
		if("applicationreviewm".equals(functionaction)){
			List<MdataVO> list = new ArrayList<MdataVO>();
			for(String m_id:arraytoggled){
			MdataService mdataservice = new MdataService();
			MdataVO mdataVO =mdataservice.findByPrimaryKey(Integer.parseInt(m_id));
			}
			request.setAttribute("mdataVO", list);
			RequestDispatcher rd = request.getRequestDispatcher("MasterPage.jsp");
			rd.forward(request, response);	
		}
		
		if("suspensionm".equals(functionaction)){
			List<MdataVO> list = new ArrayList<MdataVO>();
			Integer count=0;
			for(String m_id:arraytoggled){
				MdataService mdataservice = new MdataService();
				System.out.println(m_id);
			Integer	returnedcount = mdataservice.updatemasterSname(Integer.parseInt(m_id),"m_sus");
			count= returnedcount+count;
			}	
			count.toString();
			System.out.print(count);
			out.write(count);
			
		}
		
		if("sendmessagem".equals(functionaction)){
			List<MdataVO> list = new ArrayList<MdataVO>();
			for(String m_id:arraytoggled){
			MdataService mdataservice = new MdataService();
			MdataVO mdataVO =mdataservice.findByPrimaryKey(Integer.parseInt(m_id));
			}
			request.setAttribute("mdataVO", list);
			RequestDispatcher rd = request.getRequestDispatcher("MasterPage.jsp");
			rd.forward(request, response);	
			
		}
		if("blacklistm".equals(functionaction)){
			
			
		}
		if("suspensionc".equals(functionaction)){
			List<CdataVO> list = new ArrayList<CdataVO>();
			Integer count=0;
			for(String c_id:arraytoggled){
				CdataService cdataservice = new CdataService();
			Integer	returnedcount = cdataservice.updatecustomerSname(Integer.parseInt(c_id),"m_sus");
			count= returnedcount+count;
			}
			out = response.getWriter();
			System.out.print(count);
			out.write(count);			
		}
		
		if(functionaction.equals("sendmessagec")){
			
			
		}
		
		if(functionaction.equals("sendmessageo")){
			
			
		}
		
		
		
	}

}
