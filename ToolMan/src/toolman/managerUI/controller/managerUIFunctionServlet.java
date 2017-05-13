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
import toolman.order.model.OrderService;

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
		String targetid = request.getParameter("targetid");//note
		String notevalue = request.getParameter("notevalue");//note
		String noteid = request.getParameter("noteid");//note
//		int lastindex = toggledcheckbox.lastIndexOf("\""); 
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
			int count=0;
			for(String m_id:arraytoggled){
				MdataService mdataservice = new MdataService();
				System.out.println(m_id);
			Integer	returnedcount = mdataservice.updatemasterSname(Integer.parseInt(m_id),"停權中");
			count= returnedcount+count;
			}	
			
			System.out.print(count);
			out.write(count);
			
		}
		if("suspensionc".equals(functionaction)){
			List<CdataVO> list = new ArrayList<CdataVO>();
			int count=0;
			for(String c_id:arraytoggled){
				CdataService cdataservice = new CdataService();
			Integer	returnedcount = cdataservice.updatecustomerSname(c_id,"停權中");
			count= returnedcount+count;
			}
			out = response.getWriter();
			System.out.print(count);
			out.write(count);			
		}
		if("findmaster".equals(functionaction)){
			MdataService mdataservice = new MdataService();
			request.setAttribute("mdataVO", mdataservice.findByPrimaryKey(new Integer(targetid)));
			RequestDispatcher rd = request.getRequestDispatcher(request.getServletContext()+"/mdata/MasterPage.jsp");
			rd.forward(request, response);	
		}
		if("findcustomer".equals(functionaction)){
			CdataService cdataservice = new CdataService();
			request.setAttribute("cdataVO", cdataservice.getById(targetid));
			RequestDispatcher rd = request.getRequestDispatcher(request.getServletContext()+"/cdata/ShowCdata.jsp");
			rd.forward(request, response);	
		}
		
		if("findorder".equals(functionaction)){
			OrderService orderservice = new OrderService();
			request.setAttribute("orderVO", orderservice.getById(new Integer(targetid)));
			RequestDispatcher rd = request.getRequestDispatcher(request.getServletContext()+"toolman.order/confirmorder.jsp");
			rd.forward(request, response);	
		}
//		if("sendmessagem".equals(functionaction)){
//			List<MdataVO> list = new ArrayList<MdataVO>();
//			for(String m_id:arraytoggled){
//			MdataService mdataservice = new MdataService();
//			MdataVO mdataVO =mdataservice.findByPrimaryKey(Integer.parseInt(m_id));
//			}
//			request.setAttribute("mdataVO", list);
//			RequestDispatcher rd = request.getRequestDispatcher("MasterPage.jsp");
//			rd.forward(request, response);	
//			
//		}// call emailservlet instead
		
		if("samnote".equals(functionaction)){
			
			int count=0;
				MdataService mdataservice = new MdataService();
			Integer	returnedcount = mdataservice.updatecustomerSamnote(new Integer(noteid),"停權中");
			count= returnedcount+count;
			
			out = response.getWriter();
			System.out.print(count);
			out.write(count);			
		}
		if("sacnote".equals(functionaction)){
		
			int count=0;
			
			CdataService cdataservice = new CdataService();
			Integer	returnedcount = cdataservice.updatecustomerSacnote(noteid,"停權中");
			count= returnedcount+count;
			
			out = response.getWriter();
			System.out.print(count);
			out.write(count);			
		}
		if("saonote".equals(functionaction)){
		
			Integer count=0;
			
			OrderService odataservice = new OrderService();
			Integer	returnedcount = odataservice.updatecustomerSaonote(new Integer(noteid),"停權中");
			count= returnedcount+count;
			
			out = response.getWriter();
			System.out.print(count);
			out.write(count);			
		}
		if("blacklistm".equals(functionaction)){
			
			
		}
		if("blacklistm".equals(functionaction)){
			
			
		}

		
//		if(functionaction.equals("sendmessagec")){
//			
//			
//		}// call emailservlet instead
		
//		if(functionaction.equals("sendmessageo")){
//			
//			
//		}// call emailservlet instead
		
		
		
	}

}
