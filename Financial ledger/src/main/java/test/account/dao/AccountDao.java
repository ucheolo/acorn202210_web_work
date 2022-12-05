package test.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.account.dto.AccountDto;
import test.util.DbcpBean;

public class AccountDao {
	private static AccountDao dao;
	
	private AccountDao() {}
	
	public static AccountDao getInstance() {
		if(dao==null) {
			dao=new AccountDao();
		}
		return dao;
	}
	
	public boolean incomeinsert(AccountDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO account"
					+ " (contents, income, regdate)"
					+ " VALUES(?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할게 있으면 해주고
			pstmt.setString(1, dto.getContents());
			pstmt.setString(2, dto.getIncome());
			// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
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
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean expenditureinsert(AccountDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO account"
					+ " (contents, expenditure, regdate)"
					+ " VALUES(?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할게 있으면 해주고
			pstmt.setString(1, dto.getContents());
			pstmt.setString(2, dto.getExpenditure());
			// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
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
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
public List<AccountDto> getList(AccountDto dto){
		
		List<AccountDto> list=new ArrayList<AccountDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "SELECT contents, income, expenditure, regdate"
					+ " FROM account";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기
			
			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				//select 된 row 하나의 정보를 CafeDto 객체를 생성해서 담고 
				AccountDto tmp=new AccountDto();
				tmp.setIncome(rs.getString("income"));
				tmp.setExpenditure(rs.getString("expenditure"));
				tmp.setContents(rs.getString("contents"));
				tmp.setRegdate(rs.getString("regdate"));
				//CafeDto 객체의 참조값을 List 에 누적 시키기
				list.add(tmp);
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
		return list;
	}

}
