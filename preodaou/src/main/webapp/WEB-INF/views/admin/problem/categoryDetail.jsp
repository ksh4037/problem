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
		
	function goList(){
		location.href= "categoryList"; 
	}
	
	function goUpdtForm(){
		document.clistForm.submit();
	}
	
	function goDel(){
		if (confirm("정말 삭제하시겠습니까??") == true){    
			var queryString = $("form[name=clistForm]").serialize();
			
			$.ajax({
				type : "POST",
				url : "deleteCategory",
				data : queryString,
				async: false,
				success : function(data){
					if(data == "success"){
						alert("삭제되었습니다.");
						location.href= "categoryList"; 
					}else if(data == "error"){
						alert("삭제에 실패하였습니다.");
						return;
					}
				},error : function(data){
					alert("삭제에 실패하였습니다.");
					return;
				}
			});

		}else{   
		    return;
		}
	}
	
		
	</script>
</head>
<body>

<form name="clistForm" id="clistForm">
<input type="hidden" id="category_seq" name="category_seq" value="${categoryDetail.category_seq}">
<input type="hidden" name="caller" value="updt">
	
	<div class="container">
		  <h2 style="color:#5bc0de">문제 상세보기</h2>
		  <p class="span-font">상세보기 페이지 입니다.</p><br>    
		       
		  <table class="table">
		      <tr>
		        <td>카테고리명</td>
		        <td>${categoryDetail.category_name}</td>
		      </tr>
		      
		      <tr>
		        <td>등록자</td>
		        <td>
				    ${categoryDetail.reg_id}
		        </td>
		      </tr>
		      
		      <tr>
		        <td>등록일</td>
		        <td>
		           ${categoryDetail.reg_date}
		        </td>
		      </tr>   
		  </table>
		  
		  <div style="float:right">
		 	<input type="button" value="수정" onclick="goUpdtForm();" class="btn btn-primary"/>
			<input type="button" value="삭제" onclick="goDel();" class="btn btn-danger"/>
			<input type="button" value="취소" onclick="goList(); return false;" class="btn btn-default"/>
		  </div>
	</div>
</form>

</body>
</html>