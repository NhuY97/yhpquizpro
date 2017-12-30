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
    <title>Thông tin cá nhân - YHP Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <style>
    table td:nth-child(even){color:#008C5E!important;}
    </style>
</head>
<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="Welcome" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <div class="option">
            <span>User: </span><a href="#" class="item2">${us.getFullname()}</a><br>
            <a href="#" class="item1"><span><img src="Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a href="Logout" id="SignOut" class="item1"><span><img src="Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="#about" class="item1"> <span><img src="Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>
<div class="modal fade" id="myModalPass" role="dialog" style="font-size:medium">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Đổi password</h4>
                </div>
                <div class="modal-body">
                    <form action="UserInfo" method="post" class="form-horizontal" id="formexam">
                        <div class="form-group" id="divPassold">
                            <label class="control-label col-sm-3" for="pass-old">Password: </label>
                            <div class="col-sm-8">
                            <input value="" autofocus class="form-control" type="password" id="pass-old" name = "passold" required>
                            <span class="glyphicon" id="spanIconExam"></span>
                            </div>
                        </div>
                        <div class="form-group" id="divPassnew">
                            <label class="control-label col-sm-3" for="pass-old">New Password: </label>
                            <div class="col-sm-8">
                            <input value="" autofocus class="form-control" type="password" id="pass-new" name = "passnew" required>
                            <span class="glyphicon" id="spanIconExam"></span>
                            </div>
                        </div>
                        <div class="form-group" id="divPassnew2">
                            <label class="control-label col-sm-3" for="pass-new2">Perform Password: </label>
                            <div class="col-sm-8">
                            <input value="" autofocus class="form-control" type="password" id="pass-new2" name = "passnew2" required>
                            <span class="glyphicon" id="spanIconExam"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-12">
                                <button id="submit" type="submit" class="btn btn-success">Hoàn tất</button>
                            </div>
                        </div>
                        <p id="mess" style="font-family:courier;color:red;text-align:center"></p>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default" form="formexam">Clear</button>
                </div>
            </div>
        </div>
</div>
<!--Container-->
<div class="mycontainer">
    <div class="session">
        <div class="col-xs-2" style="background-color: transparent;height: 210px">
            <img id="imgavatar" src="Images/${us.getAvatar()}" alt="Avatar" style="width: 100%;height: 200px">
        </div>
        <div class="col-xs-2">
            <button class="btn btn-danger" id="btnUpdate" style="width: 170px"><span class="glyphicon glyphicon-camera" style="color:#000;margin-right:15px"></span> Update Avatar</button><br><br>
            <button id="btnChange" class="btn btn-success" data-toggle="modal" data-target="#myModalPass" style="width: 170px"><span class="glyphicon glyphicon-pencil" style="color:#000;margin-right:10px"></span> Change Password</button>
            <form action="uploadAvatar" method="post" enctype="multipart/form-data">
            <input type="file" id="uploadAvatar" name="uploadAvatar" style="visibility: hidden; width: 1px; height: 1px"/>
            <button type="submit" style="visibility: hidden;" id="submitUpload" ></button>
            </form>
        </div>
        <div class="col-lg-9 info" style="margin-left: 20px;padding: 30px">
            <table style="width: 100%" class="table table-responsive">
                <tr><td>FullName:</td><td>${us.getFullname()}</td></tr>
                <tr><td>Sex:</td><td>${us.getGender()}</td></tr>
                <tr><td>Day of birth:</td><td>${us.getBirthday()}</td></tr>
                <tr><td>Phone number:</td><td>${us.getPhonenumber()}</td></tr>
                <tr><td>Danh sách quyền: 
			    <c:choose> 
			    <c:when test="${empty requestScope.listRoleUser }">
			    	<c:out value="Chưa có quyền nào!"></c:out>
			    </c:when>
			    <c:otherwise>
			    <c:forEach items="${requestScope.listRoleUser }" var="role">
			    <br/><i style="margin-left:20px;color:red"><c:out value="${role.getRoleName() } "></c:out></i>
			    </c:forEach>
			    </c:otherwise>
			    </c:choose> </td></tr>
            </table>
        </div>
    </div>
<!--footer-->
<footer>
    <p style="text-align: center;margin-top: 10px"><span><img src="Icons/fb.png" class="icon2"></span>Design by <a href="https://www.facebook.com/yzenny97" title="Trần Nguyễn Thanh Như Ý" target="_blank">YZenny</a></p>
</footer>
</div>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="Exam_MainPage.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
<script type="text/javascript">
if(${not empty requestScope.state}) {
	if(${requestScope.state == "101"})
		$("#mess").html("Mật khẩu mới không khớp!");
	else if(${requestScope.state == "404"})
		$("#mess").html("Mật khẩu cũ không đúng!");
	<c:remove var="state" scope="request" />
	$("#myModalPass").modal();

}

$(function(){
	$("#btnUpdate").click(function(){
		$('#uploadAvatar').click();
		return false;
	});
	$("input[type='file']").change(function(){
		if($("input[type='file']").get(0).files.length == 0)
			return;
		$("#submitUpload").click();
	});
});
</script>
</body>
</html>