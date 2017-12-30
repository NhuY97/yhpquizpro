<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Thi trắc nghiệm trực tuyến - Quiz Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>

<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="Welcome" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <input type="search" class="search" placeholder="Tìm kiếm..." title="Tìm tất cả">
        <div class="option">
            <div style="float:right"><span>Student: </span><a href="UserInfo" class="item2">${mapUser.get(sessionScope.username).getFullname()}</a><br></div>
            <div style="clear:both"></div>
            <div style="float:right">
            <a class="item1" href="ViewExam"> Danh sách kỳ thi</a>
            <a href="ViewResult" class="item1"> Xem điểm </a>
            <a href="#" class="item1"> Hướng dẫn</a>
            <a class="item1" href="Logout"> Đăng xuất</a>
            <a href="https://www.facebook.com/yzenny97" class="item1"> Liên hệ</a>
            </div>
        </div>
    </div>
</div>

<!--CONTAINER-->  
	<!--Slide ảnh-->
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height:260px; margin-top:70px;">
    <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
    
        <!-- Wrapper for slides -->
        <div class="carousel-inner" >
          <div class="item active">
            <img src="Images/bg1.jpg" alt="Quiz Professional" style="width:100%; height:360px;">
          </div>
    
          <div class="item">
            <img src="Images/bg2.jpg" alt="Quiz Professional" style="width:100%; height:360px;">
          </div>
        
          <div class="item">
            <img src="Images/bg5.jpg" alt="Quiz Professional" style="width:100%; height:360px;">
          </div>
        </div>
    
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
          <span class="sr-only">Next</span>
        </a>
	</div>
	<div class="mycontainer">
    <h1 class="header-text"><span><img src="Icons\new1.png" class="icon1"></span>Kỳ thi chưa thi</h1>
    <div class="session">
        <div class="trend-menu">
            <ul class="examlist">
            <c:forEach items="${requestScope.mapTopExam.values() }" var="ex">
                <li><a style="color:inherit" href="DoExamRedirects?id=${ex.getExamId() }" title='${ex.getExamName() }'>${ex.getExamName() }</a><span class="badge"><c:if test="${not empty ex.getTestId() }">${subjectDAO.getSubName(ex.getTestId()) }</c:if></span>
                <p style="font-size:small;font-family:courier;color:gray">
                <span title="Người tạo/cập nhật gần nhất" class="glyphicon glyphicon-user">
                ${mapUser.get(ex.getCreator()).getFullname() }</span>
                 <span style="margin-left:20px" title="Thời gian thi" class="glyphicon glyphicon-time">
                 ${ex.timeTest } phút |
                 <c:if test="${not empty ex.dateStart }"> ${sdf.format(ex.dateStart)}</c:if></span></p>
                </li>
            </c:forEach>
            </ul>
        </div>
        <div class="trend-create">
            <div class="pro-text"><marquee direction="up" height="550px" scrollamount="2">Với ngân hàng câu hỏi khổng lồ, những đề thi tổng hợp vô cùng hay và bổ ích, kỳ thi tổ chức vô cùng chặc chẽ, <strong>YHP Professional</strong> nhiều năm liền được bình chọn là Website Giáo dục hàng đầu Việt Nam và mang tầm cỡ thế giới. <br>Chúng tôi luôn nỗ lực hết mình Vì một Việt Nam tươi đẹp!
                <br><br><br><br><br><span style="color: #5D0C7B">With a huge question bank, incredibly good and useful quizzes, and extremely well organized exams, <strong>YHP Professional</strong> has been voted Education Website of Vietnam for many years. <br>We always try our best for a beautiful Vietnam!</span></marquee></div>
        </div>
    </div>
</div>
<!--FOOTER-->
<footer>
    <p style="text-align: center;margin-top: 10px"><span><img src="Icons/fb.png" class="icon2"></span>Design by <a href="https://www.facebook.com/yzenny97" title="Trần Nguyễn Thanh Như Ý" target="_blank">YZenny</a></p>
</footer>
<!--end page-->
<div class="end"></div>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="Exam_MainPage.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
