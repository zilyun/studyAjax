package template;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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

	public int isId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; // 아이디가 존재하지 않는 경우

		try {
			
			conn = ds.getConnection();

			String select_sql = "select id, password from template_join where id = ?";

			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
					result = -1; // 아이디가 존재하는 경우
			} // if (rs.next())

		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			rsClose(rs);
			pstmtClose(pstmt);
			connClose(conn);
		}

		return result;
	} // isId end

	public void rsClose(ResultSet rs) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
	}

	public void pstmtClose(PreparedStatement pstmt) {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
	}

	public void connClose(Connection conn) {
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
	}

} // class end
