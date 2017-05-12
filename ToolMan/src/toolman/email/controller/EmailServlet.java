package toolman.email.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

import toolman.cdata.model.CdataVO;
import toolman.email.model.EmailDAO;
import toolman.email.model.EmailService;
import toolman.email.model.EmailVO;
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
	
//	//取得單筆mail
//	HttpSession session = req.getSession();
//	EmailVO emailVO = (EmailVO)session.getAttribute("");
//	String Account = cdataVO.getC_id();
//			
//}
	
	// 取得信件流水編號
//	String ms_id_str = req.getParameter("ms_id");
//	Integer ms_id = new Integer(ms_id_str);

	

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		

	

		
		//取得登入的寄件人帳號
		HttpSession session = req.getSession();
		CdataVO cdataVO = (CdataVO)session.getAttribute("LoginOK");
		String SendAccount = cdataVO.getC_id();
		
		// 宣告錯誤訊息的變數
		Map<String, String> errorMsgs = new HashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);
		EmailVO emailVO = new EmailVO();
				
		// 收件者帳號
		String mss_id = req.getParameter("mss_id");
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

		emailVO.setMsr_id(SendAccount);
		emailVO.setMss_id(mss_id);
		emailVO.setMs_summary(ms_summary);
		emailVO.setMs_content(ms_content);
		emailVO.setMs_date(ms_date);
		emailVO.setS_name(false);
		emailserv.insert(emailVO);
		
		System.out.println("msid: " + emailVO.getMs_id());
		
		res.sendRedirect("email.jsp");
		
//		if (!errorMsgs.isEmpty()) {
//			req.setAttribute("emailVO", emailVO);
//			RequestDispatcher failureView = req.getRequestDispatcher("/email/Email.jsp");
//			failureView.forward(req, res);
//			return;
//		}

//		req.setAttribute("emailVO", emailservice.findByPrimaryKey(emailVO.getMs_id()));
//		RequestDispatcher successView = req.getRequestDispatcher("/email/emailsucess.jsp");
//		successView.forward(req, res);
//		return;
//		
//		
		
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


