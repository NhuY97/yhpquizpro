<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- check login -->
<c:if test="${empty sessionScope.username }">
<c:redirect url="Welcome" />
</c:if>
<c:set var="mapUser" value="${requestScope.mapAllUser }"/>
<!DOCTYPE html>
<html lang="vi">
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin - YHP Professional</title>
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
            <span>Admin: </span><a href="UserInfo" class="item2">${mapUser.get(sessionScope.username).getFullname() }</a><br>
            <a href="#" class="item1"><span><img src="Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a href="Logout" id="SignOut" class="item1"><span><img src="Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="#about" class="item1"> <span><img src="Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>
<!--modal tao lớp-->
<div class="modal fade" id="myModalClass" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Tạo lớp mới</h4>
                </div>
                <div class="modal-body">
                    <form action="InsertClass" class="form-horizontal" id="formcontent">
                          <div class="form-group" id="divContentName">
                           <label class="control-label col-sm-3" for="contentname1">Tên lớp </label>
                           <div class="col-sm-8">
                           <input autofocus class="form-control" data-toggle="tooltip" title="Tên lớp không được để trống và ít nhất 5 ký tự!" type="text" id="contentname1" placeholder="Nhập tên lớp" name = "classname" required>
                           <span class="glyphicon" id="spanIconExam"></span>
                           </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-9 col-sm-5">
                                <button type="submit" class="btn btn-success">Hoàn tất</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>
<!--modal tao môn học-->
<div class="modal fade" id="myModalSub" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Tạo môn học mới</h4>
                </div>
                <div class="modal-body">
                    <form action="InsertClass" class="form-horizontal" id="formcontent">
                          <div class="form-group" id="divContentName">
                           <label class="control-label col-sm-3" for="contentname1">Tên môn học </label>
                           <div class="col-sm-8">
                           <input autofocus class="form-control" data-toggle="tooltip" title="Tên môn học không được để trống và ít nhất 5 ký tự!" type="text" id="contentname1" placeholder="Nhập tên môn học" name = "subname" required>
                           <span class="glyphicon" id="spanIconExam"></span>
                           </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-9 col-sm-5">
                                <button type="submit" class="btn btn-success">Hoàn tất</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>
<!-- Modal tao user -->
<div class="modal fade" id="myModalUSer" role="dialog" style="font-size:medium">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Tạo user mới</h4>
                </div>
                <div class="modal-body">
                    <form action="InsertUser" class="form-horizontal" id="formexam">
                        <div class="form-group" id="divUsername">
                            <label class="control-label col-sm-3" for="username">Tên đăng nhập: </label>
                            <div class="col-sm-8">
                            <input autofocus class="form-control" data-toggle="tooltip" title="Tên đăng nhập không được để trống!" type="text" id="username" placeholder="Nhập username" name = "username" maxlength="20" required>
                            <span class="glyphicon" id="spanIconExam"></span>
                            </div>
                        </div>
                        <div class="form-group" id="divFullname">
                            <label class="control-label col-sm-3" for="fullname">Họ tên: </label>
                            <div class="col-sm-8">
                            <input autofocus class="form-control" data-toggle="tooltip" title="Tên user không được để trống!" type="text" id="fullname" placeholder="Nhập tên user" maxlength="40" name = "fullname" required>
                            <span class="glyphicon" id="spanIconExam"></span>
                            </div>
                        </div>
                        <div class="form-group" style="font-size: large">
                            <label class="control-label col-sm-3" for="testname" style="font-size:medium">Giới tính: </label>
                            <div class="col-sm-2">
                                <input name="sex" value="0" type="checkbox" /> Nữ
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="dob">Ngày sinh </label>
                            <div class="col-sm-3">
                                <input type = "date" id="dob" name="birthday" class="form-control" required />
                            </div>
                        </div>
                         <div class="form-group" id="divphone">
                            <label class="control-label col-sm-3" for="phone">Số ĐT: </label>
                            <div class="col-sm-8">
                            <input class="form-control" data-toggle="tooltip" type="text" id="phone" placeholder="Nhập số điện thoại" name = "phone" maxlength="13">
                            <span class="glyphicon" id="spanIconExam"></span>
                            </div>
                        </div>
                        <div class="form-group">
                           	<div class="col-sm-10" style="font-size:large">
                           	<label class="control-label col-sm-3" for="check" style="font-size:medium">Phân quyền: </label>
                                <input type="checkbox" id="student" name="student" value="${requestScope.listRoleID[3]}" id="check" style="margin-left:10px;" /> Học sinh 
                                <input type="checkbox" name="exammanager" value="${requestScope.listRoleID[1]}" style="margin-left:10px" /> Quản lý kỳ thi 
                                <input type="checkbox" name="questionmanager" value="${requestScope.listRoleID[2]}" style="margin-left:10px" /> Quản lý câu hỏi 
                                <input type="checkbox" name="admin" value="${requestScope.listRoleID[0]}" style="margin-left:10px" /> Quản trị viên 
                            </div>
                        </div>
                            <div class="form-group" id="chooseClass">
                            <label class="control-label col-sm-3" for="classname">Chọn lớp: </label>
                            <div class="col-sm-8">
                                <select id="classname" name="classid" class="form-control" required>
                                <c:forEach items="${mapClass.values() }" var="cl">
                                    <option value="${cl.getClassId() }">${cl.className }</option>
                                    </c:forEach>
                                </select>
                                </div>
                            </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-12">
                                <button type="submit" class="btn btn-success">Hoàn tất</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default" form="formexam">Clear</button>
                </div>
            </div>
        </div>
