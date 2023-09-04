<%@page import="model1.board.BoardDAO" %>
<%@page import="model1.board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기
String name = request.getParameter("name");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String tel = request.getParameter("tel");
String mobile = request.getParameter("mobile1")
			+ "-" +request.getParameter("mobile2")
			+ "-" +request.getParameter("mobile3");
String email = request.getParameter("email1")+"@"+request.getParameter("email2");
String mailing = request.getParameter("mailing");
String zip1 = request.getParameter("zip1");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");

//DTO객체에 저장하기
BoardDTO dto = new BoardDTO();
dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setTel(tel);
dto.setMobile(mobile);
dto.setEmail(email);
dto.setZip1(zip1);
dto.setAddr1(addr1);
dto.setAddr2(addr2);


//DAO 객체 생성 및 insert처리
BoardDAO dao = new BoardDAO(application);
int result = dao.memberInsert(dto);
if(result == 1){
	out.println("입력성공");
}
else{
	out.println("입력실패");
}
%>
