<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');
	*{
		font-family: 'Poor Story', cursive;
	}
	#boardbody{
		padding-top: 144px;
	}
	body, ul{margin: 0px; padding: 0px;}
	ul{list-style: none; list-style-type:none;}
	a{text-decoration:none;}
	
	#board_all{
		width: 100%;
	}
	
	#board_div{
		height: 450px;
	}
	
	/* 조회 */
	
	/* 게시글작성 */
	
	/* new글자 깜박이는 거 */
	@keyframes textColorAnimation{
		0%{color: red;}/* 시작부분: 0%=from */
		50%{color:#fde5d9;}
		100%{color:red;}/* 끝부분: 100%=to */
	}
	.new_time{
			font-size: 10px;
		animation-name:textColorAnimation;/* 설정애니메이션이름 */
		animation-duration:2s;/* 1회 애니메이션 동작 시간 */
		animation-iteration-count:infinite;/*반복횟수:무한반복  */
	}
	
	
	/* 테이블 */
	
	table{
	border-collapse:collapse;
	}/* 표 라인을 한줄로 만드는 오더 */
	
	table, th, td {
	border: 1px solid gray;
	}
	
	
	/* 페이지넘어가는 곳 */
	
	#page_no{
	
	}
	
	.pagination *{
		float:left;
		position: relative;
	}

	
	.active{
		background-color: #fcd3d3;
	}
	
	
	/* 검색 */
	#search_wrap{
		width:80%;
		margin: 0 auto;
	}
	#search_select{
		display: inline-block;
		float: left;
	}	
	
	#wrap_search{
		height:30px;
		display: inline-block;
		float:left;
	}
	
	div#search_div{
		border: 2px solid #fcd3d3;
		height: 30px;
		box-sizing: border-box;
		position: relative;
	}
	input#search_keyword2{
		width: 353px;
		height:26px;
		font-size: 13px;
		box-sizing: border-box;
		border: 0px;
		padding-left:10px;
	}
	input#search_btn2{
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

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#search_btn2").click(function(){
			var flag = $("#search_opt2").val();
			var keyword = $("#search_keyword2").val();
			
			location.href="boardList.bizpoll?flag="+flag+"&keyword="+keyword;
		});
		
		$("#btn_new").click(function(){
			
			
		});
	});
</script>
</head>
<body id="boardbody">
<div id="board_all">
	<div id="board_div">
			<h3>게시판</h3>
		<div id="board_div1_all">
		<div id="board_div1">
			<a href="#" id="" class="board_div1_a">최신순</a>
			<a href="#" id="" class="board_div1_a">추천순</a>
			<a href="#" id="" class="board_div1_a">조회순</a>
			<a href="#" id="" class="board_div1_a">댓글순</a>
		</div>
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<div>
					<a href="login.bizpoll" id="btn_new">게시글등록</a>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<a href="boardInsert.bizpoll" id="btn_new">게시글등록</a>
				</div>
			</c:otherwise>
		</c:choose>
		
		</div>
		<table id="board_table">
			<tr>
				<td>no.</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>첨부</td>
			</tr>
			<c:forEach items="${boardList}" var="bDto">
			<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
			<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate2"/>
			<tr>
				<td>${bDto.bno}</td>
				<td>
					<a href="boardViewcnt.bizpoll?bno=${bDto.bno}">${bDto.title}</a>
					<c:if test="${today2==regdate2}">
						<span class="new_time">New!</span>
					</c:if>
				</td>
				<td>${bDto.writer}</td>
				<td>
				<c:choose>
					<c:when test="${today2 == regdate2}">
						<fmt:formatDate pattern="HH:mm:ss" value="${bDto.regdate}"/>
					</c:when>
					<c:otherwise>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}"/>
					</c:otherwise>
				</c:choose>
				</td>
				<td>${bDto.viewcnt}</td>
				<td>
					<c:if test="${bDto.filesize > 0}">
						<i class="fa fa-floppy-o"></i>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		
		<div id="search_wrap">
			<div id="search_select">
			<select name="search_opt" id="search_opt2">
				<option value ="3" se>조건선택</option>
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">제목+내용</option>
				<option value="4">작성자</option>
			</select>
			</div>
			<div id="wrap_search">
				<div id="search_div">
				<input id="search_keyword2" type="text" placeholder="검색어를 입력하세요.">
				<input id="search_btn2" type="submit" value="검색">
				</div>			
			</div>
		</div>
		
	</div>
		
		<div id="page_no">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
				<li>
					<a href="boardList.bizpoll?page=${pageMaker.startPage -1}">&laquo;</a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li <c:out value="${pageMaker.criDto.page == idx? 'class=active':''}"/>>
					<a href="boardList.bizpoll?page=${idx}&flag=${flag}&keyword=${keyword}" class="pagent">${idx}</a>
				</li>				
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li>
					<a href="boardList.bizpoll?page=${pageMaker.endPage+1}">&raquo;</a>
				</li>
			</c:if>
			</ul>
		</div>
			
</div>


</body>
</html>