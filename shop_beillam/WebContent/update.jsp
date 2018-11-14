<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');
	*{
		font-family: 'Poor Story', cursive;
	}
	body, ul{
		margin: 0px;
		padding: 0px;
	}
	body{
		background-color: #fde5d9;
	
	}
	
	a{
		text-decoration: none;
	}
	ul{
		list-style: none;
	}
	#member_header{
		height: 169px;
		padding-top: 62px;
		position: relative;
	}
	#beillam_logo{
		margin: 0px;
		padding: 25px 0 0 0;
	}
	
	.n_logo{
		display: block;
		padding-top: 10px;
		margin: 0px 0px 0px 10px;
	}
	.b_logo{
		display: block;
		width: 350px;
		height: 60px;
		margin: 0 auto;
		text-align: center;
		font-size: 40px;
		color: #387173;
	}
	
	.lelele{
		margin: 10px 750px;
	}
	
	.input_member{
		background-color: white;
		width: 430px;
		height: 60px;
		margin: 10px auto;

	}
	
	.error{
		margin: 5px;
		color: red;
		display: none;
		font-size: 12px;
	}	
	.input_member2{
		background-color: white;
		width: 430px;
		height: 100px;
		margin: 10px auto;
		padding-top: 10px;
	}
	
	#sample6_address{
		border-bottom: 2px solid #387173;
	}
	
	#sample6_address2{
		border-bottom: 2px solid #387173;
	}
	
	.input_login{
		width: 418px;
		height: 13px;
		border: 1px solid white;
		border-bottom: 2px solid #387173;
		padding: 7px 0px 7px 10px;
		font-size: 13px;
	}
	

	
	#frm_mem{
		margin-top: 50px;
		background-color: white;
		width: 500px;

	}
	label{
		display:block;
		font-size: 15px;
		padding-left: 7px;
		padding-bottom: 5px;
		font-weight: 700;
		color: #387173;
		font-size: 17px;
	}
	
	#btn_member{
		width:430px;
		height: 60px;
		font-size: 33px;
		text-align: center;
		background-color: #387173;
		color: white;
		display: block;
		padding-top: 2px;
		margin: 20px auto;
		line-height: 50px;
		font-weight: 700;
	}
	
	#btn_member:hover{
		background-color: #fdd7d0;
	}
	
	#btn_member2{
		width:430px;
		height: 60px;
		font-size: 33px;
		text-align: center;
		background-color: white;
		color: #387173;
		display: block;
		padding-top: 2px;
		margin: 20px auto;
		line-height: 50px;
		font-weight: 700;
	}
	
	#btn_member2:hover{
		background-color: #387173;
		color:white;
	}
	
	#addr_btn{
		width:100px;
		height: 29px;
		font-weight: 700;
		background-color: #387173;
		color: white;
	}
	
	#addr_btn:hover{
		background-color: #fdd7d0;
	}
	
	#sample6_postcode{
		border: 1px solid white;
		height: 13px;
		padding: 7px 0px 7px 10px;
		width : 180px;
		font-size: 13px;
		border-bottom: 2px solid #387173;
	}
	.input_addr{
		width: 418px;
		height: 13px;
		border: 1px solid white;
		padding: 7px 0px 7px 10px;
		margin-top: 3px; 
		font-size: 13px;
	}
	
	
		
	#footer{
		padding : 15px 0px;
	}
	
	#footer *{
		font-size: 10px;
		line-height: normal;
		list-style: none;
		color: #387173;
	}
	
	#footer > ul{
		text-align: center;
		margin: px auto 8px;
	}
	
	#footer > ul > li{
		display: inline-block;
		border-left: 1px solid #dadada;
		padding :0px 5px 0 7px;
	}
	#footer > ul > li:first-child{
		border-left: 0px;
	}
	
	#address{
		margin: 0 auto;
		text-align: center;
	}
	
	#address a{
		font-weight:bold;
	}
	#footer > ul > li a:hover{
		color: #f8a78e;
	}
	
	.input_email{
		width: 125px;
		height: 13px;
		border: 1px solid white;
		border-bottom: 2px solid #387173;
		padding: 7px 0px 7px 10px;
		margin-top: 3px; 
		font-size: 13px;
		/* outline-width:0; = 이거하면 input창 클릭했을 때 나오는 파란색 사라짐*/
	}
	

		
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#selmail").change(function(){
			var selmail=$("#selmail").val();
			/* #selmail의 value값을 selmail변수에 담아라 */
			
			if(selmail == "directVal"){
				$("#email_url").val("");
				$("#email_url").focus();
			} else {
				$("#email_url").val(selmail);
				/* #email_url의 value속성에 selmail변수 값을 넣어라 */
			}

		});
		
	$(".input_login").blur(function(){
		var inputVal = $(this).val();
		
		if(inputVal == ""){
			$(this).next().text("필수정보 입니다.").css("display","block");
/* 			$(".error").css("display","block"); */
			$(this).parent().css("margin-bottom","30px");
		}else{
			$(this).next().css("display","none");
			$(this).parent().css("margin-bottom","10px");
		}
		

		});
	$(".input_email").blur(function(){
		var inputVal = $(this).val();
		
		if(inputVal == ""){
 			$("#input_error").css("display","block");
			$(this).parent().css("margin-bottom","30px");
		}else{
 			$("#input_error").css("display","none");
			$(this).parent().css("margin-bottom","10px");
		}
		});
	
	$("#userpw2").blur(function(){
		var pw1 = $("#userpw").val();
		var pw2 = $("#userpw2").val();	
		if(pw1 !="" && pw2 !=""){
			if(pw1==pw2){
				$(".checkpw").next().css("display","none");
			}else{
				//비밀번호 확인 값이 다르면 경고메세지 출력
				//선행조건 : 둘 다 값이 존재할 때만 적용가능
				// 1. 비밀번호확인 메세지에 "비밀번호가 일치하지 않습니다" 출력
				// 2. 비밀번호 확인(input) -> focuns가 가고 3.값을 초기화
				$(this).next().text("비밀번호가 일치하지 않습니다.").css("display","block");
				$(this).parent().css("height","70px");
				$(this).select();
				
			}
			
		}
		
	});
	
	$(".addrbtn").click(function(){
		$("#addr_btn").click();
	});
	
	$("#btn_member").on("click",function(){
			$("#frm_login").submit();
	});
	
});
	
	$(document).on("click","#btn_member",function(){
		var form = $("#frm_mem"),
		mid = $("#userid"),
		mpw = $("#userpw"),
		mpw2 = $("#userpw2"),
		mname =$("#username"),
		mphone = $("#userphone"),
		memailid =$("#email_id"),
		memailurl =$("#email_url"),
		zipcode =$("#sample6_postcode"),
		maddr1 =$("#sample6_address"),
		maddr2 =$("#sample6_address2");
		
		/* 전화번호(Phone)
		1. 01021111234
		2. 010-2111-1234
		체크하는 방법
		1) input size=11 고정
		010-2111-12(11글자)>사용자가 지우게 됨
		2) input size 고정 안하고
		010-2111-1234입력받으면
		substring으로 (-)을 제거한 후 데이터베이스에 저장
		3) 애초에 input 3개를 만든다
		input1 - input2 -input3
		input size=3 size = 4 size = 4로 고정을 시켜놓으면 가장 편하긴 함
		
		*/
		
		/* 유효성체크 */
		/* trim: 앞뒤 공백 제거 */
		var id = $.trim(mid.val());
		var regId = /^[a-zA-Z0-9]{4,12}$/; /* 4~12자 까지 영대소문자와 숫자만 입력 가능 */
		if(id == ""){
			mid.focus();
			mid.next().text("필수정보 입니다.").css("display","block");
			mid.parent().css("margin-bottom","30px");
			return false;/* 이걸해야 submit이 안됨! 꼭 해야함 */
		}/* +ID중복체크 */else if(!regId.test(id)){
			mid.focus();
			mid.next().text("영문자와 숫자만 입력하세요.").css("display","block");
			mid.parent().css("margin-bottom","30px");
			return false;
		}
		
		var pw = $.trim(mpw.val());
		var pw2 = $.trim(mpw2.val());
		var regPass = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;/* 영문자, 숫자 포함 특수문자 사용가능 8~20자리 */
		if(pw == ""){
			mpw.focus();
			mpw.next().text("필수정보 입니다.").css("display","block");
			mpw.parent().css("margin-bottom","30px");
			return false;
		}else if(!regPass.test(pw)){
			mpw.focus();
			mpw.next().text("8~20자 이내 영문자와 숫자 특수문자만 입력하세요.").css("display","block");
			mpw.parent().css("margin-bottom","30px");
			return false;
		}else if(pw2 == ""){
			mpw2.focus();
			mpw2.next().text("필수정보 입니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		}else if(pw != pw2){
			mpw2.select();
			mpw2.next().text("비밀번호가 일치하지 않습니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		}
		
		var name = $.trim(mname.val());
		if(name == ""){
			mname.focus();
			mname.next().text("필수정보 입니다.").css("display","block");
			mname.parent().css("margin-bottom","30px");
			return false;
		}
		
		
		/* 전화번호랑 주소 유효성체크 = 숙제
		1. 전화번호는 숫자값만 들어오는 유효성체크 추가*/
		
		
		var phone = $.trim(mphone.val());
		var regPhone =/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;

		
		if(phone == ""){
			mphone.focus();
			mphone.next().text("필수정보 입니다.").css("display","block");
			mphone.parent().css("margin-bottom","30px");
			return false;
			}else if($.isNumeric(phone)==false){/* 숫자값만 받아왔는지 체크 */
				mphone.select();
				mphone.next().text("숫자만 입력해주세요.").css("display","block");
				mphone.parent().css("margin-bottom","30px");
				return false;
		}else if(!regPhone.test(phone)){
			mphone.select();
			mphone.next().text("형식이 올바르지 않습니다.").css("display","block");
			mphone.parent().css("margin-bottom","30px");
			return false;
		}
		
		var code = $.trim(zipcode.val());
		var addr1 = $.trim(maddr1.val());
		var addr2 = $.trim(maddr2.val());
		
		if(code == ""){
			zipcode.focus();
			maddr2.next().text("필수정보 입니다.").css("display","block");
			maddr2.parent().css("margin-bottom","30px");
			return false;
		}else if(addr1 == ""){
			maddr1.focus();
			maddr2.next().text("필수정보 입니다.").css("display","block");
			maddr2.parent().css("margin-bottom","30px");
			return false;
		}else if(addr2 == ""){
			maddr2.focus();
			maddr2.next().text("필수정보 입니다.").css("display","block");
			maddr2.parent().css("margin-bottom","30px");
			return false;
			
		}
		
		var mailid = $.trim(memailid.val());
		var mailurl = $.trim(memailurl.val());
		var mail = mailid + "@" + mailurl;
		var regMail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		if(mailid == ""){
/* 			alert("no") */
			memailid.focus();
			$("#input_error").text("필수정보 입니다.").css("display","block");
			memailid.parent().css("margin-bottom","30px");
			return false;
		}else if(mailurl == ""){
			memailurl.focus();
			$("#input_error").css("display","block");
			memailurl.parent().css("margin-bottom","30px");
			return false;
		} else if(!regMail.test(mail)){
			memailid.select();
			$("#input_error").text("Email형식이 올바르지 않습니다.").css("display","block");
			memailid.parent().css("margin-bottom","30px");
			return false;
		}
		form.submit();
		
	});

</script>
</head>
<body>
<!-- 회원가입 ID, PW, PW재확인, 이름, 전화번호, 주소, E-mail
input 태그는 form태그로 싸고, label 태그를 사용할 것 -->

		<div class="lelele">
			<form id="frm_mem" action="memberplay.bizpoll" method="POST" name="frm_mem">
			<div>
			<a href="#" class="n_logo">
				<img alt="로고" src="img/beil.png" width="110px" height="30px">
			</a>
			<h1 id="beillam_logo">
				<a href="" class="b_logo">회원가입</a>
			</h1>
			</div>
				<div class="input_member">
					<label for="userid">ID</label>
					<input type="text" placeholder="아이디" id="userid" class="input_login" name="userid">
					<span class="error">필수정보입니다.</span>
					
				</div>
				<div class="input_member">
				 <label for="userpw">비밀번호</label>
					<input type="password" placeholder="비밀번호" id="userpw" name="userpw" class="input_login checkpw">
					<span class="error">필수정보입니다.</span>
					
				</div>
				<div class="input_member">
					<label for="userpw2">비밀번호재입력</label>
					<input type="password" placeholder="비밀번호재입력" id="userpw2" class="input_login checkpw">
					<span class="error">필수정보입니다.</span>
					
				</div>
				<div class="input_member">
					<label for="username">이름</label>
					<input type="text" placeholder="이름" id="username" name="username" class="input_login">
					<span class="error">필수정보입니다.</span>
					
				</div>
				<div class="input_member">
					<label for="username">휴대폰번호</label>
					<input type="text" placeholder="핸드폰번호(-없이 입력하세요)" id="userphone" name="userphone" class="input_login" maxlength="11">
					<span class="error">필수정보입니다.</span>
					
				</div>
				<div class="input_member2">
				<input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" readonly="readonly" class="addrbtn">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="addr_btn"><br>
<input type="text" id="sample6_address" placeholder="주소" name="sample6_address" class="input_addr addrbtn" readonly="readonly">
<input type="text" id="sample6_address2" placeholder="상세주소" name="sample6_address2" class="input_addr input_login">
<span class="error" id="input_error2">필수정보입니다.</span>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
</div>
				<div class="input_member">
					<label for="useremail">Email</label>
					<input type="text" id="email_id" name="email_id" placeholder="ID" class="input_email">
						<span>@</span>
						<input type="text" id="email_url" name="email_url" placeholder="URL" class="input_email">
						<select id="selmail">
							<option value="" selected="selected">Email 선택</option>
							<option value="directVal">직접입력</option>
							<option value="naver.com">naver.com(네이버)</option>
							<option value="daum.com">daum.net(다음)</option>
							<option value="gmail.com">gmail.com(구글)</option>
							<option value="nate.com">nate.com(네이트)</option>
						</select>
						<span class="error" id="input_error">필수정보입니다.</span>
				</div>
				<div><a href="#" id="btn_member">회원정보수정</a></div>
				<div><a href="#" id="btn_member2">삭제</a></div>
				
					<div id="footer">
			<ul>
				<li><a href="">이용약관</a></li>
				<li><a href="">개인정보처리방침</a></li>
				<li><a href="">책임의 한계와 법적고지</a></li>
				<li><a href="">회원정보 고객센터</a></li>
			</ul>
			<div id="address">
				<span>Copright</span>
				<span>ⓒ</span>
				<a href=""><span>beillam</span></a>
				<span>All Rights Reserved.</span>
			</div>
			
			</div>
				
			
			</form>
		</div>
			


</body>
</html>