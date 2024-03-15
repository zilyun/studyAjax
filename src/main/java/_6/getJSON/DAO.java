package _6.getJSON;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class DAO {

	private DataSource ds;

	// 생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public DAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception se) {
			System.out.println("DB 연결 실패 : " + se);
		}
	}

	public JsonArray getList_lib() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JsonArray array = new JsonArray();

		try {
			conn = ds.getConnection();

			String select_sql = "select * from dept";

			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql);
			rs = pstmt.executeQuery();

			while (rs.next()) { // 더 이상 읽을 데이터가 없을 때까지 반복
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				JsonObject json = new JsonObject();
				json.addProperty("deptno", deptno);
				json.addProperty("dname", dname);
				json.addProperty("loc", loc);
				array.add(json);
			}

		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}

			if (conn != null)
				try {
					conn.close(); // DB 연결을 끊는다.
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
		} // finally

		return array;
		// return null;

	} // getList_lib() end

	public ArrayList<Dept> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Dept> list = new ArrayList<Dept>();

		try {
			conn = ds.getConnection();

			String select_sql = "select * from dept";

			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql);
			rs = pstmt.executeQuery();

			while (rs.next()) { // 더 이상 읽을 데이터가 없을 때까지 반복
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				Dept dept = new Dept();
				dept.setDeptno(deptno);
				dept.setDname(dname);
				dept.setLoc(loc);
				list.add(dept);
			}

		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}

			if (conn != null)
				try {
					conn.close(); // DB 연결을 끊는다.
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
		} // finally

		return list;
		// return null;

	} // selectAll() end

} // class end
