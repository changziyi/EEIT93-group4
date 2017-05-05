package toolman.mdata.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
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
import toolman.mpro.model.MProVO;

@WebServlet("/master/master.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MdataServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

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
			
			MdataVO mdataVO = (MdataVO)session.getAttribute("mdataVO");
			mdataVO.setB_name(b_name);
			mdataVO.setB_des(b_des);
			mdataVO.setB_image(b_image);
			
			//初始化師父資料
			mdataVO.setM_arating(0);
			mdataVO.setO_current(0);
			mdataVO.setO_finished(0);
			mdataVO.setS_name("m_nchecked");
			
			if (!errorMsgs.isEmpty()) {
				session.setAttribute("mdataVO", mdataVO);
				response.sendRedirect("OpenStoreDesc.jsp");
				return;
			}
			
			MdataService mdataSvc = new MdataService();
			mdataSvc.insert(mdataVO);
			
			session.setAttribute("mdataVO", mdataVO);
			response.sendRedirect("OpenStoreCheck.jsp");
			return;

		}

	} // doPost

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String type = request.getParameter("type");

		if ("master".equals(type)) {
			String image = request.getParameter("image");
			Integer img = new Integer(image);
			response.setContentType("image/jpeg");

			ServletOutputStream out = response.getOutputStream();
			MdataService mdataSvc = new MdataService();
			MdataVO mdataVO = mdataSvc.findByPrimaryKey(img);
			byte[] b_image = mdataVO.getB_image();

			if (b_image == null || b_image.length == 0) {
				InputStream in = getServletContext().getResourceAsStream("/image/jake.gif");
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
				InputStream in = getServletContext().getResourceAsStream("/image/jake.gif");
				m_cer = new byte[in.available()];
				in.read(m_cer);
				out.write(m_cer);
				in.close();
			}

			out.write(m_cer);
			out.close();
		}
		
		
	} // doGet

}
