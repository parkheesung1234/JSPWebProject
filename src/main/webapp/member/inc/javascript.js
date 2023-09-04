window.onload = function formValidate(frm){
	document.getElementById('submit').addEventListener('click',function(e){
		var name = document.getElementByName('name')[0].value; 
		var id = document.getElementsByName('id')[0].value;
        var password = document.getElementsByName('pass')[0].value;
        var tel = document.getElementsByName('tel1','tel2','tel3')[0].value;
        var mobile = document.getElementsByName('mobile1','mobile2','mobile3')[0].value;
        var email = document.getElementsByName('email')[0].value;
        var zipcode = document.getElementsByName('zip1')[0].value;
        var addr1 = document.getElementsByName('addr2')[0].value;
        var addr2 = document.getElementsByName('addr1')[0].value;
		
			if (frm.name == '') {
                e.preventDefault();
                alert("이름을 입력해주세요.");
                return false; 
            } else if (frm.id == '') {
                e.preventDefault();
                alert("아이디를 입력해주세요.");
                return false; 
                console.log(frm.id.value);
            } else if (frm.pass == '') {
                e.preventDefault();
                alert("패스워드를 입력해주세요.");
                return false; 
            } else if (frm.tel == '') {
                e.preventDefault();
                alert("전화번호를 입력해주세요.");
                return false; 
             } else if (frm.mobile == '') {
                 e.preventDefault();
                 alert("휴대폰 번호를 입력해주세요.");
                 return false; 
             } else if (frm.email == '') {
                 e.preventDefault();
                 alert("이메일을 입력해주세요.");
                 return false; 
             } else if (frm.zip1 == '') {
                 e.preventDefault();
                 alert("우편번호를 입력해주세요.");
                 return false;  
             } else if (frm.addr1 == '') {
                 e.preventDefault();
                 alert("주소를 입력해주세요.");
                 return false;  
             } else if (frm.addr2 == '') {
                 e.preventDefault();
                 alert("상세주소를 입력해주세요.");
                 return false;  
		}
	});
};
	function id_check_person(){
		var id = document.getElementById("id").value;
		var regex =  /^[A-Za-z0-9]{4,12}$/;
		
		 if (!regex.test(id)) {
                alert("4~12자 사이 영문/숫자를 조합하여 공백없이 기입하여주세요.");
                return false;
            } else {
                alert("지금 ID는 '" + id + "' 사용하실 수 있습니다. ");
                return true;
            }
	}