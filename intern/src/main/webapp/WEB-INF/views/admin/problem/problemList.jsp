<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #87ceeb ;
      height: 100%;
    }
    
    /*#87ceeb   #7683ac*/
    
    .active_1 {
      background-color: #ffffff  ;
      border-radius:4px;
    }
    
    .s_title {
      height:90px;
    }
    
    .col-sm-4{
    width:18%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-4 sidenav">
      <h4>관리자 메뉴</h4>
      <br><br>
      <ul class="nav nav-pills nav-stacked">
        <li class="active_1"><a href="#section1">문제관리</a></li>
        <li><a href="#section2">문제출제</a></li>
        <li><a href="#section3">회원관리</a></li>
        <li><a href="#section3">기록관리</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9">
      <h4 class="s_title">문제관리</h4>
      <hr>
      <h2>문제리스트</h2>
  	</div>
</div>
</div>

<footer class="container-fluid">
  <p>다우기술 인턴사원 프로젝트</p>
  <p>푸러다우</p>
</footer>

</body>
</html>
