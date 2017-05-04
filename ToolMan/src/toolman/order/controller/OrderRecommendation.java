package toolman.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolman.cdata.model.CdataVO;
import toolman.order.model.OrderVO;

/**
 * Servlet implementation class OrderRecommendation
 */
@WebServlet("/toolman.order/OrderRecommendation.do")
public class OrderRecommendation extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderRecommendation() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderVO orderVO = new OrderVO();
		orderVO.setO_location("台北市內湖區內湖路三段60巷12弄10號");
		String o_location = orderVO.getO_location();
		String city = o_location.substring(0, 3);
		String district = o_location.substring(3, 6);
		String addr = o_location.substring(6);
		System.out.println("city="+city+"district="+district+"addr="+addr);
		
		
	}

}
