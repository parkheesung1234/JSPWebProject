<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = new BoardDTO();

boolean isLoggedin = dao.checkIdPwd(BoardDTO);
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