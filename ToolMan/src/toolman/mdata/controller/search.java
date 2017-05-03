package toolman.mdata.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

import java.sql.*;

@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public search() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();


		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=toolman";
		String query = "select b_name from mdata where b_name like ? ";
		String keyword = request.getParameter("keyword");
		keyword ="%"+keyword + "%";
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
		
			conn = DriverManager.getConnection(url, "sa", "sa123456");

			stmt = conn.prepareStatement(query);
			stmt.setString(1, keyword);


			rs = stmt.executeQuery();
			JSONArray list = new JSONArray();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
			out.print(list);
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			out.println("Error:" + e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
