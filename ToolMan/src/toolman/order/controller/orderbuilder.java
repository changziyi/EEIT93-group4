package toolman.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toolman.mpro.model.MProVO;

/**
 * Servlet implementation class orderbuilder
 */
@WebServlet("/orderbuilder")
public class orderbuilder extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public orderbuilder() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		List<MProVO> mproVO = (List<MProVO>) session.getAttribute("mpro");
		
		
		
		
		
		
		
		
	}

}
