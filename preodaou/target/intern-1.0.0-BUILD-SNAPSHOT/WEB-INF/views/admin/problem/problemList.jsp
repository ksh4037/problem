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
		function goDetail(problem_seq){
			$("#problem_seq").val(problem_seq);
			document.listForm.submit();
		}
		
		function goReg(){
			location.href="admin/problemRegForm";
		}
	</script>
</head>
<body>

<form name="listForm" method="post" action="admin/problemDetail">
	<input type="hidden" id="problem_seq" name="problem_seq">
	<table border="1">
	<c:forEach items="${problemList}" var="problemList" varStatus="status">
	    <tr onclick="goDetail('${problemList.problem_seq}');">
		     <td>${status.index+1}</td>
		     <td>${problemList.problem_seq}</td>
		     <td>${problemList.problem}</td>
		     <td>${problemList.type}</td>
		     <td>${problemList.reg_id}</td>
		     <td><c:if test="${problemList.delete_yn=='N'}"><span style="color:red">안지워짐</span></c:if></td>
		     <td>${problemList.reg_date}</td>
	    </tr>
	   </c:forEach>
	</table>

	<table border="1">
		<tr>
			<td><input type="button" value="문제등록" onclick="goReg();"/></td>
			<td><input type="button" value="카테고리 등록"/></td>
			<td><input type="button" value="삭제"/></td>
		</tr>
	</table>
</form>
</body>
</html>