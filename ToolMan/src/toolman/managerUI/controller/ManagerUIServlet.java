package toolman.managerUI.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataDAO;
import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProVO;
import toolman.opro.model.OproVO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

/**
 * Servlet implementation class managerUIservlet
 */
@WebServlet("/toolman.managerUI.controller/ManagerUIServlet.do")
public class ManagerUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManagerUIServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String topnavigatorid = request.getParameter("topnavigatorid");
//		action = "c";
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		
		//get m tested ok
		if("m".equals(topnavigatorid)){
							
			MdataDAO dao = new MdataDAO();
			List<MdataVO> mdatas = dao.getAll();
			List<Map> jList = new LinkedList<Map>();
			for (MdataVO aMdata : mdatas) {
				Map jContent = new HashMap();
				jContent.put("M_id", aMdata.getM_id());
				jContent.put("B_name", aMdata.getB_name());
				jContent.put("M_name", aMdata.getM_name());
				jContent.put("M_city", aMdata.getM_city());
				jContent.put("M_addr", aMdata.getM_addr());
				jContent.put("M_district", aMdata.getM_district());
				jContent.put("M_arating", aMdata.getM_arating());
				jContent.put("S_name", aMdata.getS_name());
				jContent.put("Sa_mnote", aMdata.getSa_mnote());
				Set<MProVO> mpros = aMdata.getMpros();
				for(MProVO getmpros:mpros){
				jContent.put("Mpros", getmpros.getM_pro());
				}
				jList.add(jContent);
			}			
			String mjasonstring = JSONValue.toJSONString(jList);
			out.write(mjasonstring);
			out.flush();
			System.out.println(mjasonstring);
		}
		
		//get c tested ok
		if("c".equals(topnavigatorid)){
			
			CdataService cdataservice = new CdataService();
			List<CdataVO> list = cdataservice.getAll();
			
			List list2 = new ArrayList();
				for(CdataVO cdataVO:list){
					Map map = new HashMap();
					Timestamp c_jdatestamp =	cdataVO.getC_jdate();
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String c_jdate = df.format(c_jdatestamp);
					String c_name =	cdataVO.getC_name();
					String c_id	= cdataVO.getC_id();
					String c_addr = cdataVO.getC_addr();
					String c_district = cdataVO.getC_district();
					String c_city = cdataVO.getC_city();
					String c_location = c_city + c_district + c_addr;					
					String s_name = cdataVO.getS_name();
					Integer c_averrating = cdataVO.getC_averrating();
					String sa_cnote	=cdataVO.getSa_cnote();
					System.out.println(c_id);
					map.put("c_jdate",c_jdate);
					map.put("c_name",c_name);
					map.put("c_id",c_id);
					map.put("c_city",c_city);
					map.put("c_district",c_district);
					map.put("c_addr",c_addr);
					map.put("s_name",s_name);
					map.put("c_averrating",c_averrating);
					map.put("sa_cnote",sa_cnote);	
					list2.add(map);
				}
				String cjasonstring = JSONValue.toJSONString(list2);
				System.out.println(cjasonstring);
				out.write(cjasonstring);
				out.flush();
				System.out.println(cjasonstring);

		}
		
		//get o tested ok
		if("o".equals(topnavigatorid)){
			OrderService orderservice = new OrderService();
			out.write(orderservice.getAllOrderJson());
//			System.out.println(ojasonstring);
		
			
			//tested ok
//			List list = new ArrayList();
//			Map map = new HashMap();
//			map.put("c_jdate","1");
//			map.put("c_name","2");
//			map.put("c_id","3");
//			list.add(map);
//			String mjasonstring = JSONValue.toJSONString(list);
//			out.write(mjasonstring);
//			out.flush();
		}
			
		//get report
		if("r".equals(topnavigatorid)){
			
			
			
		}
		//get analysis
		if("a".equals(topnavigatorid)){
			
			
			
		}
		//get ad
		if("ad".equals(topnavigatorid)){
			
			
			
		}

	}
	protected void doPost(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
			doGet(requset, response);
		}
	

}
