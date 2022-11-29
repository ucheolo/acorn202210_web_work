package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;
	
	/*
	 * 	static 메소드는 생성자를 호출하지 않고 클래스명으로 바로 호출을 하기 때문에
	 * 	메소드 호출전에 무언가 준비 작업을 하고 싶다면 static 블럭 안에서 하면 된다.
	 * 	static 블럭은 해당클래스를 최초로 사용할때 한번만 실행되기 때문에
	 * 	초기화 작업을 하기에 적당한 블럭이다.
	 */
	static {
		if(dao==null) {
			dao = new CafeDao ();
		}
	}
	
	private CafeDao() {}
	
	public static CafeDao getInstance() {
		return dao;
	}
	
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		//수정된 row 의 갯수를 담을 지역변수를 미리 만들고 초기값 0 대입하기
		int rowCount = 0;
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			// 실행할 미완성의 sql 문
			String sql = "INSERT INTO board_cafe"
					+ " (num, writer, title, content, viewCount, regdate)"
					+ " VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			// PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩할게 있으면 해주고
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getViewCount());
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
}
