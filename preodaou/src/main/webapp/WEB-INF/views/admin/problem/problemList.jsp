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
	
	<link href="../resources/css/admin.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="../resources/js/admin.js"></script>
	
	<script type="text/javascript">

		function goDetail(problem_seq){
			$("#problem_seq").val(problem_seq);
			$("#listForm").attr("action", "problemDetail");
			$("#listForm").submit();
		}
		
		function goReg(){
			location.href="problemRegForm";
		}
		
		function goCtgList(){
			var popUrl = "categoryList";	//팝업창에 출력될 페이지 URL
			var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no, ,scrollbars=yes";    //팝업창 옵션(optoin)
			
			window.open(popUrl,"",popOption);
		}
		
		function goDel(){

			var chk = document.getElementsByName("del_check"); // 체크박스객체를 담는다
			var len = chk.length;    //체크박스의 전체 개수
			var checkRow ='';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0;        //체크된 체크박스의 개수
			var checkLast='';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid ='';             //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;                 

			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
					checkCnt++;        //체크된 체크박스의 개수
					checkLast = i;     //체크된 체크박스의 인덱스
				}
			} 

			for(var i=0; i<len; i++){
				if(chk[i].checked == true){  //체크가 되어있는 값 구분
					checkRow = chk[i].value;
	
				            
				if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
					rowid += ""+checkRow+"";        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
					if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
						rowid += ""+checkRow+"";  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{
						rowid += ""+checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
					}
				}

				cnt++;
				checkRow = '';    //checkRow초기화.
				}
			}
			
			if(rowid==''){
				alert("삭제할 요소가 선택되지 않았습니다."); 
			}else{
				$.ajax({
					type : "POST",
					url : "deleteChkProblem",
					data : {"rowid":rowid},
					async: false,
					success : function(data){
						if(data =="success"){
							alert("삭제되었습니다.");
							location.href = location.href;
						}else if(data =="error"){
							alert("삭제에 실패하였습니다. \n다시 시도해주세요.");
							return;
						}
					},error : function(data){
						alert("삭제 실패하였습니다. \n다시 시도해주세요.");
						return;
					}
				});
			}
		}
		
		function search(){ 
			$("#pageForm").attr("action", "problemList");
			$("#pageForm").submit();
		}
		

		  function allChk(obj){
		      var chkObj = document.getElementsByName("del_check");
		      var rowCnt = chkObj.length - 1;
		      var check = obj.checked;
		      if (check) {﻿
		          for (var i=0; i<=rowCnt; i++){
		           if(chkObj[i].type == "checkbox")
		               chkObj[i].checked = true; 
		          }
		      } else {
		          for (var i=0; i<=rowCnt; i++) {
		           if(chkObj[i].type == "checkbox"){
		               chkObj[i].checked = false; 
		           }
		          }
		      }
		  } 
		  
		  function goList(page_type){
			  
			 if(page_type == "problemList")
			 {
				location.href="problemList";  
			 }else if(page_type == 'employeeList')
			 {
				location.href="employeeList";  
			 }
			 else if(page_type == 'boardList')
			 {
				location.href="boardList";  
			 }
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
			  <h2><span class="span-font">문제리스트</span></h2>
			  <p><span class="span-font">풀어다우 서비스의 전체 문제 정보입니다.</span></p>     
		<%
		/*  // 검색기능
		
			 <form name="pageForm" id="pageForm" method="post" style="margin-bottom:25px;">
				 	 <label for="scType">문제 검색</label>
					 <select id="scType" name="scType" title="검색카테고리 선택" >
				        <option value=""></option>
				        <option value="problem" <c:if test="${scType == 'problem'}">selected</c:if>>문제</option>
				        <option value="category" <c:if test="${scType == 'category'}">selected</c:if>>카테고리</option>
					 </select>
					    
					 <input type="text" id="srch_input" name="srch_input" value="${srch_input}" title="검색어 입력"/>
					 <input type="button" onclick="search();" class="btn btn-info" value="검색"/>  
				</form>
		*/
		%>
			  
	
	       <form name="listForm" id="listForm" method="post">
		   <input type="hidden" name="problem_seq" id="problem_seq"/> 
			  <table class="table">
			    <thead>
			      <tr>
			        <th align="center"><input type="checkbox" id="allCheck" onclick="allChk(this);"/></th>
			        <th align="center">No.</th>
			        <th align="center" width="35%">문제내용</th>
			        <th><center>문제유형</center></th>
			        <th align="center"><center>카테고리</center></th>
			        <th><center>등록자</center></th>
			        <th><center>등록일</center></th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:if test="${!empty problemList}">
			      <c:forEach items="${problemList}" var="problemList" varStatus="status">
					<tr>
						<td><input type="checkbox" name="del_check" id="del_check" value="${problemList.problem_seq}"></td>
						<td align="left">${status.index+1}</td>
						<td><a href="#" onclick="goDetail('${problemList.problem_seq}');">${problemList.problem}</a></td>
						<td align="center">
							<c:if test="${problemList.type == 1}"><span style="color:red">O/X</span></c:if>
							<c:if test="${problemList.type == 2}"><span style="color:red">객관식</span></c:if>
						</td>
						<td align="center">
							<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
				   				<c:if test="${problemList.category_seq == categoryList.category_seq}"><span style="color:red">${categoryList.category_name} </span></c:if>
				    		</c:forEach> 
				    	</td>
						<td align="center">${problemList.reg_id}</td>
						<td align="center">${fn:substring(problemList.reg_date,0,10)}</td>
					</tr>
				 </c:forEach>
				</c:if>
				
				<c:if test="${empty problemList}">
					<tr>
						<td colspan="6"><center>등록된 문제 정보가 없습니다.</center></td>
					</tr>
				</c:if>
				
			    </tbody>
			   </table>
			</form>
			
			 <input type="button" value="카테고리 관리" onclick="goCtgList();" class="btn btn-default" />
			 <input type="button" value="삭제" onclick="goDel(); return false;" class="btn btn-default" style="float:right"/>
			 <input type="button" value="문제등록" onclick="goReg();" class="btn btn-default" style="float:right; margin-right:5px"/>
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