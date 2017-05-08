package toolman.wishpool.controller;

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
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import toolman.wishpool.model.WishpoolDAO;
import toolman.wishpool.model.WishpoolService;
import toolman.wishpool.model.WishpoolVO;

@WebServlet("/wishpool/wishpool.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class WishpoolServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	WishpoolService wishpoolservice = new WishpoolService();

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String type = req.getParameter("type");

		if ("wishpool".equals(type)) {
			String image = req.getParameter("image");
			Integer img = new Integer(image);
			res.setContentType("image/jpeg");

			ServletOutputStream out = res.getOutputStream();
			WishpoolService wishpoolSvc = new WishpoolService();
			WishpoolVO wishpoolVO = wishpoolSvc.findByPrimaryKey(img);
			byte[] w_image = wishpoolVO.getW_image();
			
			if (w_image == null || w_image.length == 0) {
				InputStream in = getServletContext().getResourceAsStream("/images/no_image.PNG");
				w_image = new byte[in.available()];
				in.read(w_image);
				out.write(w_image);
				in.close();
				return;
			}
			
			out.write(w_image);
			out.close();
			}
		
		
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		// String action = req.getParameter("action");
		// 設定文字編碼形式

		
		//if ("Wishing".equals(action)) {
		
		Map<String, String> errorMsgs = new HashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);
		WishpoolVO wishpoolVO = new WishpoolVO();
		// 宣告錯誤訊息的變數

		
		String w_pro = req.getParameter("w_pro");
		if (w_pro == null || w_pro.trim().length() == 0) {
			errorMsgs.put("pro1", "請輸入維修項目");
		}
		// 如果維修項目沒輸入東西會跳出pro1

		
		String w_proReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,15}$";
		if (!w_pro.trim().matches(w_proReg)) {
			errorMsgs.put("pro2", "維修項目:只能是中英文或數字, 長度必需介於2到15字內");
		}
		// 如果打英文，會跳出pro2，只能輸入中英文和數字並且只能介於2~15字之間

		
		String w_city = req.getParameter("w_city");
		
		String w_district = req.getParameter("w_district");
		// 維修地點

		
		String w_content = req.getParameter("w_content");
		if (w_content == null || w_content.trim().length() == 0) {
			errorMsgs.put("content1", "請簡單描述內容");
		}
		// 描述維修的內容

		
		Part part = req.getPart("w_image");
		InputStream in = part.getInputStream();
		byte[] buf = new byte[in.available()];
		Integer length = 0;
		ByteArrayOutputStream bs = new ByteArrayOutputStream();
		while ((length = in.read(buf)) != -1) {
			bs.write(buf, 0, length);
		}
		byte[] w_image = bs.toByteArray();
		// 取得上傳圖片

		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calobj = Calendar.getInstance();
		Timestamp w_date = new Timestamp(calobj.getTimeInMillis());
		// 許願當下時間

		res.sendRedirect("Wishing+waterfall.jsp");
		
		/*if (!errorMsgs.isEmpty()) {
			req.setAttribute("wishpoolVO", wishpoolVO);
			RequestDispatcher failureView = req.getRequestDispatcher("/wishpool/Wishpool.jsp");
			failureView.forward(req, res);
			return;
		}

		req.setAttribute("wishpoolVO", wishpoolservice.findByPrimaryKey(wishpoolVO.getW_id()));
		RequestDispatcher successView = req.getRequestDispatcher("/wishpool/wishsucess.jsp");
		successView.forward(req, res);
		return;
		*/
		WishpoolVO addform = new WishpoolVO();
		addform.setW_pro(w_pro);
		addform.setW_city(w_city);
		addform.setW_district(w_district);
		addform.setW_image(w_image);
		addform.setW_content(w_content);
		addform.setW_date(w_date);
		wishpoolservice.insert(addform);
        // 表單傳送到資料庫
		
		
		List<WishpoolVO> list = new ArrayList<WishpoolVO>();
		WishpoolVO wp1 = new WishpoolVO();
		wp1.setW_pro(w_pro);
		wp1.setW_city(w_city);
		wp1.setW_district(w_district);
		wp1.setW_image(w_image);
		wp1.setW_city(w_content);
		wp1.setW_date(w_date);
		list.add(wp1);
		wishpoolservice.getAll();
		//呈現許願資料
		

//		for (WishpoolVO vo : list) {
//			
//		}
		for (int i = 0 ; i < list.size() ; i++) {
			WishpoolVO vo = list.get(i);
		}
		
		
		
		//測試用
		System.out.println("確認表單上傳成功");
		System.out.println("我想修 : " + w_pro);
		System.out.println("位於： " + w_city + w_district);
		System.out.println("示意圖： " + w_image);
		System.out.println("問題描述:" + w_content);
		System.out.println("發送時間:" + w_date);
		
		}
	}


