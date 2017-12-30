<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thông tin cá nhân - YHP Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
</head>
<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="#home" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="..\Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <div class="option">
            <span>Exam Manager: </span><a href="#" class="item2">Trần Nguyễn Thanh Như Ý</a><br>
            <a href="#" class="item1"><span><img src="..\Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a id="SignOut" class="item1"><span><img src="..\Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="#about" class="item1"> <span><img src="..\Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>
<!--Container-->
<div class="mycontainer">
    <div class="session">
        <div class="col-xs-2" style="background-color: transparent;height: 210px">
            <img src="..\Images\avt.jpg" style="width: 100%;height: 200px">
        </div>
        <div class="col-lg-9 info" style="margin-left: 20px;padding: 30px">
            <table style="width: 90%" class="table table-responsive">
                <tr><td>FullName:</td><td>Trần Nguyễn Thanh Như Ý</td></tr>
                <tr><td>Gender:</td><td>Nam</td></tr>
                <tr><td>Day of birth:</td><td>16/08/1997</td></tr>
                <tr><td>Phone number:</td><td>01682075449</td></tr>
                <tr><td>Role:</td><td>Admin</td></tr>
                <tr><td>Class:</td><td></td></tr>
            </table>
        </div>
        <div class="col-xs-2" style="top:230px;left:18px;position: absolute">
            <button class="btn btn-danger" style="width: 150px">Update Avatar</button><br><br>
            <button class="btn btn-success" style="width: 150px">Change Password</button>
        </div>
    </div>
<!--footer-->
<footer>
    <p style="text-align: center;margin-top: 10px"><span><img src="../Icons/fb.png" class="icon2"></span>Design by <a href="https://www.facebook.com/yzenny97" title="Trần Nguyễn Thanh Như Ý" target="_blank">YZenny</a></p>
</footer>
</div>
<script type="text/javascript" language="JavaScript" src="../jquery.js"></script>
<script language="JavaScript" type="text/javascript" src="Exam_MainPage.js"></script>
<script type="text/javascript" language="JavaScript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>