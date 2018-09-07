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
			$("#listForm").attr("action", "problemDetail");
			$("#listForm").submit();
		}
		
		function goReg(){
			location.href="problemRegForm";
		}
		
		function goCtgList(){
			var popUrl = "categoryList";	//팝업창에 출력될 페이지 URL
			var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			
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


	</script>
</head>
<body>

<form name="pageForm" id="pageForm" method="post">
 	<label for="scType" class="hide">검색카테고리 선택</label>
	 <select id="scType" name="scType" title="검색카테고리 선택" >
        <option value=""></option>
        <option value="problem" <c:if test= "${scType == 'problem'}">selected</c:if>>문제</option>
        <option value="category" <c:if test="${scType == 'category'}">selected</c:if>>카테고리</option>
	 </select>
	    
     <label for="srch_input" class="hide">검색어 입력</label>
	 <input type="text" id="srch_input" name="srch_input" value="${srch_input}" title="검색어 입력"/>
	 <input type="button" onclick="search();" value="검색"/>  
</form>




<form name="listForm" id="listForm" method="post">
	 <input type="hidden" name="problem_seq" id="problem_seq"/>    
	 <table border="1">
	 		<tr>
	 			<th><input type="checkbox" id="allCheck" onclick="allChk(this);"/></th>
	 			<th>No.</th>
	 			<th>문제내용</th>
	 			<th>문제유형</th>
	 			<th>등록자</th>
	 			<th>등록일</th>
	 		</tr>
	 	<c:forEach items="${problemList}" var="problemList" varStatus="status">
		    <tr>
		    	 <td><input type="checkbox" name="del_check" id="del_check" value="${problemList.problem_seq}"></td>
			     <td>${status.index+1}</td>
			     <td><a href="#" onclick="goDetail('${problemList.problem_seq}');">${problemList.problem}</a></td>
			     <td>
			     	<c:if test="${problemList.type == 1}"><span style="color:red">O/X</span></c:if>
			     	<c:if test="${problemList.type == 2}"><span style="color:red">객관식</span></c:if>
			     </td>
			     <td>${problemList.reg_id}</td>
			     <td>${problemList.reg_date}</td>
		    </tr>
	   </c:forEach>
	</table>

	<table border="1">
		<tr>
			<td><input type="button" value="문제등록" onclick="goReg();"/></td>
			<td><input type="button" value="카테고리 등록" onclick="goCtgList();"/></td>
			<td><input type="button" value="삭제" onclick="goDel(); return false;"/></td>
		</tr>
	</table>
</form>
</body>
</html>