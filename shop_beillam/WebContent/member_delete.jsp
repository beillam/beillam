<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');
	body{
		margin:0px;
		padding: 0px;
		background-color: #fde6d9;
		font-family:'Poor Story', cursive;/* 폰트적용 */
	}
	ul{	margin:0px;
		padding: 0px;
		font-family: 'Poor Story', cursive;
	}
	
	a{
		text-decoration: none;
	}
	
	#modal_all{
		z-index: 3;
		position: fixed;
		top:0;
		left: 0;
		width: 100%;
		height: 100%;
		overflow:auto;
		background-color: rgba(0,0,0,0.3);
		padding-top: 130px;
		display: none;
	}
	
	/* header(로고) */
	.n_logo{
		display: block;
		padding-top: 10px;
		margin: 0px 0px 0px 10px;
	}
	
	#beillam_logo{
		margin: 0px;
		padding: 10px 0 0 0;

	}
	.b_logo{
		display: block;
		width: 350px;
		height: 70px;
		margin: 0 auto;
		text-align: center;
		font-size: 40px;
		color: #387173;
	}
	
	#login_layout{
		width:500px;
		margin:150px auto;
		padding: 20px;
		background-color: white;
		position: relative;
		
	}
	
	#close_btn{
	 	position: absolute;
	 	right: 10px;
	 	top:3px;
	 	color: black!important;
	 	font-size: 20px;
	 	padding: 5px;
	 	display: block;
	 }
	 
	 #close_btn:hover{
	 	background-color: #fdd7d0;
	 }
	
	#header_div img{
		display: block;
		margin: 60px auto;
	}
	
	/* Section(input id,pw), 로그인버튼 */
	
	.div_input{
		background-color: white;
		border: 2px solid #387173;
		width: 416px;
		height:30px;
		margin:0 15px 10px 15px;
		padding : 10px 35px 10px 15px;
	}
	
	.input_login{
		width:416px;
		height: 30px;
		border-width: 0px;
	}
	
	#btn_login{
		width:470px;
		height:54px;
		margin:0 15px 10px 15px;
		font-size:28px;
		font-weight:700;
		background-color: #4d8992;
		text-align: center;
		color: white;
		display: block;
		padding-top: 2px;
		line-height: 53px;
	}
	#btn_login:hover{
	 	background-color: #fdd7d0;
	 }
	 
	 #btn_no{
	 	width:470px;
		height:54px;
		margin:0 15px 10px 15px;
		font-size:28px;
		font-weight:700;
		background-color: #4d8992;
		text-align: center;
		color: white;
		display: block;
		padding-top: 2px;
		line-height: 53px;
	 }
	 #btn_no{
	 	background-color: #fdd7d0;
	 }
	 
	 #iii{
	 	font-size: 15px;
	 	text-align: center;
	 	padding: 10px 20px 40px 20px;
	 }
	
	#state{
		width: 470px;
		font-size:15px;
		display: inline-block;
		margin: 0 0px 0px 15px;
	}
	
	hr{
		width:97%;
		margin: 27px auto;
	}
	
	#member{
		color:#dadada;
		font-size: 15px;
		text-align: center;

	}
	
	#member > a{
		color: #387173;
		padding: 0px 6px;
		border-left: 2px solid #dadada;
	}
	#member > a:first-child{
		border-left: 0px;
	}
	#member > a:hover{
		color : #f8c5c5;
	}
	
	
	ul{
		list-style-type: none;
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
		
	#address{
		color: #b4b7c1;
	}
	
	#address > a{
		color: #d7d1e1;
	}
	#err_check{
		color : red;
		text-align: center;
		margin-bottom: 5px;
		display: none;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#inputid").focus(function(){
			$("beillam_id").css("border","2px solid #ffd6ae");
		});
		$("#inputid").blur(function(){
			$("beillam_id").css("border","2px solid #387173");
		});
		
		/* Modal창 켜고끄기 */
		$("#login_btn").click(function(){
			$("#modal_all").css("display","block");
			
		});
		
		$("#close_btn").click(function(){
			$("#inputid").val("");
			$("#inputpw").val("");	
			$("#modal_all").css("display","none");
		});
		
		$("#btn_login").on("click",function(){
			/* input의 id와 pw값을 입력 */
			var val1 = $("#inputid").val();
			var val2 = $("#inputpw").val();
			
			/* 유효성체크 */
			if(val1 !="" && val2 !=""){
				$("#frm_login").submit();
			}else{
				$("#err_check").css("display","block");
				return;
			}
		});
		
	});
	
	$(document).on("click","#btn_login",function(){
		var nowPw=$("#inputpw").val();
		alert("test");
		
		/* $.ajax({
			url : url : "member_delete.bizpoll",
			type : "POST",
			dataType : "json",
			data : "id=${sessionScope.loginUser.id}&pw="+nowPw,
			success : function(data){
				if(data.message=="-1"){
					location.href="index.bizpoll";
				}else{
					
				}
			},
			error : function(){
				alert("시스템에러!")
			}
		}) */
		
	});
	
	
	
</script>
</head>
<body>
	<div id="login_layout">
		<header><!-- 로고있는 거 누르면 홈화면으로 가게 하는거 -->
		<div>
			<a href="index.bizpoll" class="n_logo">
				<img alt="로고" src="img/beil.png" width="110px" height="30px">
			</a>
			<h1 id="beillam_logo">
				<a href="" class="b_logo">회원탈퇴</a>
			</h1>
		</div>
		</header>
		<section><!-- 몸통 -->
		<form action="" name ="" id="frm_login" method="">
			<div id="iii">
				<span>탈퇴하시겠습니까?
				<br> 탈퇴하시려면 비밀번호를 입력한 뒤 회원탈퇴를 클릭해주세요.</span>
			</div>
			<div class="div_input" id="beillam_pw">
				<input type="password" placeholder="비밀번호" id="inputpw" name="inputpw" class="input_login">
			</div>
			<div id="err_check">
				<span>비밀번호를 입력해주세요.</span>
			</div>
			<div><a href="#" id="btn_login">회원탈퇴</a></div>
			<div><a href="#" id="btn_no">취소</a></div>
		</form>
			
					
		</section>
		<footer>
			
		</footer>
		</div>


</body>
</html>