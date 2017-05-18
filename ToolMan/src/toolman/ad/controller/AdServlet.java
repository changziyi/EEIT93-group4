package toolman.ad.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import toolman.ad.model.AdService;
import toolman.ad.model.AdVO;
import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.wishpool.model.WishpoolService;
import toolman.wishpool.model.WishpoolVO;

@WebServlet("/ad/AdServlet")
public class AdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdService adservice = new AdService();
	
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
		
		
		HttpSession session = req.getSession();
		CdataVO cdataVO = (CdataVO)session.getAttribute("LoginOK");
//		System.out.println("cdataVO = " + cdataVO.getC_id());
//		String SendAccount = cdataVO.getC_id();
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		
		
		Map<String, String> errorMsgs = new HashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);
		AdVO AdVO = new AdVO();
		// 宣告錯誤訊息的變數
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calobj = Calendar.getInstance();
		Timestamp ad_bdate = new Timestamp(calobj.getTimeInMillis());
		Timestamp ad_enddate = new Timestamp(calobj.getTimeInMillis());
		// 當下時間
		
		
		AdVO addform = new AdVO();
		AdService adsrv = new AdService();
		addform.setM_id(cdataVO.getM_id());
		addform.setAd_bdate(ad_bdate);
		addform.setAd_enddate(ad_enddate);
		 adsrv.insert(addform);
        // 表單傳送到資料庫
		
		
		res.sendRedirect("ad.jsp");
		
		List<AdVO> list = new ArrayList<AdVO>();
		AdVO ad1 = new AdVO();
		ad1.setM_id(cdataVO.getM_id());
		ad1.setAd_bdate(ad_bdate);
		ad1.setAd_enddate(ad_enddate);
	
		list.add(ad1);
		adsrv.getAll();
		//呈現許願資料
		


		for (int i = 0 ; i < list.size() ; i++) {
			AdVO vo = list.get(i);
		}
		
			
	
		
		//測試用
		System.out.println("確認表單上傳成功");
		System.out.println("使用者帳號： "+ cdataVO.getM_id());
		System.out.println("起始時間 : " + ad_bdate);
		System.out.println("結束時間： " + ad_enddate);
	
		
		
		
	}

}
