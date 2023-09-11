<%@page import="utils.JSFunction"%>
<%@page import="org.apache.tomcat.util.scan.JarFileUrlNestedJar"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="model1.board.BoardDAO" %>
<%@page import="model1.board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기
String name = request.getParameter("name");
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");
String tel = request.getParameter("tel1")
+ "-" +request.getParameter("tel2")
+ "-" +request.getParameter("tel3");
String mobile = request.getParameter("mobile1")
			+ "-" +request.getParameter("mobile2")
			+ "-" +request.getParameter("mobile3");
String email = request.getParameter("email_1")+"@"+request.getParameter("email_2");
String zip1 = request.getParameter("zip1");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");

//DTO객체에 저장하기
MemberDTO dto = new MemberDTO();
dto.setName(name);
dto.setUserId(userId);
dto.setUserPwd(userPwd);
dto.setTel(tel);
dto.setMobile(mobile);
dto.setEmail(email);
dto.setZip1(zip1);
dto.setAddr1(addr1);
dto.setAddr2(addr2);


//DAO 객체 생성 및 insert처리
MemberDAO dao = new MemberDAO(application);
int result = dao.addMember(dto);
if(result == 1){
	JSFunction.alertLocation("가입성공", "../main/main.jsp", out);
}
else{
	JSFunction.alertBack("가입실패", out);
}
%>
