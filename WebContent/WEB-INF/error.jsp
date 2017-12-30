<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- check login -->
<c:if test="${empty sessionScope.username }">
<c:redirect url="Welcome" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Error - Quiz Professional</title>
<link rel="stylesheet" href="Exam_MainPage.css">
<link rel="stylesheet" href="../Exam_MainPage.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
</head>
<body>
<div style="width:80%;margin:auto;text-align:center">
<h2>Oops! Dường như đã xảy ra lỗi, nhấn <a href="Welcome">vào đây</a> để trở lại trang chủ</h2>
<div style="font-family:courier;color:red">
<strong>Message: ${message }</strong>
</div>
<h3>Trang tự động trở về sau <strong id="count"></strong> giây</h3><br/>
<a href="https://www.facebook.com/groups/1442181119152026">Liên hệ với chúng tôi</a>
</div>
<script type="text/javascript" src="../jquery.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="Exam_MainPage.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
var count = 15;
$("#count").html(count);
var countDown = setInterval(function(){
	$("#count").html(count);
	count--;
	if(count==0){
		history.back();
	}
},1000);
</script>
</body>
</html>