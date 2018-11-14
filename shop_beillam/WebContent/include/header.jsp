<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();//컨텍스트 경로
%>
<!DOCTYPE html>
<html>
<head>
1
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon"href="img/favicon.ico"type="image/x-icon">
<link rel="icon"href="img/favicon.png" type="image/png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header.html</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');
	*{
		font-family: 'Poor Story', cursive;
	}
		
	body, ul{
		margin:0px;
		padding:0px;
	}
	
	ul{
	list-style-type:none;
	}
	a{
	text-decoration:none;
	}
	
	#header_wrap{
		position: fixed;
		width: 100%;
		box-sizing: border-box;
		top:0px;
		left: 0px;
		background-color: white;
		z-index: 1;
	}
	
	/* 로그인 회원가입, 마이페이지, 고객센터 */
	#header_line1{
		height : 30px;
		width: 100%;
		background-color: #4d8992;
 		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
/* 					0 6px 20px 0 rgba(0, 0, 0, 0.19); */
	}
	#header_line1_in{
		width:80%;
		margin: 0 auto;
	
	}
	
	#header_line1_ul{
		float:right;
		
	}
	#header_line1_ul > li > a{
		color:white;
		font-size: 16px;
		font-weight: 700;
		height:30px;
		padding:0 10px;
		display: inline-block;
		line-height: 30px;/*  */
	}
	
	#header_line1_ul > li{
	float:left;
	position: relative;
	
	}
	
	#header_line1_ul_li{
		color: white;
		padding: 5px;
		font-weight: 700;
	}
	#header_line1_ul > li:hover{/* li태그에 마우스를 올렸을 때 동작하는 내용 */
		background-color: #fcd3d3;
	}
	
	
	#header_line1_ul > li > a:hover{
		color:#4d8992;
	}
	
	#header_line1_ul > li:hover #header_line1_dropdown {
		/* li태그를 호버했을 때 #header_line1_dropdown를 어떻게 변경할지 적용하는 것 */
		display: block;	
	}
	
	#header_line1_dropdown>a{
		display:block;
		font-size:16px;
		padding-left: 10px; /* 좌측 안쪽 여백 */
		background-color: #4d8992;
		color: white;
		padding : 5px 0px; /* 위아래 여백에 5px, 좌우측 여백 0px : 최종적으론 0px를 먹음
							즉 중복적이더라도 최종적으로는 맨 아래쪽값만 적용됨 */						
		padding : 5px 10px;
		 /* 아예 존재자체가 없어지는 것 */
	/* 	visibility: false; /* 있는데 안보이는 것(자리를 차지하고 있음) */
		width: 92px;	
	
	}
	
	#header_line1_dropdown>a:hover{
		background-color: #fcd3d3;
		color:#2c3e4c;
	}
	
	#header_line1_dropdown{
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
		position: absolute;
		display: none;
		z-index: 1;
	}
	
	
	#header_line1_mypage{
		width:92px;
		text-align: center;
	}

	/* 로고이미지, 검색 */
	#header_line2{
		width:80%;
		margin: 0 auto;
	}

	#header_line2_logo{
		display:inline-block;
		margin:10px 0 10px 0px;
	}
	
	
	/* line2 검색창 */
	
	#header_line2_wrap_search{
		height:30px;
		display: inline-block;
		float:right;
		padding-top:20px; 
	}
	
	div#header_line2_search{
		border: 2px solid #fcd3d3;
		height: 30px;
		box-sizing: border-box;
		position: relative;
	}
	input#search_keyword{
		width: 353px;
		height:26px;
		font-size: 13px;
		box-sizing: border-box;
		border: 0px;
		padding-left:10px;
	}
	input#search_btn{
		width: 55px;
		height: 26px;
		background-color: #fcd3d3;
		color:white;
		font-size: 13px;
		border:0px;
		position: absolute;
		right: 0px;
		top:0px;
	}
	/* 네비게이션 메뉴바 */
	
	#header_line3{
		width:100%;
		background-color:#fcd3d3;
		box-shadow:0 4px 8px 0 rgba(0, 0, 0, 0.2);
	}
	#header_line3_ul{	
		width:100%;/* 가로길이 */
		height:49px;/* 세로길이 *//* 배경색 *//* 그림자 */
		box-sizing:border-box;/* 크기고정 */
	}
	
	#header_line3_ul > li{
		float:left;
		box-sizing:border-box;
		height:49px;
		position: relative;
	}
	#header_line3_ul> li > a{
		color:white;
		line-height:49px;
		font-size:25px;
		padding:0px 13px;
		whith:116px;
		display:inline-block;
		text-align:center;
	}
	
	#header_line3_ul > li:hover{
		background-color:#fde5d9;
		color: #387173;
		border-top:5px solid white;
	}
	#header_line3_in{
	width:80%;
	margin:0 auto;
	}
	
	#header_line3_dropdown1{
		position: absolute;
		background-color:#eef9f6;
		display: none;

	}
	
	#header_line3_dropdown1>a{
		font-size: 20px;
		width: 115px;
		height:20px;
		display: inline-block;
		text-align: left;
		color : #387173;
		padding: 5px 0px 5px 10px;
	}
	
	#header_line3_dropdown1 > a:hover{
		background-color: #ffd6ae;
		color: white;
	}
	
	#header_line3_ul > li:hover #header_line3_dropdown1{
		display: block;
		top:44px;
	}

	#header_line3_ul_dropdown1{
		position:absolute;
		background-color:#eef9f6;
		display: none;
	}
	
	#header_line3_ul > li:hover #header_line3_ul_dropdown1{
		display: block;
		top:44px;

	}
	
	#header_line3_ul_dropdown1>ul>li>a{
		color: #387173;
		width:137px;
		height:20px;
		font-size: 20px;
		text-align: left;
		padding: 5px 0px 5px 10px;
		display: inline-block;

	}
	
	#header_line3_ul_dropdown1>ul>li:hover{
		background-color: #ffd6ae;

	}
	#header_line3_ul_dropdown1>ul>li>a:hover{
			color: white;
	}
	
	#header_line3_ul_dropdown2{
		position: absolute;
		left:147px;
		background-color:#eef9f6;
		top:100px;
		display: none;
	}
	
	#header_line3_ul_dropdown1>ul>li:hover #header_line3_ul_dropdown2{
		display: block;
	}
	#header_line3_ul_dropdown2 > a{
		color: #387173;
		font-size:20px;
		display: block;
		width : 100px;
		height:30px;
		text-align: left;
		padding: 0px 4px;
	}
	
	#header_line3_ul_dropdown2 > a:hover{
		background-color: #ffd6ae;
		color: white;
	}
	
	#header_line3_ul_dropdown2 >ul >li{
		position: relative;
	}
	
