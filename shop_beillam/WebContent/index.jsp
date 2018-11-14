<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Beillam</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');
	*{
		font-family: 'Poor Story', cursive;
	}
	
	#indexbody{
		padding-top: 144px;
	}
	body, ul{margin: 0px; padding: 0px;}
	ul{list-style: none; list-style-type:none;}
	a{text-decoration:none;}
	table{border-collapse: separate; border-spacing: 0;}
	
	/* top버튼 */
	#myBtn{
		width:100px;
		height: 100px;
		background-color: #fcd3d3;
		color:white;
		transform: rotate(315deg);
		position:fixed;
		right: -50px;
		bottom: -50px;
		text-align: center;
		font-size: 12px;
	}

	
	#myBtn:hover{background-color:#fde5d9;}
	
	/* 내용물 */
	
	#main_div_wrap{
		width: 100%;
		
	}
	
	/* 바뀌는 이미지 */
	
	.slideshow-container {
 		max-width: 1000px;
  		position: relative;
  		margin: auto;
  		box-sizing: border-box;
	}
	.mySlides {display: none;}
	.slideshow-container img {vertical-align: middle;}
	.dot {
  		height: 15px;
  		width: 15px;
  		margin: 0 2px;
  		background-color: #bbb;
  		border-radius: 50%;
  		display: inline-block;
  		transition: background-color 0.6s ease;
	}

	.active {
  		background-color: #717171;
	}
	
	.text {
 		 color: black;
  		font-size: 15px;
  		padding: 8px 12px;
  		position: absolute;
  		bottom: 8px;
  		width: 100%;
  		text-align: center;
	}

	/* Fading animation */
	.fade {
  		-webkit-animation-name: fade;
  		-webkit-animation-duration: 1.5s;
  		animation-name: fade;
  		animation-duration: 1.5s;
	}

	@-webkit-keyframes fade {
  		from {opacity: .4} 
  		to {opacity: 1}
		}

	@keyframes fade {
  		from {opacity: .4} 
  		to {opacity: 1}
		}
	
	/* 글자들 */
	.title_home{
		margin: 0 auto;
		text-align: center;
		font-size: 30px;
		padding: 30px 0px 0px 0px;
	}
	/* new! 글자에 색 바뀌는 거 넣는 거 */
	@keyframes textColorAnimation{
		0%{color:blue;}/* 시작부분: 0%=from */
		50%{color:green;}
		100%{color:red;}/* 끝부분: 100%=to */
	}
	#new_font{
		font-size: 15px;
		animation-name:textColorAnimation;/* 설정애니메이션이름 */
		animation-duration:2s;/* 1회 애니메이션 동작 시간 */
		animation-iteration-count:infinite;/*반복횟수:무한반복  */
	}
	
	/* 상품부분 */
	.all_item{
		width: 100%;
	}
	
	#best_item{
		display: block;
		margin: 0 auto;
		width: 80%;
	}
	.item{
		box-sizing: border-box;
		display: inline-block;
		padding: 10px 16px 20px 16px;
		margin: 10px 15px 20px 15px;
		height: 300px;
		text-align: center;
		border: 1px solid white;
	}
	
	.item:hover{
		border: 1px solid #dadada;
	}
	
	/* 신상품 */
	
	#new_item{
		display: block;
		margin: 0 auto;
		width: 80%;
	}
	
	.title{
		color: #2c3e4c;
		font-size: 15px;
	}
	.number{
		color: gray;
		font-size: 13px;
	}
	.currency{
		color: #45897c;
		font-size: 13px;
	}
	.area_status{
		padding-bottom: 15px;
	}
	
	
	
	/* 밑바닥부분 */
	#wrap_under{
		width: 100%;
		background-color: white;	
	}
	#wrap_under2{
		margin: 10px 0 0 0;
		width: 100%;
		background-color: #eeedf6;	
	}
	
	#under_div{
		width: 80%;
		margin: 0 auto;
	}
	#under_div_in{
		width: 25%;
		margin: 0 auto;
	}
	
	#under_div_ul{
		height: 35px;
	}
	#under_div_ul > li{
		float: left;
		box-sizing: border-box;
		position: relative;
/* 		border-left: 2px solid white; */
	}
	#under_div_ul > li:first-child{
