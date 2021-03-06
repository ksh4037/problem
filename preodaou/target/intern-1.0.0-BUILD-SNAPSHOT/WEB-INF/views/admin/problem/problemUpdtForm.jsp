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
		cell += '<tr><td> 보기 : <input type="text" id="optionContents" name="optionContents"/></td></tr>';
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
	
	
	function typeChange(type){

		if(type=='1'){
			
			document.ch_writeForm.reset();

			$("#ch_writeForm").css('display','none'); 
			$("#ox_writeForm").css('display','block'); 
		}
		
		if(type=='2'){
		
			document.ox_writeForm.reset();
			
			$("#ox_writeForm").css('display','none'); 
			$("#ch_writeForm").css('display','block'); 
		}
	}


	</script>
	
</head>
<body>

	<table>
		<tr>
			<td>
				문제유형을 선택해주세요.
			</td>
		</tr>
		<tr>
			<td>
				<input type="radio" value="2" id="type" name="type" onclick="typeChange('2');"/>객관식
				<input type="radio" value="1" id="type" name="type" onclick="typeChange('1');"/>O/X
			</td>
		</tr>
	</table>
	
	
	<form name="ox_writeForm" id="ox_writeForm" method="post" action="admin/problemReg" style="display:none">
	
		 <table>
		 	<tr>
		        <td>문제 : </td>
	        </tr>
			<tr>
		        <td><textarea> </textarea></td>
	        </tr>
	    </table>
	    
	    
		<table>
	        <tr>
	        	<td>
	        		<input type="radio" value="O"/>O
	        		<input type="radio" value="X"/>X
				</td>
			</tr>
		</table>
	</form>
	
	<form name="ch_writeForm" id="ch_writeForm" method="post" action="admin/problemReg" style="display:none">
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
		        <td><textarea> </textarea></td>
	        </tr>
	    </table>
	    
	    <table id="option">
			<tr>
		        <td>정답 : <input type="text" id="answerContents" name="answerContents" /></td>
	        </tr>
	        <tr>
		        <td>보기 : <input type="text" id="optionContents" name="optionContents" /></td>
	        </tr>
	        <tr>
		        <td>보기 : <input type="text" id="optionContents" name="optionContents" /></td>
	        </tr>
	        <tr>
		        <td>보기 : <input type="text" id="optionContents" name="optionContents" /></td>
	        </tr>
	    </table>
	</form>
	
	
	<form>
		<table border="1">
			<tr>
				<td><input type="button" value="등록" onclick="goReg();"/></td>
				<td><input type="reset" value="취소"/></td>
			</tr>
		</table>
	</form>

</body>
</html>