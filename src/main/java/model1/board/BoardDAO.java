package model1.board;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBConnect {
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	public boolean userIdOverlap(String userId) {
		boolean retValue = true;
		String sql = "SELECT COUNT(*) FROM member WHERE id=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();
			rs.next();
			int result = rs.getInt(1);
			if(result==1)
				retValue = false;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return retValue;
	}
	
	public int memberInsert(BoardDTO dto) {
		int result = 0;
		String query ="INSERT INTO member VALUES ("
				+ " ?, ?, ?, ?, ?, ?, ?, ?, ? "
				+ " )";
	try {
		psmt = con.prepareStatement(query);
		psmt.setString(1, dto.getName());
		psmt.setString(2, dto.getUserId());
		psmt.setString(3, dto.getUserPwd());
		psmt.setString(4, dto.getTel());
		psmt.setString(5, dto.getMobile());
		psmt.setString(6, dto.getEmail());
		psmt.setString(7, dto.getZip1());
		psmt.setString(8, dto.getAddr1());
		psmt.setString(9, dto.getAddr2());
		
		result = psmt.executeUpdate();
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return result;

}
}
