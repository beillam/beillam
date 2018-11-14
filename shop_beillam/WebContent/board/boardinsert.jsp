<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Poor+Story');

* {
	font-family: 'Poor Story', cursive;
}

#detailboard {
	padding-top: 144px;
}

body, ul {
	margin: 0px;
	padding: 0px;
}

ul {
	list-style: none;
	list-style-type: none;
}

a {
	text-decoration: none;
}

#detail_board_all {
	width: 100%;
	margin: 30px 0;
}

#detail_head {
	width: 80%;
	margin: 0 auto;
	text-align: center;
	padding: 30px 0 0 0;
}

#detail_head>span {
	font-size: 30px;
	font-weight: 700;
	line-height: 40px;
	color: #387173;
}

#detail_body {
	width: 80%;
	margin: 0 auto;
}

#content {
	width: 97%;
	height: 350px;
	margin: 20px;
	font-size: 20px;
	outline: none;
	border: none;
	border: 1px solid #dadada;
}

#content2 {
	margin: 10px;
	font-size: 18px;
}

table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

#table_div {
	margin: 20px 0 0 0;
}

table {
	border: 1px solid #fea1aa;
}

.cont-sub2 {
	text-align: right;
	
}

.line {
	padding: 5px 20px;
}

.table_head {
	height: 20px;
	background-color: #fcd3d3;
	color: white;
	font-size: 17px;
	font-weight: 700;
	padding: 3px 20px;
}

#other_button {
	margin: 3px 0 20px 0;
}

.review_table_div {
	padding: 20px 0;
	text-align: center;
	font-size: 17px;
	margin: 20px 50px;
}

#title2 {
	padding: 5px;
}

.other_input {
	width: 1472px;
	height: 20px;
	margin: 2px 20px 10px 20px;;
	font-size: 20px;
	outline: none;
	border: none;
	border: 1px solid #dadada;
}

/* 끄아아앙 */
.review_all {
	width: 1418px;
	margin: 20px 50px;
}

.review_info {
	border-bottom: 2px solid #fea1aa;
	padding: 3px 10px;
}

.review_writer {
	text-align: left;
	float: left;
}

.review_date {
	text-align: right;
}

.riveiw {
	padding: 10px 20px;
	height: 50px;
	font-size: 16px;
}

.review_input_div {
	margin: 0 50px;
	border: 2px solid #dadada;
	height: 60px;
}

#review_input {
	width: 1310px;
	height: 55px;
	outline: none;
	border: none;
	font-size: 16px;
}

.inputlabel {
	font-size: 20px;
	margin: 5px 15px;
}

#file {
	padding: 10px 20px;
	text-align: left;
	border-top: 1px solid #fea1aa;
}

#insert {
	padding: 10px 40px;
	text-align: right;
	border-top: 1px solid #fea1aa;
}

#err_chk{
	padding : 3px 30px;
	font-size: 13px;
	color: red;
	display: none;
}
</style>
<script type="text/javascript" src="<%=path%>/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on("click","#insert_botton", function(elClickedObj){
		var title = $("#title_input").val();
		//스마트에디터로 content부분 값 넘겨받는 부분
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[]);
		
		if(title==""){
			$("title").focus();
			$("#err_chk").css("display","block");
			return false;
		}
		
		$("#frm_bin").submit();
		alert("보내기끝");
		
		
	});
	
	$(document).on("blur","#title_input",function(){
		var title = $("#title_input").val();
		if(title == ""){
			$("#err_chk").css("display","block");
		}else{
			$("#err_chk").css("display","none");
		}
		
	});
	
	$(document).on("click", ".btn-file", function(){
		$("#uploadfile").click();
	});
	
	$(document).on("change","#uploadfile",function(){
		var filesize = $(this)[0].files;
		if(filesize.length < 1){
			$("#file-name").text("선택된 파일 없음");
			$("#close_btn").css("display","none");
		}else{
			var filename = this.files[0].name;
			$("#file-name").text(filename);
			$("#close_btn").css("display","block");
		}
		var filename = this.files[0].name;
		$("#file-name").text(filename);
		$("#close_btn").css("display","block");
	});
	$(document).on("click","#close_btn", function(){
		$("#uploadfile").replaceWith($("#uploadfile").clone(true));
		$("#uploadfile").val("");
		$("#file-name").text("선택된 파일 없음");
		$("close_btn").css("display","none");
	});
	
</script>

</head>
<body id="detailboard">
	<!-- 제목, 타입, 작성일자, 작성자, 좋아요, 조회수, 내용, 목록/답변버튼, 수정/삭제버튼, 첨부파일 -->
	<div id="detail_board_all">
		<div id="detail_head">
			<span>리뷰</span>
		</div>
		<form action="boardInsertPlay.bizpoll" name="frm_bin" id="frm_bin" method="post" enctype="multipart/form-data">
		<div id="detail_body">
			<!-- colspan = 가로열 병합 -->
			<!-- rowspan = 세로열 병합 -->
			<div id="table_div">
				<table>
					<thead>
						<tr>
							<td colspan="2" class="table_head"></td>
						</tr>
					</thead>
					<tr id="title2">
						<td colspan="2">
							<div class="other_div">
								<label for="title" class="inputlabel">제목</label> <input
									type="text" placeholder="제목을 입력해주세요." name="title" class="other_input">
									<span id="err_chk">제목을 입력해주세요.</span>
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<div class="cont-sub">
								<div id="content2">
									<textarea id="content" name="content" rows="" cols=""></textarea>

								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="other_div">
								<label class="inputlabel" for="writer">작성자</label>
								<input value="${sessionScope.loginUser.id}" readonly="readonly" id="writer" name="writer">
							</div>
						</td>
					</tr>
					<tr>
						<td>
						<div id="file_wrap">
							<input type="file" name="uploadfile" id="uploadfile">
							<input type="button" class="btn-file" value="파일선택">
							<span class="files" id="file-name" style="height=29px; border: none;">파일선택</span>
							<i class="fa fa-close" id="close_btn" style="display: none"></i>
						</div>
								
							</td>
						<td><div id="insert">
								<button id="insert_botton">등록</button>
							</div></td>
					</tr>

				</table>
			</div>



		</div>
	</form>
	</div>
<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "<%=path%>/smarteditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});

	</script>
</body>
</html>