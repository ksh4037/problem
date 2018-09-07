<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<link href="../resources/css/admin.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	
		function goReg(){
			
			var queryString = $("form[name=cRegForm]").serialize();
			
			$.ajax({
				type : "POST",
				url : "categoryReg",
				data : queryString,
				async: false,
				success : function(data){
					if(data == "success"){
						alert("등록되었습니다.");
						location.href= "categoryList"; 
					}else if(data == "error"){
						alert("등록에 실패하였습니다.");
						return;
					}
				},error : function(data){
					alert("등록에 실패하였습니다.");
					return;
				}
			});
		}
		
		
		function goList(){
			location.href="categoryList";
		}
	</script>
</head>
<body>


<div class="container">
<h2 class="span-font">카테고리 등록 페이지</h2>
<p class="span-font">카테고리 등록 페이지 입니다.</p>   
  <form id="cRegForm" name="cRegForm">
	<table class="table table-hover">	  
		<tr>
			<td>
			  <div class="form-group">
			    <label for="inputdefault">카테고리명 </label>
			    <input type="text" class="form-control" id="category_name" placeholder="카테고리명을 입력해주세요." name="category_name" />
			  </div>
  			</td>
		</tr>
	</table>
	
	<table class="table table-hover">
		<tr>
			<td>
			   <input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float:right"/>
			   <input type="button" value="등록" onclick="goReg(); return false;" class="btn btn-default" style="float:right; margin-right:5px"/> 
			</td>
		</tr>
	</table>
   </form>
</div>
			
</body>
</html>