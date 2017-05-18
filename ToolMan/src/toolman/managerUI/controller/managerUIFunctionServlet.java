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
import toolman.opro.model.OproDAO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

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
		
		String targetid = request.getParameter("targetid");//direct to other pages target id
		String notevalue = request.getParameter("notevalue");//note value
		String noteid = request.getParameter("noteid");//note target id
		System.out.println(noteid);
//		int lastindex = toggledcheckbox.lastIndexOf("\""); 
		String[] arraytoggled ={};
		if(request.getParameter("toggledcheckbox")!=null){
		String toggledcheckbox = request.getParameter("toggledcheckbox");
		arraytoggled = toggledcheckbox.split("\\,");
		System.out.println(arraytoggled);
		}
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
				int	returnedcount = mdataservice.updatemasterSname(Integer.parseInt(m_id),"停權中");
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
			int	returnedcount = cdataservice.updatecustomerSname(c_id,"停權中");
			count= returnedcount+count;
			}
			out = response.getWriter();
			System.out.print(count);
			out.write(count);			
		}
		//tested ok
		if("findmaster".equals(functionaction)){
			MdataService mdataservice = new MdataService();
			request.setAttribute("mdataVO", mdataservice.findByPrimaryKey(new Integer(targetid)));
			RequestDispatcher rd = request.getRequestDispatcher("/master/MasterPage.jsp");
			rd.forward(request, response);	
		}
		
		//tested ok
		if("findcustomer".equals(functionaction)){
			CdataService cdataservice = new CdataService();
			request.setAttribute("cdataVO", cdataservice.getById(targetid));
			RequestDispatcher rd = request.getRequestDispatcher("/cdata/ShowCdata.jsp");
			rd.forward(request, response);	
		}
		//tested ok no purpose to use it
//		if("findorder".equals(functionaction)){
//			OrderService orderservice = new OrderService();
//			OproDAO opro = new OproDAO();
//			//Attributes set according to confirmorder.jsp
//			OrderVO orderVO = orderservice.getById(new Integer(targetid));
//			request.setAttribute("orderVO",orderVO );
//			request.setAttribute("oproVOlist", opro.getOproByOId(orderVO));
//			// maybe add if s_name.equals(完成或未完成) and direct to confirmorder.jsp step3 or 4
//			RequestDispatcher rd = request.getRequestDispatcher("/manager.backstageUI/confirmordermanager.jsp");
//			rd.forward(request, response);	
//		}
		
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
		
		//tested ok
		if("samnote".equals(functionaction)){
			
			int count=0;
				MdataService mdataservice = new MdataService();
			int	returnedcount = mdataservice.updatecustomerSamnote(Integer.parseInt(noteid),notevalue);
			count= returnedcount+count;
			
			out = response.getWriter();
			System.out.print(count);
			out.write("done");			
		}
		//tested ok
		if("sacnote".equals(functionaction)){
		
			int count=0;
			
			CdataService cdataservice = new CdataService();
			int	returnedcount = cdataservice.updatecustomerSacnote(noteid,notevalue);
			count= returnedcount+count;
			System.out.print(notevalue);
			out = response.getWriter();
			System.out.print(count);
			out.write(count);			
		}
		if("saonote".equals(functionaction)){
		
			Integer count=0;
			
			OrderService odataservice = new OrderService();
			int	returnedcount = odataservice.updateOrderSaonote(Integer.parseInt(noteid),notevalue);
			count= returnedcount;
			
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
