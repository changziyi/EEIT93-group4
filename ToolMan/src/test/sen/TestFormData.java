package test.sen;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;

@WebServlet("/TestFormData")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class TestFormData extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		byte[] b0 = null;
		byte[] b1 = null;
		byte[] b2 = null;
		
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			String pName = part.getName();
			if (part.getContentType() != null) {
				if ("file0".equals(pName)) {
					InputStream in0 = part.getInputStream();
					b0 = new byte[in0.available()];
					in0.read(b0);
					in0.close();
				}
				if ("file1".equals(pName)) {
					InputStream in1 = part.getInputStream();
					b1 = new byte[in1.available()];
					in1.read(b1);
					in1.close();
				}
//				if ("file2".equals(pName)) {
//					InputStream in2 = part.getInputStream();
//					b2 = new byte[in2.available()];
//					in2.read(b2);
//					in2.close();
//				}
			}
		}
		
		
		MdataVO mdataVO = new MdataVO();
		mdataVO.setB_image(b0);
		mdataVO.setM_cer(b1);
		
		MdataService mdataSvc = new MdataService();
		mdataSvc.insert(mdataVO);
		
		
		
//		String email = "";
//		String password = "";
//		InputStream in = null;
//
//		Collection<Part> parts = request.getParts();
//		for (Part part : parts) {
//			String pName = part.getName();
//			String value = request.getParameter(pName);
//			System.out.println(part.getSize());
//			if (part.getContentType() == null) {
//
//				if (pName.equals("email")) {
//					email = value;
//				} else if (pName.equals("password")) {
//					password = value;
//				}
//
//			} else {
//
//				in = part.getInputStream();
//				in.close();
//			}
//		}
//
//
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		out.print("Hello! " + email + "," + password + ", thanks for sending your feedback.");
	}

}
