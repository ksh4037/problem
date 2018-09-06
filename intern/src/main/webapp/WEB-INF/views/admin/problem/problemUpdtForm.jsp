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
	// 문항추가버튼 클릭시
	function addOption() {
		var cell='';
		cell += '<tr><td> 보기 : <input type="text" id="option_contents" name="option_contents"/></td></tr>';
		$("#option").append(cell);
			
	}

	
	// 취소 삭제버튼 클릭시
	function delOption() {
		
		mytable = document.getElementById('option');
		
		if(mytable.rows.length <= 4){
			alert("객관식 문항은 최소 4개 이상 이어야 합니다.");
		}
		
		if (mytable.rows.length < 5)
			return;
		mytable.deleteRow(mytable.rows.length - 1);
	}

	function goUpdt(form_type){

		if(form_type == 'choice'){

			var queryString = $("form[name=ch_writeForm]").serialize();
			
			var option_contents = new Array();
			
			for(var i = 0 ; i<document.getElementsByName('option_contents').length; i++){
				option_contents[i] = document.getElementsByName('option_contents')[i].value;
			}
			
			$.ajax({
				type : "POST",
				url : "problemUpdt",
				data : queryString,
				async: false,
				success : function(data){
					if(data == "success"){
						alert("수정되었습니다.");
						location.href= "problemList"; 
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
		
		if(form_type == 'ox'){
			
			var queryString = $("form[name=ox_writeForm]").serialize();
			
			$.ajax({
				type : "POST",
				url : "problemUpdt",
				data : queryString,
				async: false,
				success : function(data){
					alert("수정되었습니다.");
					location.href= "problemList"; 
					
				},error : function(data){
					alert("수정에 실패하였습니다.");
				}
			});
			
		}
	  }
	
	function goList(){
		location.href="problemList";
	}
</script>	
</head>
<body>

	<table>
		<tr>
			<td>
				문제유형 : 
				<c:if test="${problemDetail.type == '1' }"><span style="color:red">O/X 유형</span></c:if> 
				<c:if test="${problemDetail.type == '2' }"><span style="color:red">객관식 유형</span></c:if> 
			</td>
		</tr>
	</table>
	
	<c:if test="${problemDetail.type == '1' }">
	  <form name="ox_writeForm" id="ox_writeForm" method="post">
		<input type="hidden" name="problem_seq" value="${problemDetail.problem_seq}"/>
		<input type="hidden" name="type" value="1"/>
			 <table>
			 	<tr>
			        <td>문제 : </td>
		        </tr>
				<tr>
			        <td><textarea id="problem" name="problem">${problemDetail.problem} </textarea></td>
		        </tr>
		    </table>
		    
			<table>
		        <tr>
		        	<td>
		        		<c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
			        		<input type="radio" value="O" name="option_contents" <c:if test="${optionDetail.option_contents == 'O' }">checked</c:if>/>O
			        		<input type="radio" value="X" name="option_contents" <c:if test="${optionDetail.option_contents == 'X' }">checked</c:if>/>X
			        	</c:forEach>
					</td>
				</tr>
				<tr>	
					<td>	     	
		        		<input type="button" value="등록" onclick="goUpdt('ox'); return false;"/>
						<input type="button" value="취소" onclick="goList();"/>
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	
	
	
	<c:if test="${problemDetail.type == '2' }">
		<form name="ch_writeForm" id="ch_writeForm" method="post">
		<input type="hidden" name="problem_seq" value="${problemDetail.problem_seq}"/>
		<input type="hidden" name="type" value="2"/>
			<table>
		        <tr>
		        	<td>
		        		<a href="javascript:void(0);" onclick="addOption();">문항추가</a> 
						<a href="javascript:void(0);" onclick="delOption();">문항삭제</a>
					</td>
				</tr>
			</table>
			
			 <table>
				<tr>
			        <td><textarea id="problem" name="problem"> ${problemDetail.problem} </textarea></td>
		        </tr>
		    </table>
		    
		    <table id="option">
				<c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
					<c:if test="${optionDetail.answer_yn == 'Y' }">
						<tr>
							<td>
						     	정답 : <input type="text" id="option_contents" name="option_contents" value="${optionDetail.option_contents}"/>
						    </td>
						</tr>
					</c:if>
					
					<c:if test="${optionDetail.answer_yn == 'N' }">
						 <tr>
						     <td>
						     	보기 : <input type="text" id="option_contents" name="option_contents" value="${optionDetail.option_contents}"/>
						     </td>
						 </tr>
					</c:if>
				</c:forEach>
		    </table>
		    
		    <table border="1">
				<tr>
					
					<td>
						<input type="button" value="수정" onclick="goUpdt('choice'); return false;"/>
						<input type="button" value="취소" onclick="goList();"/>
					</td>
				</tr>
			</table>
		</form>
	
	</c:if> 

</body>
</html>