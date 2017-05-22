package toolman.cdata.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;

@WebServlet("/cdata/Cdata.do")
public class CdataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//存放錯誤訊息
		Map<String, String> errorMsgs = new HashMap<>();
		HttpSession session = req.getSession();
		req.setAttribute("errorMsgs", errorMsgs);
		// 設定輸入資料的編碼
		req.setCharacterEncoding("UTF-8");	
		
		
		/******************************** 註冊 ***********************************/		
		
		try {
			// 帳號
			String c_id = req.getParameter("id");
			if (c_id == null || c_id.trim().length() == 0) {
				errorMsgs.put("c_id", "請輸入帳號！");
			}
			//不可含有「-」、「_」以外的符號！
			// 密碼
			String c_pwd = req.getParameter("pswd");
			if (c_pwd == null || c_pwd.trim().length() == 0) {
				errorMsgs.put("c_pwd", "請輸入密碼！");
			} else {
				String s_pwd = "^(?!.*[^a-zA-Z0-9])(?=.*\\d)(?=.*[a-zA-Z]).{6,12}$";
				if (!c_pwd.trim().matches(s_pwd)) {
					errorMsgs.put("c_pwd01", "請輸入各一位英文及數字共8~12位！");
				}
			}
			
			// 姓名
			String c_name = req.getParameter("name");
			if (c_name == null || c_name.trim().length() == 0) {
				errorMsgs.put("c_name", "請輸入姓名！");
			} else {
				String s_name = "^[(\u4e00-\u9fa5)]{2,5}$";
				if (!c_name.trim().matches(s_name)) {
					errorMsgs.put("c_name01", "請輸入中文 ,長度必需在2到5之間！");
				}
			}
			// 日期
			java.sql.Date c_birth = null;
			try {
				c_birth = java.sql.Date.valueOf(req.getParameter("birth").trim());
			} catch (IllegalArgumentException e) {
				c_birth = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("bday", "請輸入日期！格式：(yyyy-mm-dd)");
			}
			// 電話
			String c_cel = req.getParameter("phone");
			if (c_cel == null || c_cel.trim().length() == 0) {
				errorMsgs.put("phone", "請輸入手機號碼！");
			} else {
				String s_cel = "^09[0-9]{8}$";
				if (!c_cel.trim().matches(s_cel)) {
					errorMsgs.put("phone01", "請輸入正確手機號碼！");
				}
			}
			// e-mail
			String c_email = req.getParameter("mail");
			if (c_email == null || c_email.trim().length() == 0) {
				errorMsgs.put("c_email", "請輸入e-mail！");
			} else {
				//^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$
				String s_email = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$";
				if (!c_email.trim().matches(s_email)) {
					errorMsgs.put("c_email01", "請輸入正確e-mail格式！");
				}
			}
			// 縣市
			String c_city = req.getParameter("city");
			if (c_city == null || c_city.trim().length() == 0) {
				errorMsgs.put("c_city", "請選擇縣市！");
			}
			// 地區
			String c_district = req.getParameter("district");
			if (c_district == null || c_district.trim().length() == 0) {
				errorMsgs.put("c_district", "請選擇地區！");
			}
			// 地址
			String c_addr = req.getParameter("addr");
			if (c_addr == null || c_addr.trim().length() == 0) {
				errorMsgs.put("c_addr", "請輸入地址！");
			}else{
				//^(?!.*[^\u4e00-\u9fa5a-zA-Z0-9-])(?=.*[\u4e00-\u9fa5]{2,})(?=.*\d).{8,40}$
				String s_addr = "^(?!.*[^\\u4e00-\\u9fa5a-zA-Z0-9-])(?=.*[\\u4e00-\\u9fa5]{2,})(?=.*\\d).{8,40}$";
				if (!c_addr.trim().matches(s_addr)) {
					errorMsgs.put("c_addr01", "請輸入正確地址格式！");
				}
			}
			
			// 加入時間
			Timestamp c_jdate = null; 
			try {
				c_jdate = Timestamp.valueOf(req.getParameter("other").trim());
			} catch (IllegalArgumentException e) {
				c_jdate = new Timestamp(System.currentTimeMillis());
			}
			Integer c_rating = 0;// 消費者評分
			Integer c_finished = 0;// 已完成消費數
			
			//benny
			System.out.println("V1"+req.getParameter("verification1"));
			System.out.println("V2"+req.getParameter("verification2"));	
			if((req.getParameter("verification1"))==null||(!(req.getParameter("verification1")).equals(req.getParameter("verification2")))){
				errorMsgs.put("errorverify", "請輸入驗證碼！");
			}
			// CdataVO cdataVO = new CdataVO();
			// cdataVO.setC_id(c_id);
			// cdataVO.setC_pwd(c_pwd);
			// cdataVO.setC_name(c_name);
			// cdataVO.setC_cel(c_cel);
			// cdataVO.setC_email(c_email);
			// cdataVO.setC_city(c_city);
			// cdataVO.setC_district(c_district);
			// cdataVO.setC_addr(c_addr);
			// cdataVO.setC_birth(c_birth);
			// req.setAttribute("cdataVO", cdataVO);

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher rd = req.getRequestDispatcher("/cdata/login-up.jsp");
				rd.forward(req, resp);
				return;
			}

			CdataService cs = new CdataService();
			CdataVO cdataVO = cs.addCdata(c_id, c_pwd, c_name, c_cel, c_email, c_city, c_district, 
					c_addr, c_birth, c_rating, c_finished, c_jdate);
					

			session.setAttribute("cdataVO", cdataVO);
			resp.sendRedirect(resp.encodeRedirectURL("InsertCdataSuccess.jsp"));
			return;
		} catch (Exception e) {
			errorMsgs.put("account", "帳號重複，請重新輸入資料");
			RequestDispatcher failureView = req.getRequestDispatcher("/cdata/login-up.jsp");
			failureView.forward(req, resp);
		}
			
	
		
		
		
		
		
		
		
		
		
	}//doPost

}
