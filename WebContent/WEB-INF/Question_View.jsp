<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Questions - YHP Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
</head>
<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="Welcome" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <div class="option">
            <span>Question Manager: </span><a href="#" class="item2">${mapUser.get(username).getFullname() }</a><br>
            <a href="#" class="item1"><span><img src="Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a href="Logout" id="SignOut" class="item1"><span><img src="Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="https://www.facebook.com/yzenny97" class="item1"> <span><img src="Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>
<!-- Container -->
<div class="mycontainer">
<div class="session" style="overflow:hidden">
<div class="dataShow" style="margin:auto;width:100%">
<table id="datatable" class="table table-striped table-bordered">
<thead>
<tr><th>Mã câu hỏi</th><th>Tên câu hỏi</th><th>Nội dung câu hỏi</th><th>Ngày tạo</th><th>Người tạo</th><th>Thao tác</th></tr>
</thead>
<tbody>
<c:forEach var="q" items="${mapQues.values() }">
<tr><td>${q.questionId }</td><td>${q.questionName }</td><td>${mapContent.get(q.contentId).getContentName() }</td><td>${sdf.format(q.dateCreate) }</td><td>${mapUser.get(q.creator).getFullname() }</td>
<td><a href="DeleteQuestion?id=${q.questionId }"><span class="glyphicon glyphicon-remove" style="padding-left:5px;color:red;cursor:pointer;opacity:0.7">Xóa</span></a>
<a href="DetailQuestion?id=${q.questionId }"><span class="glyphicon glyphicon-pencil" style="padding-left:8px;color:orange;cursor:pointer">Chi tiết</span></a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
<!--footer-->
<footer>
    <p style="text-align: center;margin-top:20px;"><span><img src="Icons/fb.png" class="icon2"></span>Design by <a href="https://www.facebook.com/yzenny97" title="Trần Nguyễn Thanh Như Ý" target="_blank">YZenny</a></p>
</footer>
</div>
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