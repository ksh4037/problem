<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

<form id="cRegForm" name="cRegForm">
	<table border="1">
		<tr>
			<td><input type="text" id="category_name" name="category_name"/></td>
			<td><input type="button" value="등록" onclick="goReg();"/></td>
			<td><input type="button" value="취소" onclick="goList();"/></td>
		</tr>
	</table>
</form>
</body>
</html>