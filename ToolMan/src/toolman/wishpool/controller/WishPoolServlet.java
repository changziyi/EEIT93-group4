package toolman.wishpool.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import toolman.wishpool.model.WishpoolDAO;
import toolman.wishpool.model.WishpoolService;
import toolman.wishpool.model.WishpoolVO;




@WebServlet("/wishpool/WishPool.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class WishPoolServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		//設定文字編碼形式
		
		Map<String, String> errorMsgs = new HashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);
		//宣告錯誤訊息的變數
		
		String w_pro = req.getParameter("w_pro");
		if (w_pro == null || w_pro.trim().length() == 0) {
			errorMsgs.put("pro1", "請輸入維修項目");
		}
		//如果維修項目沒輸入東西會跳出pro1
		
		String w_proReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,15}$";
		if (!w_pro.trim().matches(w_proReg)) {
			errorMsgs.put("pro2", "維修項目:只能是中英文或數字, 長度必需介於2到15字內");
		}
		//如果打英文，會跳出pro2，只能輸入中英文和數字並且只能介於2~15字之間
		
		String w_city = req.getParameter("w_city");
		String w_district = req.getParameter("w_district");
		//維修地點
		
		String w_content = req.getParameter("w_content");
		if (w_content == null || w_content.trim().length() == 0) {
			errorMsgs.put("content1", "請簡單描述內容");
		}
		
		
		Part part = req.getPart("w_image");
		InputStream	in = part.getInputStream();
		
		byte[] buf = new byte[in.available()];
		Integer length=0;
		ByteArrayOutputStream bs = new ByteArrayOutputStream();
		while((length = in.read(buf))!=-1){
		 bs.write(buf, 0 , length);
		}
		byte[] w_image  = bs.toByteArray();
		
		//取得圖片
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calobj = Calendar.getInstance();
		Timestamp w_date = new Timestamp(calobj.getTimeInMillis());		
		//許願當下時間

		WishpoolVO wishpoolVO = new WishpoolVO();
		wishpoolVO.setW_pro(w_pro);
		wishpoolVO.setW_city(w_city);
		wishpoolVO.setW_district(w_district);
		wishpoolVO.setW_image(w_image);
		wishpoolVO.setW_city(w_content);
		wishpoolVO.setW_date(w_date);
		
		WishpoolDAO dao = new WishpoolDAO();
		dao.insert(wishpoolVO);
		
		
		
		
		
		
		
		//測試用
		System.out.println("我想修 : " + w_pro );
		System.out.println("位於： " + w_city + w_district);
		System.out.println("示意圖： " + w_image);
		System.out.println("問題描述:" + w_content);
		System.out.println("發送時間:" + w_date);
	
			
		

	   
	}

}
