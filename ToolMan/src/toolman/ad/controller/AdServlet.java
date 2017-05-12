package toolman.ad.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;

@WebServlet("/AdServlet")
public class AdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {

		String type = req.getParameter("type");

		if ("ad".equals(type)) {
			String image = req.getParameter("image");
			Integer img = new Integer(image);
			res.setContentType("image/jpeg");

			ServletOutputStream out = res.getOutputStream();
			MdataService mdataSvc = new MdataService();
			MdataVO mdataVO = mdataSvc.findByPrimaryKey(img);
			byte[] b_image = mdataVO.getB_image();

			if (b_image == null || b_image.length == 0) {
				InputStream in = getServletContext().getResourceAsStream("/images/no_image.PNG");
				b_image = new byte[in.available()];
				in.read(b_image);
				out.write(b_image);
				in.close();
			}

			out.write(b_image);
			out.close();
	}
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
           
		req.setCharacterEncoding("UTF-8");
		// 設定文字編碼形式
		
		
		
		
		
		
	}

}
