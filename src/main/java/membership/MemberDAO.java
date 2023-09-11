package membership;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

/*
DAO(Data Access object) 실제 데이터베이스에 접근하여 기본적인 CRUD 작업을 하기 위한 객체이다.
DB접속 및 Select와 같은 쿼리문을 실행한 후 결과를 반환받는 역할을 한다.
*/
//JDBC를 위한 클래스를 상속하여 DB에 연결한다.
public class MemberDAO extends JDBConnect {
	
	//생성자 메서드 정의
	//매개변수가 4개인 부모의 생성자를 호출하여 DB연결
	public MemberDAO(String name, String userId, String userPwd, String tel, String mobile, String email, String mailing, String zip1, String addr1, String addr2) {
		super();
	}
	//application내장객체를 인수로 전달한 후 DB연결
	public MemberDAO(ServletContext application) {
		super(application);
	}
	/*
	사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 select한 후 존재하는
	회원정보인 경우 DTO객체에 레코드를 담아 반환한다.
	*/
	public  MemberDTO getMemberDTO(String userId, String userPwd) {
		//회원인증을 위한 쿼리문을 실행한 후 회원정보를 저장하기 위해 생성
		MemberDTO dto = new MemberDTO();
		/*
		로그인 폼에서 입력한 아이디, 비번을 통해 인파라미터를 설정할 수 있도록 쿼리문을 작성
		*/
		String query = "SELECT * FROM member WHERE userId=? AND userPwd=?";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			//인파라미터를 설정
			psmt.setString(2, userId);
			psmt.setString(3, userPwd);
			//쿼리문을 실행한 후 ResultSet객체를 통해 결과 반환
			rs = psmt.executeQuery();
			
			//반환된 ResultSet객체에 정보가 있는지 확인한다.
			if(rs.next()) {
				//회원정보가 있다면 DTO객체에 저장한다.
				dto.setName(rs.getString(1));
				dto.setUserId(rs.getString(2));
				dto.setUserPwd(rs.getString(3));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public int addMember(MemberDTO dto) {
		int result = 0;
		
		try {
			
			String query = "INSERT INTO member VALUES ( "
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getUserId());
			psmt.setString(3, dto.getUserPwd());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getMobile());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getMailing());
			psmt.setString(8, dto.getZip1());
			psmt.setString(9, dto.getAddr1());
			psmt.setString(10, dto.getAddr2());
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public boolean IdCheck(String userId) {
		
		boolean retValue = true;
		
		String sql = "SELECT COUNT(*) FROM member WHERE userId=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(2, userId);
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
}
