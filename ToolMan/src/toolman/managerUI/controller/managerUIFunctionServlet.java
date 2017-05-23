package toolman.managerUI.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import toolman.ad.model.AdService;
import toolman.ad.model.AdVO;
import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
import toolman.email.model.EmailDAO;
import toolman.email.model.EmailVO;
import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProVO;
import toolman.opro.model.OproDAO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;
import toolman.rdata.model.RdataService;

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
		if ("cer".equals(request.getParameter("type"))) {
			String image = request.getParameter("image");
			Integer img = new Integer(image);
			response.setContentType("image/jpeg");

			ServletOutputStream out = response.getOutputStream();
			MdataService mdataSvc = new MdataService();
			MdataVO mdataVO = mdataSvc.findByPrimaryKey(img);
			byte[] m_cer = mdataVO.getM_cer();

			if (m_cer == null || m_cer.length == 0) {
				InputStream in = getServletContext().getResourceAsStream("/images/no_image.PNG");
				m_cer = new byte[in.available()];
				in.read(m_cer);
				out.write(m_cer);
				in.close();
			}

			out.write(m_cer);
			out.close();
		}
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
		//for致衡訂單回應
		String o_id = request.getParameter("o_id");
		
		if("applicationreviewm".equals(functionaction)){
			List<MdataVO> list = new ArrayList<MdataVO>();
			String jsonstrnig=null;
			for(String m_id:arraytoggled){
				MdataService mdataservice = new MdataService();
				System.out.println(m_id);
				MdataVO	mdataVO = mdataservice.findByPrimaryKey(Integer.parseInt("1000"));
				Map map = new HashMap();
				map.put("bname", mdataVO.getB_name());
				map.put("bdes", mdataVO.getB_des());
				map.put("mname", mdataVO.getM_name());				
				map.put("mtel", mdataVO.getM_cel());
				map.put("mmail", mdataVO.getM_email());
				map.put("maddr", mdataVO.getM_addr());
				 Set<MProVO> mproset= mdataVO.getMpros();
//				String s = "";
				List list2=new ArrayList();
				 for(MProVO mpros:mproset){
					 list2.add(mpros.getM_pro());
				 }
				
				String mprostring = list2.toString().replaceAll("\\[", "").replaceAll("\\]", "");;
//				.replaceAll("\\[", "").replaceAll("\\]", "");
//				s=s+","+mpros.getM_pro();
				//.replace("\\{","").replace("\\}","");				
				System.out.println(mprostring);
				map.put("mpros",mprostring);
				jsonstrnig = JSONValue.toJSONString(map);
				System.out.println(jsonstrnig);
				
			}	
			out.write(jsonstrnig);
			out.close();
		}
		if("mpass".equals(functionaction)){
			
			MdataService mdataservice = new MdataService();
			System.out.println(arraytoggled);
			mdataservice.updatemasterSname(Integer.parseInt(arraytoggled[0].toString()),"審核通過");
			
			CdataService service = new CdataService();
			CdataVO cdataVO1 = service.getByM(Integer.parseInt(arraytoggled[0].toString()));
			String mss_id = cdataVO1.getC_id();
			
			EmailDAO dao = new EmailDAO();
			EmailVO emailVO = new EmailVO();
			
			emailVO.setMsr_id("sa");
			emailVO.setMss_id(mss_id);
			emailVO.setMs_summary("您已通過開店審核");
			emailVO.setMs_content(request.getParameter("恭喜您通過開店之審核，歡迎您加入師傅的行列"));
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			emailVO.setMs_date(timestamp);
			emailVO.setS_name(false);
			
			dao.insert(emailVO);
			out.write("已完成審核");
			out.close();
		}
		
		if("mnotpass".equals(functionaction)){
			

			MdataService mdataservice = new MdataService();
			System.out.println(arraytoggled);
			mdataservice.updatemasterSname(Integer.parseInt(arraytoggled[0].toString()),"審核未過");
			
			CdataService service = new CdataService();
			CdataVO cdataVO1 = service.getByM(Integer.parseInt(arraytoggled[0].toString()));
			String mss_id = cdataVO1.getC_id();
			
			EmailDAO dao = new EmailDAO();
			EmailVO emailVO = new EmailVO();
			
			emailVO.setMsr_id("sa");
			emailVO.setMss_id(mss_id);
			emailVO.setMs_summary("您未通過開店審核，請修改後再次申請");
			emailVO.setMs_content(request.getParameter("notpassword"));
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			emailVO.setMs_date(timestamp);
			emailVO.setS_name(false);
			
			dao.insert(emailVO);
			out.write("已退回審核申請");
			out.close();
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
		if("recoverm".equals(functionaction)){
			List<MdataVO> list = new ArrayList<MdataVO>();
			int count=0;
			for(String m_id:arraytoggled){
				MdataService mdataservice = new MdataService();
				System.out.println(m_id);
				int	returnedcount = mdataservice.updatemasterSname(Integer.parseInt(m_id),"審核通過");
			count= returnedcount+count;
			}	
			
			System.out.print(count);
			out.write("success");
			out.close();
			
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
			out.close();
		}
		if("recoverc".equals(functionaction)){
			List<CdataVO> list = new ArrayList<CdataVO>();
			int count=0;
			for(String c_id:arraytoggled){
				CdataService cdataservice = new CdataService();
			int	returnedcount = cdataservice.updatecustomerSname(c_id,"一般");
			count= returnedcount+count;
			}
			out = response.getWriter();
			System.out.print(count);
			out.write(count);
			out.close();
		}
		if("stopad".equals(functionaction)){
			
			int count=0;
			for(String ad_id:arraytoggled){
				AdService adservice = new AdService();
			adservice.updateAsDeleted(Integer.parseInt(ad_id),"已終止");			
			}
			
		}
		if("endr".equals(functionaction)){
			
			int count=0;
			for(String r_id:arraytoggled){
				RdataService rdataservice = new RdataService();
				rdataservice.updateSname(Integer.parseInt(r_id),"已結案");			
			}
			
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
			RequestDispatcher rd = request.getRequestDispatcher("/cdata/test1.jsp");
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
			out = response.getWriter();

		}
		//tested ok
		if("sacnote".equals(functionaction)){
		
			int count=0;
			
			CdataService cdataservice = new CdataService();
			cdataservice.updatecustomerSacnote(noteid,notevalue);
			System.out.print(notevalue);
			out = response.getWriter();

		}
		if("saonote".equals(functionaction)){
		
			Integer count=0;
			
			OrderService odataservice = new OrderService();
			odataservice.updateOrderSaonote(Integer.parseInt(noteid),notevalue);
			out = response.getWriter();

		}
		if("sarnote".equals(functionaction)){
			
			Integer count=0;
			
			RdataService rdataservice = new RdataService();
			rdataservice.updateReportSarnote(Integer.parseInt(noteid),notevalue);
			System.out.println(noteid);
			out = response.getWriter();

		}
	//for 致衡訂單回應
	if("orderresponse".equals(functionaction)){	
		List<CdataVO> list = new ArrayList<CdataVO>();
		int count=0;
		
		OrderService orderservice = new OrderService();
		orderservice.updateOrderSnameToInProgressById(Integer.parseInt(o_id));
		out = response.getWriter();
		System.out.print(count);
		out.write("您已回應成功");	
		out.close();
	}
	
	
	if("orderresponse1".equals(functionaction)){	
		List<CdataVO> list = new ArrayList<CdataVO>();
		int count=0;
	
		OrderService orderservice = new OrderService();
		orderservice.updateOrderSnameToUnfinishedReviewById(Integer.parseInt(o_id));
	out = response.getWriter();
		System.out.print(count);
		out.write("您已回應成功");	
		out.close();
	}
	if("orderresponse2".equals(functionaction)){	
		List<CdataVO> list = new ArrayList<CdataVO>();
		int count=0;
	
		OrderService orderservice = new OrderService();
		orderservice.updateOrderSnameToFishedById();
	out = response.getWriter();
		System.out.print(count);
		out.write("您已回應成功");	
		out.close();
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