/* 		border-left: 0px;
 */		/* margin: 0 0 0 350px;
 */	}
	#under_div_ul > li > a{
		color: #45897c;
		height: 35px;
		font-size: 15px;
		font-weight: 700;
		padding: 0px 10px;
		display: inline-block;
		line-height: 35px;
	}
	#under_div_ul > li:hover{
		background-color: #fcd3d3;
	}
	#under_div_ul > li > a:hover{
		color:white;
	}

	#under_div_td1{
		padding: 10px 0;
	}
	
	#under_div_td2{
		padding: 20px 30px 40px 40px;
		color: #45897c;
	}
	#under_phone{
		font-size: 30px;
		font-weight: 700;
	}
	#under_ex{
		font-size: 15px;
	}
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
		$("#myBtn").css("display","none");
	});
	$(window).scroll(function(){
		if($(document).scrollTop() > 20){
			$("#myBtn").css("display","block");
		}else{
			$("#myBtn").css("display","none");
		}
	});
	$(document).on("click","#myBtn",function(){
		$(document).scrollTop(0);
		$("html,body").animate({})
	});
	
</script>
</head>
<body id="indexbody">
	<div id="myBtn">
		<span>Top</span>
	</div>	

	<!-- 메인화면 -->
	<div id="main_div_wrap">
		<!-- 넘어가는 이미지-->
		<div class="slideshow-container">

			<div class="mySlides fade">
 		 		<img src="img/main1.png" style="width:100%" height="500">
  			<div class="text">Caption Text</div>
			</div>

			<div class="mySlides fade">
  				<img src="img/main2.png" style="width:100%" height="500">
  			<div class="text">Caption Two</div>
			</div>

			<div class="mySlides fade">
  				<img src="img/main3.png" style="width:100%" height="500">
  			<div class="text">Caption Three</div>
			</div>

		</div>
		<br>

		<div style="text-align:center">
  			<span class="dot"></span> 
  			<span class="dot"></span> 
  			<span class="dot"></span> 
		</div>
		
		
		<!-- 베스트 아이템 -->
		<div id="best_item" class="all_item">
			<!-- 글자  -->
			<h4 class="title_home">
			<span class="inner">BEST상품</span>
			</h4>
			<ul class="list">
				<c:forEach items="${bestlist}" var="bestDto">
				<li class="item">
					<a href="#" class="product area_overview">
						<div class="area_thumbnail">
							<div class="thumbnail">
								<img alt="상품1" src="img/${bestDto.p_img}" width="296" height="240" class="imege">	
							</div>
							<div class="area_title">
								<span class="title">${bestDto.p_name}</span>
							</div>
						</div>
						<div class="area_price">
							<span class="number">${bestDto.p_price}</span>
							<strong class="currency">원</strong>
						</div>
					</a>
					<div class="area_status"></div>
				</li>
				</c:forEach>
			</ul>
			
		</div>
		<!-- 신상품 -->
		<div id="new_item" class="all_item">
			<!-- 글자 -->
			<h4 class="title_home">
			<span id="new_font">NEW!</span><br><span class="inner">신상품</span>
			</h4>
				<ul class="list">
					<li class="item">
						<a href="#" class="product area_overview">
							<div class="area_thumbnail">
								<div class="thumbnail">
									<img alt="상품1" src="img/main1.png" width="296" height="240" class="imege">	
								</div>
								<div class="area_title">
									<strong class="title">상품명</strong>
								</div>
							</div>
							<div class="area_price">
								<strong class="number">10,000</strong>
								<strong class="currency">원</strong>
							</div>
						</a>
						<div class="area_status"></div>
					</li>
					
					<li class="item">
						<a href="#" class="product area_overview">
							<div class="area_thumbnail">
								<div class="thumbnail">
									<img alt="상품2" src="img/main2.png" width="296" height="240" class="imege">	
								</div>
								<div class="area_title">
									<strong class="title">상품명</strong>
								</div>
							</div>
							<div class="area_price">
								<strong class="number">10,000</strong>
								<strong class="currency">원</strong>
							</div>
						</a>
						<div class="area_status"></div>
					</li>
					<li class="item">
						<a href="#" class="product area_overview">
							<div class="area_thumbnail">
								<div class="thumbnail">
									<img alt="상품2" src="img/main3.png" width="296" height="240" class="imege">	
								</div>
								<div class="area_title">
									<strong class="title">상품명</strong>
								</div>
							</div>
							<div class="area_price">
								<strong class="number">10,000</strong>
								<strong class="currency">원</strong>
							</div>
						</a>
						<div class="area_status"></div>
					</li>
					<li class="item">
						<a href="#" class="product area_overview">
							<div class="area_thumbnail">
								<div class="thumbnail">
									<img alt="상품2" src="img/main4.png" width="296" height="240" class="imege">	
								</div>
								<div class="area_title">
									<strong class="title">상품명</strong>
								</div>
							</div>
							<div class="area_price">
								<strong class="number">10,000</strong>
								<strong class="currency">원</strong>
							</div>
						</a>
						<div class="area_status"></div>
					</li>
					<li class="item">
						<a href="#" class="product area_overview">
							<div class="area_thumbnail">
								<div class="thumbnail">
									<img alt="상품2" src="img/main5.jpg" width="296" height="240" class="imege">	
								</div>
								<div class="area_title">
									<strong class="title">상품명</strong>
								</div>
							</div>
							<div class="area_price">
								<strong class="number">10,000</strong>
								<strong class="currency">원</strong>
							</div>
						</a>
						<div class="area_status"></div>
					</li>
					<li class="item">
						<a href="#" class="product area_overview">
							<div class="area_thumbnail">
								<div class="thumbnail">
									<img alt="상품2" src="img/main6.jpg" width="296" height="240" class="imege">	
								</div>
								<div class="area_title">
									<strong class="title">상품명</strong>
								</div>
							</div>
							<div class="area_price">
								<strong class="number">10,000</strong>
								<strong class="currency">원</strong>
							</div>
						</a>
						<div class="area_status"></div>
					</li>
					<li class="item">
						<a href="#" class="product area_overview">
							<div class="area_thumbnail">
								<div class="thumbnail">
									<img alt="상품2" src="img/main7.jpg" width="296" height="240" class="imege">	
								</div>
								<div class="area_title">
									<strong class="title">상품명</strong>
								</div>
							</div>
							<div class="area_price">
								<strong class="number">10,000</strong>
								<strong class="currency">원</strong>
							</div>
						</a>
						<div class="area_status"></div>
					</li>
					<li class="item">
						<a href="#" class="product area_overview">
							<div class="area_thumbnail">
								<div class="thumbnail">
									<img alt="상품2" src="img/main8.jpg" width="296" height="240" class="imege">	
								</div>
								<div class="area_title">
									<strong class="title">상품명</strong>
								</div>
							</div>
							<div class="area_price">
								<strong class="number">10,000</strong>
								<strong class="currency">원</strong>
							</div>
						</a>
						<div class="area_status"></div>
					</li>
					
				
				</ul>
			
		</div>
		<!-- 밑부분(정보들?) -->
		<div id="wrap_under">
		<div id="wrap_under2">
			<div id="under_div_in">
			<div id="under_div_in_div">
				<ul id="under_div_ul">
					<li><a href="">서비스소개</a></li>
					<li><a href="">회사소개</a></li>
					<li><a href="">이용약관</a></li>
					<li><a href="">개인정보처리방침</a></li>
					<li><a href="">사용사진출처</a></li>
				</ul>
				</div>
			</div>
			</div>
			<div id="under_div">
				<table>
					<tr>
						<td id="under_div_td1">
							<img alt="로고" src="img/beillam.png">
						</td>
						<td id="under_div_td2">
							<span id="under_phone">1111-2222</span><br>
							<span id="under_ex">상호명 : (주)shap_beillam<br>
								이메일 : alzkeh3210@naver.com<br>
								주소 : 광주광역시 북구 경양로 170<br>
								NICEPAY 안전거래 서비스 : 고객님의 안전거래를 위해 현금 결제 시, 저희 사이트에서 가입한 구매안전 서비스를 이용할 수 있습니다.</span>
						</td>
					</tr>
				</table>
			</div>
		</div>

	</div>
	
 <script>
	var slideIndex = 0;
		showSlides();

	function showSlides() {
    	var i;
    	var slides = document.getElementsByClassName("mySlides");
    	var dots = document.getElementsByClassName("dot");
    	for (i = 0; i < slides.length; i++) {
       		slides[i].style.display = "none";  
    	}
    	slideIndex++;
    	if (slideIndex > slides.length) {slideIndex = 1}    
    	for (i = 0; i < dots.length; i++) {
        	dots[i].className = dots[i].className.replace(" active", "");
    	}
    	slides[slideIndex-1].style.display = "block";  
    	dots[slideIndex-1].className += " active";
    	setTimeout(showSlides, 2000); // Change image every 2 seconds
		}
</script>



</body>
</html>