</style>
</head>
<body>
	<header>
		<div id="header_wrap">
			<div id="header_line1">
				<div id="header_line1_in">
				<ul id="header_line1_ul" class="line1_ul1">
				<c:choose>
					<c:when test="${empty sessionScope.loginUser}">
						<li><a href="<%=path%>/login.bizpoll">로그인</a></li>
						<li><a href="<%=path%>/member_check.bizpoll">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li id="header_line1_ul_li">
							${sessionScope.loginUser.name}
							(${sessionScope.loginUser.id})
						</li>
						<li><a href="Loginout.bizpoll">로그아웃</a></li>
					</c:otherwise>
					</c:choose>
						<li><a id ="header_line1_mypage" href="">마이페이지▽</a>
							<div id="header_line1_dropdown">
								<a href="#">주문/배송조회</a>
								<a href="#">장바구니</a>
								<a href="#">위시리스트</a>
								<c:choose>
									<c:when test="${empty sessionScope.loginUser}">
										<a href="#">회원정보</a>
									</c:when>
									<c:otherwise>
										<a href="<%=path%>/updatepw.bizpoll">비밀번호수정</a>
										<a href="#">회원정보수정</a>
										<a href="#">회원탈퇴</a>
									</c:otherwise>
								</c:choose>
								
								
							</div><!-- 앵커태그 안에 하면 모두 앵커태그를 먹어버리기 때문에 li태그 안에 넣는다. -->
						</li>					
						<li><a href="">고객센터</a></li>
					</ul>
				</div>
			</div>
			<div id="header_line2">
			<a href="<%=path%>/index.bizpoll">
				<img alt="로고" src="<%=path%>/img/beil.png" weith="200px" height="40px" id="header_line2_logo">
			</a>
			
				<div id="header_line2_wrap_search">
					<div id="header_line2_search">
						<input id="search_keyword" type="text" placeholder="검색어를 입력하세요.">
						<input id="search_btn" type="submit" value="검색">
					</div>
				
				</div>
			
			</div>
			<div id="header_line3">
				<div id="header_line3_in">
				<ul id="header_line3_ul">
					<li><a href="#">deco</a></li>
					<li><a href="#">stationery</a>
						<div id="header_line3_ul_dropdown1">
						<ul>
							<li><a href="">노트/바인더</a></li>
							<li><a href="">테이프</a></li>
							<li><a href="">씰/스티커</a></li>
							<li><a href="">문구/학용품</a></li>
							<li><a href="">펜</a>
								<div id="header_line3_ul_dropdown2">
									<a href="">볼펜</a>
									<a href="">형광펜</a>
									<a href="">네임펜</a>
									<a href="">리필심</a>
								</div>
							</li>
							<li><a href="">샤프</a></li>
						</ul>
						</div>
					</li>
					<li><a href="#">living</a></li>
					<li><a href="#">kitchen</a>
						<div id="header_line3_dropdown1">
							<a href="#">텀블러/물병</a>
							<a href="#">컵/머그/잔</a>
							<a href="#">피크닉/도시락</a>
							<a href="#">식기류</a>
							<a href="#">주방소품</a>
							<a href="#">조리도구</a>
						</div>
					</li>
					<li><a href="#">goods</a></li>
					<li><a href="<%=path%>/boardList.bizpoll">게시판</a></li>
				</ul>
				</div>
			</div>
		
		</div>
	</header>
</body>
</html>