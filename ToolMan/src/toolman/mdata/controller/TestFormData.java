package toolman.mdata.controller;

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
import toolman.work.model.WorkService;
import toolman.work.model.WorkVO;

@WebServlet("/master/TestFormData")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class TestFormData extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		byte[] img1 = null;
		byte[] img2 = null;
		byte[] img3 = null;
		
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
			}
		}
		
		WorkVO workVO = new WorkVO();
		workVO.setImg1(img1);
		workVO.setImg2(img2);
		workVO.setImg3(img3);
		
		WorkService workSvc = new WorkService();
		workSvc.insert(workVO);
		
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		out.print("Hello! " + email + "," + password + ", thanks for sending your feedback.");
	}

}
