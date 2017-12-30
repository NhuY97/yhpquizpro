<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Làm bài thi</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<style>
footer {
      background-color: #555;
      color: white;
    }

</style>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid" style="background-color:white !important;border-bottom:1px solid silver">
        <div class="navbar-header">
          <a href="#home" class="nav navbar-nav" title="Ứng dụng thi trắc nghiệm trực tuyến" style="text-decoration:none"><span><img src="Images\LogoWeb.jpg" alt="YHP" style="width:40px;height:40px;margin-top:5px"></span>Professional</a>
        </div>
        <ul class="nav navbar-nav">
          <li><a href="#">Làm bài thi</a></li>
          <li><a href="HoSo.jsp">Hồ sơ</a></li>
          <li><a href="XemDiem.jsp">Xem điểm</a></li>
        </ul>
        
        <form class="navbar-form navbar-left">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit" style="width:40px; height:34px;">
                <i class="glyphicon glyphicon-search"></i>
              </button>
            </div>
          </div>
        </form>
        <ul class="nav navbar-nav navbar-right">
        	<li ><a href="#" style="color:gold; font-size:18px;">Sv.Nguyễn Thị Hiền</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </ul>
      </div>
    </nav>

<div class="container" style="margin-top:150px;">  
    <div class="container" >
    	<table class="table table-bordered table-striped table-hover" style="text-align:center;" >
        	<thead>
            	<tr style="background:#03C; font-size:20px; color:red;">
                	<td class="col-lg-1">STT</td>
                    <td>Môn</td>
                    <td>Ngày thi</td>
                   	<td></td>
                </tr>
            </thead>
            <tbody>
            	<tr style="background: #0F9;">
                	<td>1</td>
                    <td>Giải tích 2</td>
                    <td>10/11/2017</td>
                    <td><a href="#" >Vào thi</a></td>
                </tr>
                <tr style="background: #0F9;">
                	<td>2</td>
                    <td>Anh Văn 3</td>
                    <td>10/11/2017</td>
                    <td><a href="AnhVan3.jsp" >Vào thi</a></td>
                </tr>
                <tr style="background: #0F9;">
                	<td>3</td>
                    <td>Lập trình nhúng</td>
                    <td>13/11/2017</td>
                    <td><a href="#" >Vào thi</a></td>
                </tr>
                <tr style="background: #0F9;">
                	<td>4</td>
                    <td>Nhập môn lập trình</td>
                    <td>17/11/2017</td>
                    <td><a href="#" >Vào thi</a></td>
                </tr>
                <tr style="background: #0F9;">
                	<td>5</td>
                    <td>Kỹ thuật lập trình</td>
                    <td>20/11/2017</td>
                    <td><a href="DongHoDemNguoc.html" >Vào thi</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
