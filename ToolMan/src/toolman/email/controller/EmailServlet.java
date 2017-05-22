package toolman.email.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.transaction.SystemException;

import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
import toolman.email.model.EmailDAO;
import toolman.email.model.EmailService;
import toolman.email.model.EmailVO;
import toolman.mdata.model.MdataDAO;
import toolman.mdata.model.MdataVO;
import toolman.email.model.EmailVO;

@WebServlet("/email/Email.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmailService emailservice = new EmailService();

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//取得登入的收件人帳號
		HttpSession session = req.getSession();
		String action = req.getParameter("action");
		String msid = req.getParameter("msid");
		
		if("findbypk".equals(action)){
			EmailService emailSvc1 = new EmailService();
			EmailVO emailVO = emailSvc1.getOneMail(new Integer(msid));
			req.setAttribute("Onelist", emailVO);
			
		}
	}



	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		//刪除Email
		PrintWriter out = res.getWriter();
		EmailService EmailServiceSVC = new EmailService();
		String action2 = req.getParameter("action");
		String ms_id = req.getParameter("ms_id");
	
		System.out.println(ms_id);
		if("del1".equals(action2)){
			System.out.println("ms_id");
			EmailServiceSVC.deleteEmailService(new Integer(ms_id));
			res.sendRedirect("email.jsp");
			return;
		}
		
		//取得登入的寄件人帳號
		HttpSession session = req.getSession();
		CdataVO cdataVO = (CdataVO)session.getAttribute("LoginOK");
//		String SendAccount = cdataVO.getC_id();
		//by benny
		String SendAccount = "sa";//benny test
		// 收件者帳號
		String mss_id = req.getParameter("mss_id");
		//by benny tested ok
		if("tom".equals(req.getParameter("mailtype"))){
			MdataDAO mdatadao = new MdataDAO();
			CdataService service = new CdataService();
			CdataVO cdataVO1 = service.getByM(Integer.parseInt(mss_id));
			mss_id = cdataVO1.getC_id();
		}	
		else if("tob".equals(req.getParameter("mailtype"))){
			MdataDAO mdatadao2 = new MdataDAO();	
			CdataService service = new CdataService();
			MdataVO mdataVO2 = mdatadao2.getMasterByB(mss_id);		
			CdataVO cdataVO2 = service.getByM(mdataVO2.getM_id());
			mss_id = cdataVO2.getC_id();
		}
		
		
		
		// 宣告錯誤訊息的變數
		Map<String, String> errorMsgs = new HashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);
		EmailVO emailVO = new EmailVO();
		

		if (mss_id == null || mss_id.trim().length() == 0) {
			errorMsgs.put("mss_id1", "請輸入收件者帳號");
		}
		

		// 主旨
		String ms_summary = req.getParameter("ms_summary");
		if (ms_summary == null || ms_summary.trim().length() == 0) {
			errorMsgs.put("summary1", "請輸入主旨");
			
		}
		

		// 內容
		String ms_content = req.getParameter("ms_content");
		if (ms_content == null || ms_content.trim().length() == 0) {
			errorMsgs.put("content1", "請輸入內容");
		}
		
		// 當下時間
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp ms_date = new Timestamp(System.currentTimeMillis());
		

		// 狀態
		EmailService emailserv = new EmailService();
		System.out.println("mssid="+mss_id);
		emailVO.setMsr_id(SendAccount);
		emailVO.setMss_id(mss_id);
		emailVO.setMs_summary(ms_summary);
		emailVO.setMs_content(ms_content);
		emailVO.setMs_date(ms_date);
		emailVO.setS_name(false);
		emailVO.setMs_trash(false);
		emailserv.insert(emailVO);
		
		System.out.println("msid: " + emailVO.getMs_id());
		
		
		//之前因為如果有輸入null會讓管理者後端無法出現兩次，所以判斷來源為管理者後端就不處理。
		if("http://localhost:8081/ToolMan/manager.backstageUI/managerUI.jsp".equals(req.getHeader("referer"))){
			System.out.println("get null value");
		}else{
			res.sendRedirect("email.jsp");
		}
		//之前因為如果有輸入null會讓管理者後端無法出現兩次，所以判斷來源為管理者後端就不處理。
		if("http://localhost:8081/ToolMan/manager.backstageUI/managerUI.jsp".equals(req.getHeader("referer"))){
			System.out.println("get null value");
		}else
		 if (!errorMsgs.isEmpty()) {
			req.setAttribute("emailVO", emailVO);
			RequestDispatcher failureView = req.getRequestDispatcher("/email/Email.jsp");
			failureView.forward(req, res);
			return;		
		}
		
		//之前因為如果有輸入null會讓管理者後端無法出現兩次，所以判斷來源為管理者後端就不處理。
//		System.out.println(req.getHeader("referer"));
//		if("http://localhost:8081/ToolMan/manager.backstageUI/managerUI.jsp".equals(req.getHeader("referer"))){
//			System.out.println("ok");
//		}else{
//			req.setAttribute("emailVO", emailservice.findByPrimaryKey(emailVO.getMs_id()));
//			RequestDispatcher successView = req.getRequestDispatcher("/email/emailsucess.jsp");
//			successView.forward(req, res);
//		}
		
		
		
		List<EmailVO> list = new ArrayList<EmailVO>();
		EmailVO email1 = new EmailVO();

		email1.setMss_id(mss_id);
		email1.setMs_summary(ms_summary);
		email1.setMs_content(ms_content);
		list.add(email1);
		emailservice.getAll();
		
		for (int i = 0 ; i < list.size() ; i++) {
			EmailVO vo = list.get(i);
		}	
		
		//測試用
		System.out.println("確認表單上傳成功");
		System.out.println(mss_id);
		System.out.println(ms_summary);
		System.out.println(ms_content);

		
		}
	}


