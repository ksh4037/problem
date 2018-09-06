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
	<table border="1">
	    <tr>
		   <td>${categoryDetail.category_name}</td>
		   <td>${categoryDetail.reg_id}</td>
		   <td>${categoryDetail.reg_date}</td>
	    </tr>
	</table>

	<table border="1">
		<tr>
			<td><input type="button" value="수정" onclick="goUpdtForm();"/></td>
			<td><input type="button" value="삭제" onclick="goDel();"/></td>
			<td><input type="button" value="취소" onclick="goList(); return false;"/></td>
		</tr>
	</table>
</form>
</body>
</html>