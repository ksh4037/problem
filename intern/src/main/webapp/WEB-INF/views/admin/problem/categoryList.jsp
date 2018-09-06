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
	
		function goDetail(category_seq){
			$("#category_seq").val(category_seq);
			document.clistForm.submit();
		}
		
		function goCtgRegForm(){
			location.href="categoryRegForm";
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
					url : "deleteChkCategory",
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
<form name="clistForm" id="clistForm" method="post" action="categoryDetail">
<input type="hidden" name="category_seq" id="category_seq"/>
<input type="hidden" name="caller" value="detail"/>
	<table border="1">
		<tr>
	 		<th><input type="checkbox" id="allCheck" onclick="allChk(this);"/></th>
	 		<th>No.</th>
	 		<th>카테고리명</th>
	 		<th>등록자</th>
	 		<th>등록일</th>
	 	</tr>
	<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
	    <tr>
	    	 <td><input type="checkbox" name="del_check" id="del_check" value="${categoryList.category_seq}"></td>
		     <td>${status.index+1}</td>
		     <td><a href="#" onclick="goDetail('${categoryList.category_seq}');">${categoryList.category_name}</a></td>
		     <td>${categoryList.reg_id}</td>
		     <td>${categoryList.reg_date}</td>
	    </tr>
	   </c:forEach>
	</table>

	<table border="1">
		<tr>
			<td><input type="button" value="카테고리 등록" onclick="goCtgRegForm();"/></td>
			<td><input type="button" value="삭제" onclick="goDel();"/></td>
		</tr>
	</table>
</form>
</body>
</html>