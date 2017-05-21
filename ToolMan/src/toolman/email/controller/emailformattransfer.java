package toolman.email.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
import toolman.email.model.EmailService;
import toolman.email.model.EmailVO;
import toolman.mdata.model.MdataDAO;
import toolman.mdata.model.MdataVO;

/**
 * Servlet implementation class emailformattransfer
 */
@WebServlet("/emailformattransfer")
public class emailformattransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emailformattransfer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String mailtype = req.getParameter("mailtype");
		String mss_id = req.getParameter("mss_id");
		if("tom".equals(mailtype)){
			MdataDAO mdatadao = new MdataDAO();
			CdataService service = new CdataService();
			CdataVO cdataVO = service.getByM(Integer.parseInt(mss_id));
			String C_id = cdataVO.getC_id();
		}	
		if("tob".equals(mailtype)){
			MdataDAO mdatadao2 = new MdataDAO();	
			CdataService service = new CdataService();
			MdataVO mdataVO2 = mdatadao2.getMasterByB(mss_id);		
			CdataVO cdataVO2 = service.getByM(mdataVO2.getM_id());
			mss_id = cdataVO2.getC_id();
		}
		if("toc".equals(mailtype)){
			
		}
		
//		String SendAccount = "sa";//benny test
		
		
		
	}

}
