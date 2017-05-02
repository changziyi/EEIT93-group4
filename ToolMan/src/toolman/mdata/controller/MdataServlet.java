package toolman.mdata.controller;

import java.io.File;
import java.io.FileInputStream;
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
import javax.servlet.http.Part;

import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProVO;

@WebServlet("/master/master.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MdataServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		if ("OpenStore".equals(action)) {
			
			Map<String, String> errorMsgs = new HashMap<String, String>();
			request.setAttribute("errorMsgs", errorMsgs);
			MdataVO mdataVO = new MdataVO();

			String m_name = request.getParameter("m_name");

			if (m_name == null || m_name.trim().length() == 0) {
				errorMsgs.put("name1", "請勿空白");
			}

			String m_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (!m_name.trim().matches(m_nameReg)) {
				errorMsgs.put("name2", "員工姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}
			
			String m_city = request.getParameter("m_city");
			String m_district = request.getParameter("m_district");
			System.out.println("m_city" + m_city);
			System.out.println("m_district" + m_district);
			
			if (m_city == null || m_city.trim().length() == 0) {
				errorMsgs.put("city", "請選擇縣市和地區");
			}
			
			Part part = request.getPart("b_image");
			InputStream in = part.getInputStream();
			// System.out.println("size:" + part.getSize());
			// System.out.println("in:" + in);

			// if (part.getSize() == 0) {
			// InputStream in =
			// getServletContext().getResourceAsStream("/image/harden.jpg");
			// }

			byte[] buf = new byte[in.available()];
			in.read(buf);
			in.close();

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

			Timestamp m_jdate = new Timestamp(System.currentTimeMillis());

			mdataVO.setM_name(m_name);
			mdataVO.setB_image(buf);
			mdataVO.setM_jdate(m_jdate);
			mdataVO.setM_city(m_city);
			mdataVO.setM_district(m_district);
			mdataVO.setMpros(set);

			if (!errorMsgs.isEmpty()) {
				request.setAttribute("mdataVO", mdataVO);
				RequestDispatcher failureView = request.getRequestDispatcher("/master/OpenStore.jsp");
				failureView.forward(request, response);
				return;
			}

			MdataService mdataSvc = new MdataService();
			mdataSvc.insert(mdataVO);

			request.setAttribute("mdataVO", mdataSvc.findByPrimaryKey(mdataVO.getM_id()));
			RequestDispatcher successView = request.getRequestDispatcher("/master/TestPhoto.jsp");
			successView.forward(request, response);
			return;
		}
		

	} // doPost
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Integer img = new Integer(request.getParameter("image"));
		response.setContentType("image/jpeg");

		ServletOutputStream out = response.getOutputStream();
		MdataService mdataSvc = new MdataService();
		MdataVO mdataVO = mdataSvc.findByPrimaryKey(img);
		byte[] b_image = mdataVO.getB_image();

		if (b_image == null || b_image.length == 0) {
			InputStream in = getServletContext().getResourceAsStream("/image/harden.jpg");
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

	} // doGet

}
