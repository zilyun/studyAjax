package _6.getJSON;

import java.io.IOException;

import com.google.gson.JsonArray;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dept_lib")
public class Get_name_array_lib_dept extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		JsonArray array = new JsonArray();

		DAO dao = new DAO();
		array = dao.getList_lib();
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(array);
		System.out.println(array);
	}
	
}
