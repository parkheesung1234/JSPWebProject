<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function formValidate(form){
    var name = form.name.value;
    var userId = form.userId.value;
    var userPwd = form.userPwd.value;
    var userPwd2 = form.userPwd2.value;
    var tel1 = form.tel1.value;
    var tel2 = form.tel2.value; 
    var tel3 = form.tel3.value; 
    var mobile1 = form.mobile1.value; 
    var mobile2 = form.mobile2.value;  
    var mobile3 = form.mobile3.value; 
	var email_1 = form.email_1.value;
	var email_2 = form.email_2.value;
	var zip1 = form.zip1.value;
	var addr1 = form.addr1.value;
	var addr2 = form.addr2.value;
	
	if(name == ""){
		alert("이름을 입력해주세요.");
		return false;
	}
	if(userId == ""){
		alert("아이디를 입력해주세요.")
		return false;
	}
	if(userPwd1 == ""||userPwd2 == ""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else {
		var regex = /^[A-Za-z0-9]{4,12}$/;
		if (!regex.test(userPwd)||!regex.test(userPwd2)) {
	        alert("비밀번호 : 4~12자 사이 영문/숫자를 조합하여 공백없이 기입하여주세요.");
	        return false;
	    }else if(userPwd != userPwd2){
	    	alert('패스워드가 일치하지 않습니다. 다시 입력해주세요.');
	    	document.getElementById("userPwd").value = "";
	    	document.getElementById("userPwd").focus();
			return false;
	    }
	}
	if(tel1 == ""||tel2 == ""||tel3 == ""){
		 alert("전화번호를 확인해주세요.");
		 return false;
	}
	if(mobile1 == ""||mobile2 == ""||mobile3 == ""){
		 alert("핸드폰번호를 확인해주세요.");
		 return false;
	}
	if(email_1 == ""||email_2 == ""){
		alert("이메일을 확인해주세요.");
		return false;
	}
	if(zip1==""||addr1==""||addr2==""){
		alert("주소를 확인해주세요.")
		return false;
	}
}	
function IdCheck(){
	var userId = document.getElementById("userId").value;
	var regex =  /^[A-Za-z0-9]{4,12}$/;
	
	 if (!regex.test(userId)) {
            alert("4~12자 사이 영문/숫자를 조합하여 공백없이 기입하여주세요.");
            return false;
        } else {
            alert("지금 ID는 '" + userId + "' 사용하실 수 있습니다. ");
            return true;
        }
}
function email_input(selectObj) {
	var emailField = document.getElementById("email_2");
	
	if (selectObj.value === "1") { 
        emailField.readOnly = true;
        emailField.value = ""; 
        emailField.focus(); 
    } else {
        emailField.readOnly = true;
        emailField.value = selectObj.value; 
    }
}
function zipFind(){
    new daum.Postcode({
        oncomplete: function(data) {
            console.log(data);
            console.log(data.zonecode);
            console.log(data.address);

            let frm = document.myform;
            frm.zip1.value = data.zonecode;
            frm.addr1.value = data.address;
            frm.addr2.focus();
        }
    }).open();
}
</script>
 <body>
 <form name="myform" action="loginAction.jsp" method="post" onsubmit="return formValidate(this);">
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입<p>
				</div>

				<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="join_box">
					<colgroup>
						<col width="80px;" />
						<col width="*" />
					</colgroup>
					<tr>
						<th><img src="../images/join_tit001.gif" /></th>
						<td><input type="text" name="name" value="" class="join_input" />
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit002.gif" /></th>
						<td><input type="text" name="userId" id="userId" value="" class="join_input" />&nbsp;
						<a onclick="IdCheck()" style="cursor:hand;" action="loginAction.jsp">
						<img src="../images/btn_idcheck.gif" alt="중복확인"/>
						</a>&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit003.gif" /></th>
						<td><input type="password" name=userPwd id="userPwd" value="" class="join_input" />&nbsp;&nbsp;
						
						<span>* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit04.gif" /></th>
						<td><input type="password" name="userPwd2" id="userPwd2" value="" class="join_input" /></td>
					</tr>
					

					<tr>
						<th><img src="../images/join_tit06.gif" /></th>
						<td>
							<input type="text" name="tel1" id="tel1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel2" id="tel2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel3" id="tel3" value="" maxlength="4" class="join_input" style="width:50px;" />
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit07.gif" /></th>
						<td>
							<input type="text" name="mobile1" id="mobile1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile2" id="mobile2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile3" id="mobile3" value="" maxlength="4" class="join_input" style="width:50px;" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit08.gif" /></th>
						<td>
 
	<input type="text" name="email_1" id="email_1"  style="width:100px;height:20px;border:solid 1px #dadada;" value="" /> @ 
	<input type="text" name="email_2" id="email_2" style="width:150px;height:20px;border:solid 1px #dadada;" value="" readonly />
	<select name="last_email_check2" onChange="email_input(this);" class="pass" id="last_email_check2" >
		<option selected="" value="">선택해주세요</option>
		<option value="1" >직접입력</option>
		<option value="dreamwiz.com" >dreamwiz.com</option>
		<option value="empal.com" >empal.com</option>
		<option value="empas.com" >empas.com</option>
		<option value="freechal.com" >freechal.com</option>
		<option value="hanafos.com" >hanafos.com</option>
		<option value="hanmail.net" >hanmail.net</option>
		<option value="hotmail.com" >hotmail.com</option>
		<option value="intizen.com" >intizen.com</option>
		<option value="korea.com" >korea.com</option>
		<option value="kornet.net" >kornet.net</option>
		<option value="msn.co.kr" >msn.co.kr</option>
		<option value="nate.com" >nate.com</option>
		<option value="naver.com" >naver.com</option>
		<option value="netian.com" >netian.com</option>
		<option value="orgio.co.kr" >orgio.co.kr</option>
		<option value="paran.com" >paran.com</option>
		<option value="sayclub.com" >sayclub.com</option>
		<option value="yahoo.co.kr" >yahoo.co.kr</option>
		<option value="yahoo.com" >yahoo.com</option>
	</select>
	 
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" name="zip1" id="zip1" value=""  class="join_input" style="width:50px;" />
						<a href="javascript:;" title="새 창으로 열림" onclick="zipFind('zipFind', '<?=$_Common[bbs_path]?>member_zipcode_find.php', 590, 500, 0);" onkeypress="">[우편번호검색]</a>
						<br/>
						
						<input type="text" name="addr1" id="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
						<input type="text" name="addr2" id="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
						
						</td>
					</tr>
				</table>

				<p style="text-align:center; margin-bottom:20px">
				<input id="submit" type="image" src="../images/btn01.gif" >&nbsp;&nbsp;
				<input id="reset" type="image" src="../images/btn02.gif" />
				</p>
		
			</div>
		</div>
		</form>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
