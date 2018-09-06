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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script type="text/javascript">
	function goList(){
		location.href="problemList"; 
	}
	
	function goUpdtForm(){
		$("#detailKeyInfo").attr("action", "problemUpdtForm");
		$("#detailKeyInfo").submit();
	}
	
	function goDelete() {
	
		if (confirm("정말 삭제하시겠습니까??") == true){    
			var queryString = $("form[name=detailKeyInfo]").serialize();
			
			$.ajax({
				type : "POST",
				url : "deleteProblem",
				data : queryString,
				async: false,
				success : function(data){
					if(data == "success"){
						alert("삭제되었습니다.");
						location.href= "problemList"; 
					}else if(data == "error"){
						alert("삭제에 실패하였습니다. \n다시 시도해주세요.");
						return;
					}
				},error : function(data){
					alert("삭제에 실패하였습니다. \n다시 시도해주세요.");
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

	<form name="detailKeyInfo" id="detailKeyInfo" method="post">
		<input type="hidden" name="problem_seq" value="${problemDetail.problem_seq}"/>
	</form>

	<table border="1">
	    <tr>
		     <td>
		     	문제 : ${problemDetail.problem}
		     </td>
		     
		     <td>
		     	<c:if test="${problemDetail.type == 1}"><span style="color:red">O/X</span></c:if>
		     	<c:if test="${problemDetail.type == 2}"><span style="color:red">객관식</span></c:if>
		     </td>
		     
		     <td>${problemDetail.reg_id}</td>
		     <td>${problemDetail.reg_date}</td>
	    </tr>
	</table>
	
	<table border="1">
	    <tr>
			<c:if test="${problemDetail.type == 1}">
				<td>
					<c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
				     	<input type="radio" name="type" <c:if test="${optionDetail.option_contents == 'O' }">checked</c:if> disabled/> O
				     	<input type="radio" name="type" <c:if test="${optionDetail.option_contents == 'X' }">checked</c:if> disabled/> X
				     </c:forEach>
				</td>
			</c:if>
			     
			<c:if test="${problemDetail.type == 2}">
				    <c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
					    <tr>
					     	<td>
					     		보기 : <input type="text" name="type" value="${optionDetail.option_contents}" disabled/>
					     	</td>
					     </tr>
				    </c:forEach>
			</c:if>
	    </tr>
	</table>
	
	<table border="1">
		<tr>
		     <td><input type="button" value="수정" onclick="goUpdtForm()"></td>
		     <td><input type="button" value="삭제" onclick="goDelete()"></td>
		     <td><input type="button" value="취소"  onclick="goList()"></td>
	    </tr>
	</table>
</body>
</html>