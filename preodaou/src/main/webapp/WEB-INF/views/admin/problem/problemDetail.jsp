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
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript" src="../resources/js/admin.js"></script>
		
	<link href="../resources/css/admin.css" rel="stylesheet" type="text/css">
	
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
		  <h2 class="span-font">문제 상세보기</h2>
		  <p class="span-font">상세보기 페이지 입니다.</p><br>         
		  <table class="table">
		      <tr>
		        <td>문제</td>
		        <td>${problemDetail.problem}</td>
		      </tr>
		      
		      <tr>
		        <td>문제유형</td>
		        <td>
				    <c:if test="${problemDetail.type == 1}"><span style="color:red">O/X </span></c:if>
				    <c:if test="${problemDetail.type == 2}"><span style="color:red">객관식</span></c:if> 
		        </td>
		      </tr>
		      
		      <tr>
		        <td>문제유형</td>
		        <td>
		        	<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
				   		<c:if test="${problemDetail.category_seq == categoryList.category_seq}"><span style="color:red">${categoryList.category_name} </span></c:if>
				    </c:forEach> 
		        </td>
		      </tr>
		      
		      <c:if test="${problemDetail.type == 1}">
		        <tr>
		        <td>보기</td>
				<td> 
					<c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
					    <input type="radio" name="type" <c:if test="${optionDetail.option_contents == 'O' }">checked</c:if> disabled/> O
					    <input type="radio" name="type" <c:if test="${optionDetail.option_contents == 'X' }">checked</c:if> disabled/> X
					</c:forEach>
				</td>
				</tr>
			  </c:if>
				 
			  <c:if test="${problemDetail.type == 2}">
					<c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
					  <c:if test="${status.index+1 == 1}">
						<tr> <td>정답</td> <td><span>${optionDetail.option_contents}</span></td></tr>
					  </c:if>
					  <c:if test="${status.index+1 != 1}">
					  	<tr><td>보기</td> <td><span>${optionDetail.option_contents}</span></td></tr>
					  </c:if>
					</c:forEach>
		      </c:if>
		      
		      <tr>
		        <td>작성자</td>
		        <td>
				    ${problemDetail.reg_id}
		        </td>
		      </tr>
		      <tr>
		        <td>작성일자</td>
		        <td>
				    ${fn:substring(problemDetail.reg_date,0,16)}
		        </td>
		      </tr>    
		  </table>
		  
		  <div style="float:right">
		  	<input type="button" value="수정" onclick="goUpdtForm()"  class="btn btn-primary">
			<input type="button" value="삭제" onclick="goDelete()"  class="btn btn-danger">
			<input type="button" value="취소"  onclick="goList()"  class="btn btn-default">
		  </div>
		</div>
	</div>
	
  </div>
</div>

<footer class="container-fluid">
  <p>개인정보처리방침 | 개인정보무단수집거부 | 이메일주소무단수집거부 | 윤리경영우)16878 경기도 용인시 수지구 디지털벨리로 81 다우디지털스퀘어 6층   대표전화 : 070-8707-1000   사업자등록번호 : 220-81-02810   대표이사: 김윤덕ⓒ 2018 DAOU Tech., INC. All rights reserved. </p>
  <p>다우기술 인턴 과제 : 풀어다우</p>
</footer>


</body>
</html>