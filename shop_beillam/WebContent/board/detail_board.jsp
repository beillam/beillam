<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');
	*{
		font-family: 'Poor Story', cursive;
	}
	#detailboard{
		padding-top: 144px;
	}
	body, ul{margin: 0px; padding: 0px;}
	ul{list-style: none; list-style-type:none;}
	a{text-decoration:none;}
	#detail_board_all{
		width: 100%;
		margin: 30px 0;
	}
	#detail_head{
		width: 80%;
		margin: 0 auto;
		text-align: center;
		padding: 30px 0 0 0;
	}
	#detail_head > span{
		font-size: 30px;
		font-weight: 700;
		line-height: 40px;
		color: #387173;
	}
	
	#detail_body{
		width: 80%;
		margin: 0 auto;
	}
	
	/* #content_input{t
		width: 97%;
		height: 300px;
		margin: 10px;
		font-size: 20px;
		outline: none;
		border: none;
	} */
	
	#content{
		height: 200px;
		margin: 10px;
		font-size: 18px;
	}
	
	table{
	 	width: 100%;
    	border-collapse: collapse;
   	    border-spacing: 0;
	}
	
	#table_div{
		margin: 20px 0 0 0;
	}
	
	table tr{
	border: 1px solid #fea1aa;
	}
	.cont-sub2{
		text-align: right;
	}
	.line{
		padding: 5px 20px;
	}
	
	.table_head{
		height: 20px;
		background-color: #fcd3d3;
		color: white;
		font-size: 17px;
		font-weight: 700;
		padding: 3px 20px;
	}
	
	#other_button{
		margin: 3px 0 20px 0;
	}
	
	.review_table_div{
		padding: 20px 0;
		text-align: center;
		font-size: 17px;
		margin: 20px 50px;
	}
	
	#title{
		padding: 5px;
	}
	
	
	/* 끄아아앙 */
	
	.review_all{
		width: 1418px;
		margin: 20px 50px;
		

	}
	
	.review_info{
		border-bottom: 2px solid #fea1aa;
		padding: 3px 10px;
	}
	.review_writer{
		text-align: left;
		float: left;
	}
	.review_date{
		text-align: right;
	}
	
	.riveiw{
		padding: 10px 20px;
		height: 50px;
		font-size: 16px;
	}
	
	.review_input_div{
		margin: 0 50px;
		border: 2px solid #dadada;
		height: 60px;
	}
	
	#review_input{
		width: 1310px;
		height: 55px;
		outline: none;
		border: none;
		font-size: 16px;
		
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#boardUpdate").click(function(){
			location.href="boardUpdate.bizpoll?bno=${boardView.bno}";
		});
	});
</script>
</head>
<body id="detailboard">
	<!-- 제목, 타입, 작성일자, 작성자, 좋아요, 조회수, 내용, 목록/답변버튼, 수정/삭제버튼, 첨부파일 -->
	<div id="detail_board_all">
		<div id="detail_head">
			<span>리뷰</span>
		</div>
		<div id="detail_body">
		<!-- colspan = 가로열 병합 -->
		<!-- rowspan = 세로열 병합 -->
		<div id="table_div">
			<table>
				<thead>
					<tr><td colspan="2" class="table_head"></td></tr>
				</thead>
				<tr>
						<th colspan="2"><div id="title">${boardView.title}</div></th>
					</tr>
				
				<tr id="line1_tr">
					<td class="line">
					<div class="cont-sub">
							<div id="board_no">
								<span>No. :${boardView.bno}</span>
							</div>
						</div>
						<div class="cont-sub">
							<div id="date">
								<span>Date : ${boardView.regdate}</span>
							</div>
						</div>
						<div class="cont-sub">
							<div id="writer">
								<span>Writer : ${boardView.writer}</span>
							</div>
						</div>
						
					</td>
					<td class="line">
						<div class="cont-sub2">
							<div id="like">
								<span>Like :${boardView.goodcnt}</span>
							</div>
						</div>
						<div class="cont-sub2">
							<div id="counting">
								<span>조회수 :${boardView.viewcnt}</span>
							</div>
						</div>
						<div class="cont-sub2">
							<div>
								<span>첨부파일:</span><a href="download.bizpoll?file=${boardView.filename}" id="file" name="file">${boardView.filename}</a>
								 <span>size : ${boardView.filesize}</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="cont-sub">
							<div id="content">
								<!-- <input type="text" placeholder="내용을 입력해주세요." id="content_input" name="content_input"> -->
								<spna id="content">${boardView.content}</spna>
							</div>
						</div>
					</td>
				</tr>
			</table>
			</div>
			<div id="other_button">
				<button type="button">첨부파일</button>
				<c:if test="${sessionScope.loginUser.id == boardView.writer}">
				<button type="button" id="boardUpdate">수정</button>
				<button type="button">삭제</button>
				</c:if>
			</div>
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
			<div>
				 <table>
					<thead>
						<tr><td class="table_head">댓글 0</td></tr>
					</thead>
					<tr class="riview_table_tr1">
						<td>
							<div class="review_table_div">
								<span>댓글은 로그인 후 이용하실 수 있습니다.</span>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:when>	
		
		<c:otherwise>
			<div>
				<table>
					<thead>
						<tr><td class="table_head">댓글 0</td></tr>
					</thead>
					<tr class="riview_table_tr1">
						<td>
							<div class="review_table_div">
								<div class="review_input_div">
								<input type="text" placeholder="댓글을 입력해주세요." id="review_input" name="review_input">
								</div>
								<div class="review_input_div2">
									<button type="botton">등록</button>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:otherwise>
		</c:choose>
			
			<!-- 	<div>
				<table>
					<thead>
						<tr><td class="table_head">댓글 1</td></tr>
					</thead>
					<tr>
					<td>
						<div class="review_all">
							<div class="review_info">
								<div class="review_writer">
								<span>Writer</span>
								</div>
								<div  class="review_date">
									<span>Date</span>
								</div>
								
							</div>
							<div class="riveiw">
								리뷰내용
							</div>
						</div>
					</td>
					</tr>
					<tr class="riview_table_tr1">
						<td>
							<div class="review_table_div">
								<span>댓글은 로그인 후 이용하실 수 있습니다.</span>
							</div>
						</td>
					</tr>
				</table>
			</div> -->
			
			<!-- <div>
				<table>
					<thead>
						<tr><td class="table_head">댓글 1</td></tr>
					</thead>
					<tr>
					<td>
						<div class="review_all">
							<div class="review_info">
								<div class="review_writer">
								<span>Writer</span>
								</div>
								<div  class="review_date">
									<span>Date</span>
								</div>
								
							</div>
							<div class="riveiw">
								리뷰내용
							</div>
						</div>
					</td>
					</tr>
					<tr class="riview_table_tr1">
						<td>
							<div class="review_table_div">
								<div class="review_input_div">
								<input type="text" placeholder="댓글을 입력해주세요." id="review_input" name="review_input">
								</div>
								<div class="review_input_div2">
									<button type="botton">등록</button>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div> -->
			
		</div>
		
	</div>
	
	
	
</body>
</html>