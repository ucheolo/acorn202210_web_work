package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	
	private static UsersDao dao;
	//외부에서 객체 생성할수 없도록
	private UsersDao() {}
	//참조값을 리턴해주는 static 메소드
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	//회원 한명의 정보를 DB에 저장하고 성공여부를 리턴하는 메소드
	public boolean insert(UsersDto dto) {//UsersDto에 id, pwd, email이 있다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		//수정된 row 의 갯수를 담을 지역변수를 미리 만들고 초기값 0 대입하기
		int rowCount = 0;
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			// 실행할 미완성의 sql 문
			String sql = "INSERT INTO users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, SYSDATE)";
			// PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩할게 있으면 해주고
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			//sql 문 실행하고 변화된(추가, 수정, 삭제) row 의 갯수를 리턴받기
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//변화된 rowCount 값을 확인해서 작업의 성공 여부를 리턴해 준다.
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//인자로 전달되는 dto 에 있는 아이디와 비밀번호를 이용해서 해당 정보가 유효한 정보인지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {
		
		//아이디 비밀번호 유효성 여부를 담을 변수 만들고 초기값 false
		boolean isValid = false;
		
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool 에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT id"
					+ " FROM users"
					+ " WHERE id=? AND pwd=?";

			pstmt = conn.prepareStatement(sql);
			//sql 문의 ?에 바인딩 할게 있으면 한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//SELECT 문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//SELECT 된 ROW 가 있는지 확인해 본다.
			if (rs.next()) {
				//SELECT 된 row 가 있다면 유효한 정보가 맞다.
				isValid = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return isValid;
	}
	
}
















