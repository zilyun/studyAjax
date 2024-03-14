package _6.getJSON;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/get_array_lib_dept")
public class Get_name_array_lib_dept extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");

		JsonArray array = new JsonArray();

		DAO dao = new DAO();
		ArrayList<Dept> list = dao.selectAll();
		
		for (Dept dept : list) {
			JsonObject json = new JsonObject();
			json.addProperty("deptno", dept.getDeptno());
			json.addProperty("dname", dept.getDname());
			json.addProperty("loc", dept.getLoc());
			array.add(json);
		}
		
		System.out.println(array);
		response.getWriter().print(array);
	}
	
}
