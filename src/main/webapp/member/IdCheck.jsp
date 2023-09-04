<%@page import="model1.board.BoardDAO" %>
<%@page import="model1.board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = request.getParameter("userId");

BoardDAO dao = new BoardDAO(application);
boolean isExist = dao.userIdOverlap(userId);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> 
    function userIdUse(){
        opener.document.myform.userId.value = document.overlapFrm.retype_userId.value;
        self.close();
    }
</script>
</head>
<body>
    <h2>아이디 중복확인</h2>
    <div>
        입력한 아이디 : <%= userId %>
<%
if(isExist==true) {
%>
        <p>
           입력한 아이디는 사용할 수 있습니다. <br />
           <input type="button" value="아이디 사용하기" 
              onclick = "userIdUse();"/>
             <form action="" name="overlapFrm" >
                <input type="hidden" name="retype_userId" value="<%= userId%>"/>
             </form>
        </p>
<% 
} else {
%>
        <p>
            아이디가 중복되어 사용할 수 없습니다. <br>
            다시 검색해 주세요.
        </p>
        <form name="overlapFrm">
            <input type="text" name="id" size="20" />
            <input type="submit" value="아이디 중복확인" />
        </form>
<%
}
%>
    </div>
</body>
</html>