package toolman.mdata.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProService;
import toolman.mpro.model.MProVO;
import toolman.work.model.WorkService;
import toolman.work.model.WorkVO;
import toolman.workim.model.WorkimService;
import toolman.workim.model.WorkimVO;

@WebServlet("/master/master.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MdataServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println("action= " + action);
		
		if ("SearchMaster".equals(action)) {
			
			String m_city = request.getParameter("city");
			String m_district = request.getParameter("district");
			String input = request.getParameter("input");
			String m_pro = request.getParameter("pro");
			
			HttpSession session = request.getSession();
			MdataVO mdataVO = new MdataVO();
			
			mdataVO.setM_city(m_city);
			mdataVO.setM_district(m_district);
			mdataVO.setB_name(input);
			mdataVO.setM_name(m_pro);
			
			session.setAttribute("search", mdataVO);
			response.sendRedirect("masterList.jsp");
			return;
			
		}
		
		if ("SearchAll".equals(action)) {
			
			String m_city = "";
			String m_district = "";
			String m_pro = "";
			String input = "";
			HttpSession session = request.getSession();
			MdataVO mdataVO = new MdataVO();
			
			mdataVO.setM_city(m_city);
			mdataVO.setM_district(m_district);
			mdataVO.setB_name(input);
			mdataVO.setM_name(m_pro);
			
			session.setAttribute("search", mdataVO);
			response.sendRedirect("masterList.jsp");
			return;
			
		}
		
		if("SearchResult".equals(action)) {
			
			String m_city = request.getParameter("city");
			String m_district = request.getParameter("district");
			String m_pro = request.getParameter("pro");
			String input = request.getParameter("input");
			System.out.println("city= " + m_city);
			System.out.println("district= " + m_district);
			System.out.println("input= " + input);
			System.out.println("pro= " + m_pro);
			
			HttpSession session = request.getSession();
			MdataVO mdataVO = new MdataVO();
			
			mdataVO.setM_city(m_city);
			mdataVO.setM_district(m_district);
			mdataVO.setB_name(input);
			mdataVO.setM_name(m_pro);
			
			session.setAttribute("search", mdataVO);
			response.sendRedirect("masterList.jsp");
			return;
			
		}
		
		if ("OpenStoreStep".equals(action)) {

			Map<String, String> errorMsgs = new HashMap<String, String>();
			HttpSession session = request.getSession();
			session.setAttribute("errorMsgs", errorMsgs);
			MdataVO mdataVO = new MdataVO();

			String m_name = request.getParameter("m_name");
			String m_cel = request.getParameter("m_cel");
			String m_email = request.getParameter("m_email");
			String m_city = request.getParameter("m_city");
			String m_district = request.getParameter("m_district");
			String m_addr = request.getParameter("m_addr");
			Part part = request.getPart("m_cer");

			if (m_name == null || (m_name.trim()).length() == 0) {
				errorMsgs.put("name1", "請勿空白");
			}

			String m_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (!m_name.trim().matches(m_nameReg)) {
				errorMsgs.put("name2", "員工姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			if (m_cel == null || (m_cel.trim()).length() == 0) {
				errorMsgs.put("cel", "請勿空白");
			}

			// if (m_email == null || (m_email.trim()).length() == 0) {
			// errorMsgs.put("email", "請勿空白");
			// }

			if (m_city == null || m_city.trim().length() == 0) {
				errorMsgs.put("city", "請選擇縣市和地區");
			}

			if (m_addr == null || (m_addr.trim()).length() == 0) {
				errorMsgs.put("addr", "請輸入地址");
			}

			String[] m_pro = request.getParameterValues("m_pro");

			Set<MProVO> set = null;
			if (m_pro != null) {
				set = new HashSet<MProVO>();
				for (int i = 0; i < m_pro.length; i++) {
					MProVO m_proVO = new MProVO();
					m_proVO.setMdataVO(mdataVO);
					m_proVO.setM_pro(m_pro[i]);
					set.add(m_proVO);
				}
			} else {
				errorMsgs.put("m_pro", "請勾選專業");
			}

			InputStream in = part.getInputStream();
			byte[] m_cer = new byte[in.available()];
			in.read(m_cer);
			in.close();

			Timestamp m_jdate = new Timestamp(System.currentTimeMillis());

			mdataVO.setM_name(m_name);
			mdataVO.setM_cel(m_cel);
			mdataVO.setM_email(m_email);
			mdataVO.setM_city(m_city);
			mdataVO.setM_district(m_district);
			mdataVO.setM_addr(m_addr);
			mdataVO.setMpros(set);
			mdataVO.setM_cer(m_cer);
			mdataVO.setM_jdate(m_jdate);

			if (!errorMsgs.isEmpty()) {
				session.setAttribute("cdata_mdataVO", mdataVO);
				response.sendRedirect("OpenStoreInfo.jsp");
				return;
			}

			// MdataService mdataSvc = new MdataService();
			// mdataSvc.insert(mdataVO);

			session.setAttribute("cdata_mdataVO", mdataVO);
			response.sendRedirect("OpenStoreDesc.jsp");
			return;

		}

		if ("OpenStoreComplete".equals(action)) {

			Map<String, String> errorMsgs = new HashMap<String, String>();
			HttpSession session = request.getSession();
			session.setAttribute("errorMsgs", errorMsgs);

			String b_name = request.getParameter("b_name");
			String b_des = request.getParameter("b_des");
			Part part = request.getPart("b_image");
			System.out.println("B: " + part.getSize());

			if (b_name == null || (b_name.trim()).length() == 0) {
				errorMsgs.put("cel", "請勿空白");
			}
			
			InputStream in = part.getInputStream();
			byte[] b_image = new byte[in.available()];
			in.read(b_image);
			in.close();
			
			MdataVO mdataVO = (MdataVO)session.getAttribute("cdata_mdataVO");
			mdataVO.setB_name(b_name);
			mdataVO.setB_des(b_des);
			mdataVO.setB_image(b_image);
			
			//初始化師父資料
			mdataVO.setM_arating(0);
			mdataVO.setO_current(0);
			mdataVO.setO_finished(0);
			mdataVO.setS_name("審核未通過");
			
			if (!errorMsgs.isEmpty()) {
				session.setAttribute("cdata_mdataVO", mdataVO);
				response.sendRedirect("OpenStoreDesc.jsp");
				return;
			}
			
			MdataService mdataSvc = new MdataService();
			mdataSvc.insert(mdataVO);
			
			session.setAttribute("cdata_mdataVO", mdataVO);
			response.sendRedirect("OpenStoreCheck.jsp");
			return;

		}
		
		if ("updateMaster".equals(action)) {
			
			Map<String, String> errorMsgs = new HashMap<String, String>();
			HttpSession session = request.getSession();
			session.setAttribute("errorMsgs", errorMsgs);
			
			String m_name = request.getParameter("m_name");
			String m_cel = request.getParameter("m_cel");
			String m_email = request.getParameter("m_email");
			String m_city = request.getParameter("m_city");
			String m_district = request.getParameter("m_district");
			String m_addr = request.getParameter("m_addr");
			Part partcer = request.getPart("m_cer");
			String[] m_pro = request.getParameterValues("m_pro");
			String b_name = request.getParameter("b_name");
			String b_des = request.getParameter("b_des");
			Part partbim = request.getPart("b_image");
			
			InputStream incer = partcer.getInputStream();
			byte[] m_cer = new byte[incer.available()];
			incer.read(m_cer);
			incer.close();
			
			InputStream inbimg = partbim.getInputStream();
			byte[] b_image = new byte[inbimg.available()];
			inbimg.read(b_image);
			inbimg.close();
			
			MdataVO mdataVO = (MdataVO)session.getAttribute("mdataVO");
			Integer m_id = mdataVO.getM_id();
			
			mdataVO.setM_name(m_name);
			mdataVO.setM_cel(m_cel);
			mdataVO.setM_email(m_email);
			mdataVO.setM_city(m_city);
			mdataVO.setM_district(m_district);
			mdataVO.setM_addr(m_addr);
			mdataVO.setM_cer(m_cer);
			mdataVO.setB_name(b_name);
			mdataVO.setB_des(b_des);
			mdataVO.setB_image(b_image);
			
			MdataService mdataSvc = new MdataService();
			mdataSvc.updateSql(mdataVO);
			
			MProService mproSvc = new MProService();
			mproSvc.deleteSql(m_id);
			
			if (m_pro != null) {
				for (int i = 0; i < m_pro.length; i++) {
					mproSvc.insertSql(m_id, m_pro[i]);
				}
			}
			
			Set<MProVO> set = null;
			if (m_pro != null) {
				set = new HashSet<MProVO>();
				for (int i = 0; i < m_pro.length; i++) {
					MProVO m_proVO = new MProVO();
					m_proVO.setMdataVO(mdataVO);
					m_proVO.setM_pro(m_pro[i]);
					set.add(m_proVO);
				}
			}
			
			mdataVO.setMpros(set);
			session.setAttribute("mdataVO", mdataVO);
			
		}
		
		if ("uploadwork".equals(action)) {
			
			HttpSession session = request.getSession();
			MdataVO mdataVO = (MdataVO)session.getAttribute("mdataVO");
			
			byte[] img1 = null;
			byte[] img2 = null;
			byte[] img3 = null;
			String work_name = "";
			String work_des = "";
			
			Collection<Part> parts = request.getParts();
			for (Part part : parts) {
				String pName = part.getName();
				if (part.getContentType() != null) {
					if ("file0".equals(pName)) {
						InputStream in0 = part.getInputStream();
						img1 = new byte[in0.available()];
						in0.read(img1);
						in0.close();
					}
					if ("file1".equals(pName)) {
						InputStream in1 = part.getInputStream();
						img2 = new byte[in1.available()];
						in1.read(img2);
						in1.close();
					}
					if ("file2".equals(pName)) {
						InputStream in2 = part.getInputStream();
						img3 = new byte[in2.available()];
						in2.read(img3);
						in2.close();
					}
				} else {
					String fldName = part.getName();
					String value = request.getParameter(fldName);
					if ("workname".equals(fldName)) {
						work_name = value;
					} else if ("workdes".equals(fldName)) {
						work_des = value;
					}
				}
			}
			
			System.out.println("work_name:" + work_name);
			System.out.println("work_des:" + work_des);
			System.out.println("img1:" + img1);
			System.out.println("img2:" + img2);
			System.out.println("img3:" + img3);
			
			WorkVO workVO = new WorkVO();
			workVO.setMdataVO(mdataVO);
			workVO.setWork_name(work_name);
			workVO.setWork_des(work_des);
			workVO.setImg1(img1);
			workVO.setImg2(img2);
			workVO.setImg3(img3);
			
			WorkimVO workimVO1 = new WorkimVO();
			WorkimVO workimVO2 = new WorkimVO();
			WorkimVO workimVO3 = new WorkimVO();
			
			Set<WorkimVO> workims = new HashSet<WorkimVO>();
			
			if (img1 != null) {
				workimVO1.setWorkVO(workVO);
				workimVO1.setIm_show(img1);
				workims.add(workimVO1);
			}
			if (img2 != null) {
				workimVO2.setWorkVO(workVO);
				workimVO2.setIm_show(img2);
				workims.add(workimVO2);
			}
			if (img3 != null) {
				workimVO3.setWorkVO(workVO);
				workimVO3.setIm_show(img3);
				workims.add(workimVO3);
			}
			
			workVO.setWorkims(workims);
			
			WorkService workSvc = new WorkService();
			workSvc.insert(workVO);
			
		}
		
		
		if ("deleteworkim".equals(action)) {
			
			Integer work_id = new Integer(request.getParameter("work_id"));
			WorkService workSvc = new WorkService();
			workSvc.delete(work_id);
			
		}
		

	} // doPost

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String type = request.getParameter("type");
		String action = request.getParameter("action");
		
		if ("SearchAll".equals(action)) {
			doPost(request, response);
		}
		
		if ("master".equals(type)) {
			String image = request.getParameter("image");
			Integer m_id = new Integer(image);
			response.setContentType("image/jpeg");

			ServletOutputStream out = response.getOutputStream();
			MdataService mdataSvc = new MdataService();
//			MdataVO mdataVO = mdataSvc.findByPrimaryKey(m_id);
//			byte[] b_image = mdataVO.getB_image();
			byte[] b_image = mdataSvc.getImg(m_id);

			if (b_image == null || b_image.length == 0) {
				InputStream in = getServletContext().getResourceAsStream("/images/no_image.PNG");
				b_image = new byte[in.available()];
				in.read(b_image);
				out.write(b_image);
				in.close();
			}

			out.write(b_image);
			out.close();

			// if (b_image.length != 0) {
			// out.write(b_image);
			// } else {
			// InputStream in =
			// getServletContext().getResourceAsStream("/image/harden.jpg");
			// byte[] buff = new byte[8192];
			// int len = 0;
			// while ((len = in.read(buff)) != -1) {
			// out.write(buff, 0, len);
			// }
			// }
			// out.close();
		}
		
		if ("cer".equals(type)) {
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
		
		if ("work".equals(type)) {
			String image = request.getParameter("image");
			Integer img = new Integer(image);
			response.setContentType("image/jpeg");

			ServletOutputStream out = response.getOutputStream();
			
			WorkimService workimSvc = new WorkimService();
//			Collection<WorkimVO> workims = workimSvc.getByWorkid(img);
			byte[] workim = workimSvc.getImg(img);
			
			out.write(workim);
			out.close();
		}
		
		
	} // doGet

}
