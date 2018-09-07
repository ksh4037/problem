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
		<script type="text/javascript" src="../resources/js/admin.js"></script>
		
	<link href="../resources/css/admin.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
	
	
	// 문항추가버튼 클릭시
	function addOption() {
		var cell='';
		cell += '<tr><td width="60px"> 보기 : </td><td><input type="text" class="form-control" id="option_contents" name="option_contents" /></td></tr>';
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
	

	function goReg(){
		
		var input_check = goInputCheck();
		
		if(input_check == true){
			
			if($("#ch_writeForm").css('display') == 'block'){
				
				var queryString = $("form[name=ch_writeForm]").serialize();
				var option_contents = new Array();
					
				for(var i = 0 ; i<document.getElementsByName('option_contents').length; i++){
					option_contents[i] = document.getElementsByName('option_contents')[i].value;
				}
					
				$.ajax({
					type : "POST",
					url : "problemReg",
					data : queryString,
					async: false,
					success : function(data){
						if(data == "success"){
							alert("등록되었습니다.");
							location.href= "problemList"; 
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
				
			if($("#ox_writeForm").css('display') == 'block'){
					
				var queryString = $("form[name=ox_writeForm]").serialize();
					
				$.ajax({
					type : "POST",
					url : "problemReg",
					data : queryString,
					async: false,
					success : function(data){
						if(data == "success"){
							alert("등록되었습니다.");
							location.href= "problemList"; 
						}else if(data == "error"){
							alert("등록에 실패하였습니다.");
							return;
						}
					},error : function(data){
						alert("등록에 실패하였습니다.");
					}
				});
			}
		}else{
			return;
		}
	}
	
	function goList(){
		location.href="problemList";
	}
	
	
	function goInputCheck(){
		
		var input_check = true;
		
		if($("#ch_writeForm").css('display') == 'block'){
			
			if($('#ch_writeForm [name="problem"]').val().trim() == ""){
				alert("문제가 입력되지 않았습니다.");
				input_check = false;
			}
			
			if(input_check == true){
				if($('#ch_writeForm [name="category_seq"]').val() == ''){
					alert("카테고리가 선택되지 않았습니다.");
					input_check = false;
					return input_check;
				}
			}
			
			if(input_check == true){
				for(var i = 0; i < $('#ch_writeForm [name="option_contents"]').length; i++){
					if($('#ch_writeForm [name="option_contents"]')[i].value == ''){
						alert((i+1)+"번째 보기가 입력되지 않았습니다.");
						input_check = false;
						return input_check;
					}
				}
		    }
			
		}
		
		else if($("#ox_writeForm").css('display') == 'block'){
			
			if($('#ox_writeForm [name="problem"]').val().trim() == ""){
				alert("문제가 입력되지 않았습니다.");
				input_check = false;
			}
			
			if(input_check == true){
				if($('#ox_writeForm [name="category_seq"]').val() == ''){
					alert("카테고리가 선택되지 않았습니다.");
					input_check = false;
					return input_check;
				}
			}
			
			if(input_check == true){
				if($(':radio[name="option_contents"]:checked').length < 1){
				    alert('O/X 정답을 선택해주세요');                        
				    input_check = false;
				    return input_check;
				}
		     }
			
		 }
		
		return input_check;
	}
	
</script>	
</head>
<body>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-4 sidenav">
      <div align="center">
		<img src="../resources/img/logo4.png" width="235px" style="padding-top: 20px; float:center"/>
      </div>
      <br>
      <hr style="height:2px; background-color:white">
      <ul class="nav nav-pills nav-stacked">
        <li><a href="#" onclick="goList('problemList');" id="problem_li">문제관리</a>
        	
        </li>
        
        <li><a href="#" id="exam_li">문제출제</a>
        
        </li>
        <li><a href="#" onclick="goList('employeeList');" id="member_li">회원관리</a>
        
        </li>
        <li><a href="#" id="write_li">기록관리</a>
        
        </li>
        <li><a href="#" onclick="goList('boardList');" id="board_li">게시판관리</a>
        
        </li>
      </ul><br>
    </div>





	<div class="col-sm-9">
      <h4 class="s_title" style="padding-top:25px; padding-bottom:15px"><span class="span-font">Home > 문제관리</span></h4>
      <hr><br>
      
		<div class="container">
			<span style="color:red">문제유형을 선택해주세요.</span><br><br>
			<input type="radio" name="p_type" onclick="typeChange('2');" > 객관식 &nbsp;&nbsp;&nbsp;
			<input type="radio" name="p_type" onclick="typeChange('1');" > O/X
		</div>

		<form name="ox_writeForm" id="ox_writeForm" method="post" style="display:none">
		<input type="hidden" name="type"  value="1"/>
			<div class="container">
			  <h2 class="span-font">O/X 문제 등록 페이지</h2>
			  <p class="span-font">풀어다우 O/X 문제 등록 페이지 입니다.</p>   
	   
			  <table class="table table-hover">
			  
			      <tr>
			      	  <td>문제</td>
				      <td><textarea id="problem" class="form-control" name="problem" rows="20" cols="200"> </textarea></td>
			      </tr>
			      
			      <tr>
			      	  <td>카테고리</td>
				      <td>
						<c:if test="${!empty categoryList}">
							<select name="category_seq" id="category_seq" class="form-control" style="width:200px;height:30px;">
							<option value="">카테고리 선택</option>
								<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
								   <option value="${categoryList.category_seq}">${categoryList.category_name}</option>
							   </c:forEach>
							</select>
					    </c:if>
					    
					    <c:if test="${empty categoryList}">
							<select name="category_seq" id="category_seq" class="form-control" style="width:200px;height:30px;">
								<option value="">카테고리 정보가 없습니다.<option>
							</select>
						</c:if>
				      </td>
			      </tr>
			      
			      <tr>
			        <td>정답</td>
			        <td>
			           	<input type="radio" value="O" name="option_contents"/> O 
			  			<input type="radio" value="X" name="option_contents"/> X 
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
			</div>
		</form>

	 
		<form name="ch_writeForm" id="ch_writeForm" method="post" style="display:none">
		<input type="hidden" name="type"  value="2"/>
			<div class="container">
			  <h2 class="span-font">객관식 문제 등록 페이지</h2>
			  <p class="span-font">풀어다우 객관식 문제 등록 페이지 입니다.</p>   
			  
			  
			  <table class="table table-hover">
			  	  <tr>
			  	  	<td colspan="2">
			  	  		<a href="javascript:void(0);" onclick="delOption();" class="btn btn-info" style="float:right">보기삭제</a>
				  	  	<a href="javascript:void(0);" onclick="addOption();" class="btn btn-info" style="float:right;margin-right:5px">보기추가</a>
					</td>
			  	  </tr>
			      <tr>
			        <td>문제</td>
			        <td><textarea id="problem" name="problem" class="form-control" rows="20" cols="200"> </textarea></td>
			      </tr>
			      
			      <tr>
			      	  <td>카테고리</td>
				      <td>
						<c:if test="${!empty categoryList}">
							<select name="category_seq" id="category_seq" class="form-control" style="width:200px;height:30px;">
							<option value="">카테고리 선택</option>
								<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
								   <option value="${categoryList.category_seq}">${categoryList.category_name}</option>
							   </c:forEach>
							</select>
					    </c:if>
					    
					    <c:if test="${empty categoryList}">
							<select name="category_seq" id="category_seq" class="form-control" style="width:200px;height:30px;">
								<option value="">카테고리 정보가 없습니다.<option>
							</select>
						</c:if>
				      </td>
			      </tr>
			      
			  </table>
			  
			  <table id="option" class="table table-hover">
			      <tr>
				      <td width="60px">정답 :</td><td> <input type="text" class="form-control" id="option_contents" name="option_contents" /></td>
			      </tr>
			      <tr>
				      <td width="60px">보기 : </td><td><input type="text" class="form-control" id="option_contents" name="option_contents" /></td>
			      </tr>
			      <tr>
				      <td width="60px">보기 : </td><td><input type="text" class="form-control" id="option_contents" name="option_contents" /></td>
			      </tr>
			      <tr>
				     <td width="60px">보기 : </td><td><input type="text" class="form-control" id="option_contents" name="option_contents" /></td>
			      </tr>
			  </table>
			  
			  <table class="table table-hover">
			  	  <tr>
			        <td>
			        	<input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float:right"/>
						<input type="button" value="등록" onclick="goReg(); return false;" class="btn btn-default" style="float:right; margin-right:5px"/> &nbsp;&nbsp;
					</td>
			      </tr>
			 </table>
			</div>
		</form>

  </div>
 </div>
</div>

<footer class="container-fluid">
  <p>개인정보처리방침 | 개인정보무단수집거부 | 이메일주소무단수집거부 | 윤리경영우)16878 경기도 용인시 수지구 디지털벨리로 81 다우디지털스퀘어 6층   대표전화 : 070-8707-1000   사업자등록번호 : 220-81-02810   대표이사: 김윤덕ⓒ 2018 DAOU Tech., INC. All rights reserved. </p>
  <p>다우기술 인턴 과제 : 풀어다우</p>
</footer>


</body>
</html>