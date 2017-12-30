<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Điểm cá nhân - Quiz Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
</head>

<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="Welcome" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <input type="search" class="search" placeholder="Tìm kiếm..." title="Tìm tất cả">
        <div class="option">
            <span>Student: </span><a href="UserInfo" class="item2">${mapUser.get(sessionScope.username).getFullname()}</a><br>
            <a href="#" class="item1"><span><img src="Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a class="item1" href="Logout"><span><img src="Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="https://www.facebook.com/yzenny97" class="item1"> <span><img src="Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>

<!--CONTAINER-->  
	<div class="mycontainer">
    <div class="session">
<table id="datatable" class="table table-striped table-bordered">
<thead>
<tr><th>Tên kỳ thi</th><th>Môn học</th><th>Điểm</th><th>Thời gian hoàn thành</th><th>Ngày thi</th></tr>
</thead>
<tbody>
<c:forEach items="${mapResult.keySet()}" var="exID">
<tr><td>${mapResult.get(exID).examname }</td>
<td>
<c:set var="ex" value="${mapExam.get(exID) }" />
<c:set var="s" value="${testDAO.getSubject(mapTest.get(ex.testId)) }" />
${s.subName }</td>
<td>${mapResult.get(exID).mark}</td>
<td><fmt:formatNumber value="${mapResult.get(exID).timeFinish/60}" maxFractionDigits="0"/> <strong>phút </strong>
<fmt:formatNumber value="${mapResult.get(exID).timeFinish%60}" maxFractionDigits="0"/> <strong >giây</strong>
</td>
<td><c:if test="${not empty mapResult.get(exID).dateTest }">${sdf.format(mapResult.get(exID).dateTest)}</c:if></td>
</c:forEach>
</tbody>
</table>
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
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
$('#datatable').DataTable();
</script>
</body>
</html>
