<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");
/*
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
*/
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = new BoardDTO();
dto.setUserId(userId);
dto.setUserPwd(userPwd);

boolean isLoggedin = dao.checkIdPwd(dto);
if(isLoggedin){
	session.setAttribute("userId", userId);
	
	
	response.sendRedirect("../main/main.jsp");
} else{
	out.println("<script>alert('아이디 또는 비밀번호가 올바르지 않습니다.'); history.back();</script>");
}

dao.close();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>