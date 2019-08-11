<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input, select, option {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;  
}
input, select {
    width:80px;
    height:20px;
    border : 1px #ccc solid;
    vertical-align:top;
}
#recipeboardlist{
	position: relative;
	text-align: center;
	top: 100px;
}

#button{
	text-align: left;
}

.boardtable{
	width: 100%;
    border-collapse: separate;
    border-spacing: 0px;
    border-top: 2px solid #b2b83b;
}
.boardtable th{
	border-bottom: 1px solid #eaeaea;
	text-align: center;
}
.boardtable td {
    font-weight: normal;
    color: #5a5a5a;
    text-align: center;
    line-height: 130%;
    vertical-align: middle;
    padding: 10px 0;
    font-size: 13px;
    border-bottom: 1px solid #eaeaea;
}
.recipecnt {
    text-decoration: none;
    cursor: pointer;
    color: #58585a;
}
#button{
	text-align: left;
}
#recipelike{
	float:left;	
	width: 30px;
	cursor: pointer;
	
}
#recipelike:active {
	
}
</style>
<link rel="stylesheet" href="static/base.css" />
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(function() {
	$('#recipelike').click(function(){

		$.ajax({
			url:"recipeboard.do?command=like&recipeBoard_no=${recipeBoardDto.recipeBoard_no }",	//전송할 경로
			method:"get",
			async:true,	
			dateType:"text",
			success:function(msg){
				if(msg == "nologin"){
					alert("로그인이 필요합니다.")
				}else{
					$('#favorite').text(msg);
				}
			}, error:function(request, error){
				alert("code:"+request.status+"\n"+"message:"+request.reponseText+"\n"+"error:"+error);
			}
		});				
	});
	
});

</script>
</head>
<body>
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp"%>
	</header>
	<section>
		<h1>selectOne</h1>

		<table class="boardtable">
			<tr>
				<th>제목</th>
				<td colspan="2">${recipeBoardDto.recipeBoard_title }</td>
				<th>조회수</th>
				<td colspan="1">${recipeBoardDto.recipeBoard_readCount }</td>
				<th>좋아요</th>
				<td id="favorite" style="width: 50px">${recipeBoardDto.recipeBoard_like }</td>
				<td><img src="/PreparedKitchen/image/hearts.png" id="recipelike"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="1">${recipeBoardDto.id }</td>
				<th>작성일</th>
				<td colspan="1">${recipeBoardDto.recipeBoard_regdate }</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: left;">${recipeBoardDto.recipeBoard_content }</td>
			</tr>
			<tr>
				<td colspan="3" id="button">
				<c:choose>
				<c:when test="${memberDto.id == recipeBoardDto.id }">
				<input type="button" value="수정" onclick="location.href='recipeboard.do?command=update&recipeBoard_no=${recipeBoardDto.recipeBoard_no}'" />
				<input type="button" value="삭제" onclick="location.href='recipeboard.do?command=delete&recipeBoard_no=${recipeBoardDto.recipeBoard_no}'" />
				<input type="button" value="목록" onclick="location.href='recipeboard.do?command=search&searchFiled=${paging.searchFiled}&searchValue=${paging.searchValue}'" />
				</c:when>
				<c:otherwise>
					<input type="button" value="목록" onclick="location.href='recipeboard.do?command=search&searchFiled=${paging.searchFiled}&searchValue=${paging.searchValue}'" />
				</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
	<%@ include file="recipecomment.jsp"%>
	</section>
	<%@ include file="static/remocon.jsp"%>
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp"%>
	</footer>
</body>
</html>