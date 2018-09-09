<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="col-sm-4 sidenav">
   <div align="center">
	<a href="#" onclick="goList('problemList');"><img src="../resources/img/logo4.png" width="80%" style="padding-top:20px; float:center"/></a>
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

