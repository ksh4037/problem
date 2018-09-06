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
		
	function goList(){
		location.href= "categoryList"; 
	}
	
	function goUpdt(){
		var queryString = $("form[name=clistForm]").serialize();
		
		$.ajax({
			type : "POST",
			url : "categoryUpdt",
			data : queryString,
			async: false,
			success : function(data){
				if(data=="success"){
					alert("수정되었습니다.");
					location.href= "categoryList"; 
				}else if(data == "error"){
					alert("수정에 실패하였습니다.");
					return;
				}
			},error : function(data){
				alert("수정에 실패하였습니다.");
				return;
			}
		});
		
	}
		
	</script>
</head>
<body>

<form name="clistForm" method="post" action="catgoryUpdt">
	<input type="hidden" id="category_seq" name="category_seq" value="${categoryDetail.category_seq}">
	<table border="1">
	    <tr>
		     <td>카테고리 이름 : <input type="text" id="category_name" name="category_name" value="${categoryDetail.category_name}"/></td>
	    </tr>
	</table>

	<table border="1">
		<tr>
			<td><input type="button" value="수정" onclick="goUpdt();"/></td>
			<td><input type="button" value="취소" onclick="goList();"/></td>
		</tr>
	</table>
</form>
</body>
</html>