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
    <title>YHP Quiz- Thi Trắc Nghiệm Trực Tuyến</title>
    <link rel="stylesheet" href="HomePage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<!--NavBar sit on top-->
<div class="nav-top">
    <div class="bar">
        <a href="#home" class="item" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" width="40px" height="30px" alt="YHP"></span>Professional</a>
        <div class="option">
            <a href="#" class="item"></span> Hướng dẫn</a>
            <a id="myBtn" class="item">Đăng nhập</a>
            <a href="#about" class="item">Liên hệ</a>
        </div>
    </div>
</div>
<!--Model Dang Nhap-->
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="padding:10px 10px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>YHP - Professional Quiz</h4>
            </div>
            <div class="modal-body" style="padding:10px 15px;">
                <form role="form" action="Welcome" method="post">
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
                        <input type="text" name = "username" class="form-control" id="usrname" value="${requestScope.username}" placeholder="Enter username" required>
                    </div>
                    <div class="form-group">
                        <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                        <input type="password" name="pwd" class="form-control" id="psw" value="${requestScope.password }" placeholder="Enter password" required>
                    </div>
                    <div class="form-group checkbox">
                    <c:forEach items="${requestScope.mapRole }" var="element">
                    <input type="radio" id="${element.key }" name="roleid" value="${element.key }"> ${element.value.getRoleName() }
                    </c:forEach>
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" name="remember" id="remember" value="true" checked>Remember me</label>
                    </div>
                    <input type="submit" name="submit" value="Login" class="btn btn-info btn-block">
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-warning btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                <p>Forgot <a href="#">Password?</a></p>
            </div>
        </div>

    </div>
</div>
</div>
<!--Header-->
<header id="home" class="headercontainer">
    <img src="Images\background-home.jpg" alt="Home Image" width="1500" height="700">
    <div class="text-center">
        <h1><span class="text-black"><b>YHP</b></span></h1>
        <p class="title">The Taste of a New Generation</p>
    </div>
</header>
<!--About-->
<div id="about" class="contactcontainer">
    <h3 class="border-bottom">Thông tin & Liên hệ</h3>
    YHP Professional là website thi trắc nghiệm trực tuyến đình đám nhất hiện nay!
</div>
<!--Contact-->
<div class="myrow">
    <div class="column">
        <div class="card">
            <img src="Images\nhuy.jpg" alt="image TNT Nhu Y" style="width:100%">
            <div class="cardcontainer">
                <h3>Trần Nguyễn Thanh Như Ý</h3>
                <p class="title">Leader &amp; Full-stack developer</p>
                <p>15110378</p>
                <a href="https://www.facebook.com/yzenny97"><span><img src="Icons/fb.png" class="icon2"></span>Facebook</a>
            </div>
        </div>
    </div>

    <div class="column">
        <div class="card">
            <img src="Images\avt.jpg" alt="image Phuong" style="width:100%">
            <div class="cardcontainer">
                <h3>Long Thị Phương</h3>
                <p class="title">Font-end developer</p>
                <p>15110xxx</p>
                <a href="#"><span><img src="Icons/fb.png" class="icon2"></span>Facebook</a>
            </div>
        </div>
    </div>

    <div class="column">
        <div class="card">
            <img src="Images\avt.jpg" alt="image Hinh" style="width:100%">
            <div class="cardcontainer">
                <h3>Đinh Văn Hinh</h3>
                <p class="title">Back-end developer</p>
                <p>15110xxx</p>
                <a href="#"><span><img src="Icons/fb.png" class="icon2"></span>Facebook</a>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<div class="myfooter">
    <p>Powered by <a href="https://www.facebook.com/yzenny97" title="Y Zenny" target="_blank">YZenny</a></p>
</div>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#myBtn").click(function(){
            $("#myModal").modal();
        });
        if(${not empty param.submit}){
        	alert('Tên đăng nhập hoặc mật khẩu không đúng!');
        	$("#myModal").modal();
        }
        if(${empty requestScope.roleid}){
        	$("#1").prop('checked',true);
        } else {
        	$('#${requestScope.roleid}').prop("checked",true);
        }
        if(${not empty param.remember}){
        	$("#remember").prop("checked",true);
        }
    });
</script>
</body>
</html>