</div>
<!-- Container -->
<div class="mycontainer">
<div class="session" style="overflow:hidden">
<nav class="navbar navbar-default sidebar" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>      
    </div>
    <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="choosed"><a href="admin-home-page">Trang chủ<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Danh sách Member<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
            <li><a href="admin-home-page?role=examManager"><span class="glyphicon glyphicon-education"></span> Exam Manager</a></li>
            <li><a href="admin-home-page?role=questionManager"><span class="glyphicon glyphicon-education"></span> Question Manager</a></li>
            <li><a href="admin-home-page?role=student"><span class="glyphicon glyphicon-education"></span> Student</a></li>
            <li><a href="admin-home-page?role=admin"><span class="glyphicon glyphicon-education"></span> Admin</a></li>
          </ul>
        </li>
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Thêm Member<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus-sign"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
            <li><a href="UploadUser"><span class="glyphicon glyphicon-file"></span> Import File Excel</a></li>
            <li><a data-toggle="modal" data-target="#myModalUSer"><span class="glyphicon glyphicon-pencil"></span> Add Immediacy</a></li>
          </ul>
        </li>    
        <li><a data-toggle="modal" data-target="#myModalClass"><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus-sign"></span> Tạo lớp mới</a></li>
        <li><a data-toggle="modal" data-target="#myModalSub"><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus-sign"></span> Tạo môn học mới</a></li>     
        <li ><a href="UserInfo">Tài khoản của tôi<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-apple"></span></a></li>
        <li onclick="alert('Khi bạn thêm user mới. Mật khẩu được đặt mặc định là ngày sinh hoặc username của user đó');return false;"><a>Nhắc nhở<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-apple"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="dataShow" style="float:right;width:100%">
<table id="datatable" class="table table-striped table-bordered">
<caption style="text-align:center;color:red"><h4>${title.toUpperCase() }</h4></caption>
<thead>
<tr><th>Username</th><th>Họ và tên</th><th>Giới tính</th><th>Ngày sinh</th><th>SDT</th><th>Role Count</th><th>Thao tác</th></tr>
</thead>
<tbody>
<c:forEach var="entry" items="${mapUser }">
<c:set var="user" value="${entry.value }" />
<tr>
<td>${user.getUsername() }</td>
<td>${user.getFullname() }</td>
<td>${user.getGender() }</td>
<td>${user.getBirthday() }</td>
<td>${user.getPhonenumber() }</td>
<th>${userRoleDAO.getListRole(user.getUsername()).size() }</th>
<td style="text-align:center">
<a target="_blank" href="ViewDetail?id=${user.getUsername() }"><span class="glyphicon glyphicon-info-sign" style="color:blue;cursor:pointer">Detail </span></a>
<a href="DeleteUser?username=${user.getUsername() }"><span class="glyphicon glyphicon-remove" style="color:red;cursor:pointer;opacity:0.7">Delete</span></a>
</td>
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
$(function(){
	$('#datatable').DataTable();
	$("#chooseClass").hide();
	$("#student").change(function() {
	    if(this.checked) {
	    	$("#chooseClass").show();
	    } else{
	    	$("#chooseClass").hide();
	    }
	});
});
</script>
</body>
</html>