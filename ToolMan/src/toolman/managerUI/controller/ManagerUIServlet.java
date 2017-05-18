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

import toolman.ad.model.AdService;
import toolman.ad.model.AdVO;
import toolman.cdata.model.CdataDAO;
import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataDAO;
import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProVO;
import toolman.opro.model.OproVO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;
import toolman.rdata.model.RdataDAO;
import toolman.rdata.model.RdataService;
import toolman.rdata.model.RdataVO;

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
		
		String topnavigatorid = request.getParameter("navigatorid");
		String datastatus = request.getParameter("datastatus");
		String datatime = request.getParameter("datatime");

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

//		topnavigatorid="o";
//		datastatus="一方未評分";
//		datatime="alldate";
		
		//get m tested ok
		if("m".equals(topnavigatorid)){
			MdataDAO dao = new MdataDAO();
			List<MdataVO> mdatas = null;
				if("allmaster".equals(datastatus)){				
					 mdatas = dao.getAll();				
				}//end if		
				else{
					 mdatas = dao.getBySname(datastatus);
				}//end else	
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
						}// end for loop
						jList.add(jContent);
					}//end for loop
					String mjasonstring = JSONValue.toJSONString(jList);
					out.write(mjasonstring);
					out.flush();
					System.out.println(mjasonstring);				
		}//end if m
		
		//get c tested ok
		if("c".equals(topnavigatorid)){
			CdataDAO dao = new CdataDAO();
			List<CdataVO> list = null;
			
			if("allcustomer".equals(datastatus)){				
				list = dao.getAll();		
			}//end if		
			else{
				list = dao.getBySname(datastatus);
			}//end else	

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
				}//end for loop
				String cjasonstring = JSONValue.toJSONString(list2);
				System.out.println(cjasonstring);
				out.write(cjasonstring);
				out.flush();
				System.out.println(cjasonstring);

		}//end if c
		
		//get o tested ok
		if("o".equals(topnavigatorid)){
			OrderService orderservice = new OrderService();
			
			if("allorder".equals(datastatus)){	
				
				out.write(orderservice.getAllOrderJson());
				
			}else if(!"allorder".equals(datastatus)&&"alldate".equals(datatime)){
				out.write(orderservice.getBySnameJson(datastatus));
			}//end if		
			else if(!"allorder".equals(datastatus)&&!"alldate".equals(datatime)){
				if ("oneyear".equals(datatime)){
					
					Timestamp o_tdate1 = new Timestamp(System.currentTimeMillis());
					Timestamp o_tdate2 = new Timestamp(System.currentTimeMillis()-31536000000L);//365*24*60*60*1000
					out.write(orderservice.getOrderBySnameAndDateJson(datastatus,o_tdate1,o_tdate2));
					
				}//end else	
				else if ("halfyear".equals(datatime)){
					
					Timestamp o_tdate1 = new Timestamp(System.currentTimeMillis());
					Timestamp o_tdate2 = new Timestamp(System.currentTimeMillis()-15768000000L);//365/2*24*60*60*1000
					out.write(orderservice.getOrderBySnameAndDateJson(datastatus,o_tdate1,o_tdate2));
	
				}//end else	
				else if ("onemonth".equals(datatime)){
					
					Timestamp o_tdate1 = new Timestamp(System.currentTimeMillis());
					Timestamp o_tdate2 = new Timestamp(System.currentTimeMillis()-2592000000L);//365/2*24*60*60*1000
					out.write(orderservice.getOrderBySnameAndDateJson(datastatus,o_tdate1,o_tdate2));
	
					}//end else	
			}//else if datetime is not empty
			
			
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
		}//end if o
			
		//get report
		if("r".equals(topnavigatorid)){
			RdataService rdataservice = new RdataService();
			List<RdataVO> list = null;
			
			if("allreport".equals(datastatus)){	
				list = rdataservice.getAll();//need to add method in rdata
					
			}//end if		
			else{
				list = rdataservice.getBySname(datastatus);	
			}//end else	

			List listr = new ArrayList();
				for(RdataVO rdataVO:list){
					Map map = new HashMap();
					Timestamp getrdate = rdataVO.getR_date();
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String r_date = df.format(getrdate);
					Integer r_id =rdataVO.getR_id();
					String c_id =	rdataVO.getC_id();
					Integer m_id	= rdataVO.getM_id();
					String p_summary = rdataVO.getP_summary();	
					String p_content = rdataVO.getP_content();
					String s_name = rdataVO.getS_name();
					String sa_cnote	=rdataVO.getSa_rnote();
					System.out.println(c_id);
					map.put("r_date",r_date);
					map.put("r_id",r_id);
					map.put("c_id",c_id);
					map.put("m_id",m_id);
					map.put("p_summary",p_summary);
					map.put("p_content",p_content);	
					map.put("s_name",s_name);	
					map.put("sa_cnote",sa_cnote);	
					listr.add(map);
				}//end for loop
				String cjasonstring = JSONValue.toJSONString(listr);
				System.out.println(cjasonstring);
				out.write(cjasonstring);
				out.flush();
				System.out.println(cjasonstring);
			
			
		}
		//get analysis
		if("a".equals(topnavigatorid)){
			
			
			
		}
		//get ad
		if("ad".equals(topnavigatorid)){
			AdService adservice = new AdService();
			
			List<AdVO> list = null;
			
			if("allreport".equals(datastatus)){	
				list = adservice.getAll();//need to add method in rdata
					
			}//end if		
			else{
				list = adservice.findBySname(datastatus);	
			}//end else	

			List listad = new ArrayList();
				for(AdVO adVO:list){
					
					Map map = new HashMap();
					Integer ad_id =adVO.getAd_id();
					Timestamp getbdate = adVO.getAd_bdate();
					Timestamp getenddate =adVO.getAd_enddate();
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");										
					String ad_bdate = df.format(getbdate);
					String ad_enddate =df.format(getenddate);
					
					Integer m_id= adVO.getM_id();
					String s_name = adVO.getS_name();
					System.out.println(ad_id);
					map.put("ad_bdate",ad_bdate);
					map.put("ad_enddate",ad_enddate);
					map.put("ad_id",ad_id);
					map.put("m_id",m_id);
					map.put("s_name",s_name);
					
					listad.add(map);
					
				}//end for loop
				String cjasonstring = JSONValue.toJSONString(listad);
				System.out.println(cjasonstring);
				out.write(cjasonstring);
				out.flush();
				System.out.println(cjasonstring);
						
		}

	}
	protected void doPost(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
			doGet(requset, response);
		}
	

}
