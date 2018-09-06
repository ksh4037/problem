<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<table border="1">
	    <tr>
		     <td>${problemDetail.problem_seq}</td>
		     <td>${problemDetail.problem}</td>
		     <td>${problemDetail.type}</td>
		     <td>${problemDetail.reg_id}</td>
		     <td>${problemDetail.delete_yn}</td>
		     <td>${problemDetail.reg_date}</td>
	    </tr>
	</table>
	
	<table border="1">
		<tr>
		     <td><input type="button" value="수정"></td>
		     <td><input type="button" value="삭제"></td>
		     <td><input type="reset" value="취소"></td>
	    </tr>
	</table>
</body>
</html>