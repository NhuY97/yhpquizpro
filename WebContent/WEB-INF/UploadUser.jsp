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
    <title>Upload User - YHP Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
    <style>
    #myModal img{border:1px solid orange;border-radius:16px}
    </style>
</head>
<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="Welcome" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <div class="option">
            <span>Admin: </span><a href="UserInfo" class="item2">${userDAO.mapUser.get(sessionScope.username).getFullname() }</a><br>
            <a href="#" class="item1"><span><img src="Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a href="Logout" id="SignOut" class="item1"><span><img src="Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="#about" class="item1"> <span><img src="Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>
<!-- Modal Guide -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
            <div class="modal-content" style="font-family:Time News Roman;font-size:large;font-weight:bold">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">Hướng Dẫn Import User Bằng File Excel</h4>
                </div>
                <div class="modal-body">
                <div>
					<span style="color:orange">Bước 1:</span> Click vào nút Chọn file
					<img class="img-responsive .img-thumbnail" src="Images/guide1.png" alt="Click vào nút Chọn file"/>
				</div>
                <div>
					<span style="color:orange">Bước 2:</span> Chọn file và nhấn Open
					<img class="img-responsive .img-thumbnail" src="Images/guide2.png" alt="Chọn file và nhấn Open"/>
				</div>
                <div>
					<span style="color:orange">Bước 3:</span> 
					<ul>
					<li> <span style="color:violet">- Xuất hiện trang error</span> -> Vui lòng chọn lại file đuôi .xls hoặc .xlsx </li>
					<li> <span style="color:violet">- Xuất hiện hộp thoại báo file không đúng định dạng</span> -> Cấu trúc file Excel của bạn không đúng chuẩn. 
						<p>Mẫu file excel: </p>
						<img class="img-responsive .img-thumbnail" src="Images/excel.png" alt="File excel gồm 1 sheet, 5 cột lần lượt là: username, fullname, sex, birthday,phone number."/>
					</li>
					<li>
						<br/> <span style="color:violet">- Xuất hiện bảng danh sách user</span> -> chọn quyền và nhấn <span style="color:green">hoàn tất</span> để thêm user vào hệ thống.<br/>
						<i><strong>Lưu ý:</strong> <br/>Nếu trong bảng user có dòng nào bị <span style="color:red">bôi đỏ</span> có nghĩa là user đó có username đã tồn tại trong hệ thống.<br/>
						Bạn có thể loại bỏ user bằng cách nhấn nút <span style="color:red">x delete</span> trong bảng.</i>
						<br/><img class="img-responsive .img-thumbnail" src="Images/guide3.png" alt="Chọn file và nhấn Open"/>
					</li>
					</ul>
				</div>
                <div>
					<span style="color:orange">Bước 4:</span> Kết quả trả về là danh sách user chưa được thêm vào hệ thống
					<img class="img-responsive .img-thumbnail" src="Images/guide4.png" alt="Bảng danh sách user chưa được thêm"/>
				</div>
                </div>
                <div class="modal-footer">
                	<a href="https://www.facebook.com/yzenny97"><button type="button" class="btn btn-info">Liên hệ</button></a>
                    <button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
</div>
<!-- Container -->
<div class="mycontainer">
<div class="session" style="overflow:hidden">
<div class="dataShow" style="margin:auto;width:100%;min-height:500px">
<button class="btn btn-primary" id="chooseFile">Chọn File</button>
<button data-toggle="modal" data-target="#myModal" style="float:right" class="btn btn-info">Hướng dẫn</button>
<div style="display:none">
<form action="UploadUser" method="post" enctype="multipart/form-data">
<input type="file" name="file" />
<input type="submit" id="submit" name="submit" />
</form>
</div>
<c:if test="${not empty showTable }">
<div style="margin-top:20px">
<table id="datatable" class="table table-striped table-bordered">
<caption style="text-align:center;color:red"><h4>${title.toUpperCase() }</h4></caption>
<thead>
<tr><th>Username</th><th>Họ và tên</th><th>Giới tính</th><th>Ngày sinh</th><th>SDT</th><th>Thao tác</th></tr>
</thead>
<tbody>
<c:forEach var="user" items="${mapNewUser.values() }">
<c:choose>
<c:when test="${userDAO.mapUser.containsKey(user.getUsername()) }"><tr style="color:red" title="Username đã tồn tại"></c:when>
<c:otherwise><tr></c:otherwise>
</c:choose>
<td>${user.getUsername() }</td>
<td>${user.getFullname() }</td>
<td>${user.getGender() }</td>
<td><c:if test="${user.getBirthday() != null}">${sdf.format(user.getBirthday()) }</c:if></td>
<td>${user.getPhonenumber() }</td>
<td style="text-align:center">
<a href="EditNewUser?delete=${user.getUsername() }"><span class="glyphicon glyphicon-remove" style="color:red;cursor:pointer;opacity:0.7">Delete</span></a>
</td>
</tr>
</c:forEach>
</tbody>
</table>
<form action="EditNewUser" method="post" class="form-horizontal">
<div class="form-group">
    <label class="control-label col-sm-3" for="role">Chọn Quyền: </label>
    <div class="col-sm-4">
    <select name="roleid" class="form-control">
    <c:forEach items="${mapRole.values()}" var="role">
    <option value="${role.getRoleId() }">${role.getRoleName() }</option>
    </c:forEach>
    </select>
    </div>
</div>
<div class="form-group">
    <div class="col-sm-offset-3 col-sm-12">
        <button type="submit" class="btn btn-success">Hoàn tất</button>
    </div>
</div>
</form>
</div>
</c:if>
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
	<c:if test="${not empty showTable }">
	$('#datatable').DataTable();
	</c:if>
	$("#chooseFile").click(function(){
		$("input[type='file']").click();
		return false;
	});
	$("input[type='file']").change(function(){
		if($("input[type='file']").get(0).files.length == 0)
			return;
		$("#submit").click();
	});
});
if(${not empty errFile}){
	alert("Cấu trúc file không đúng, vui lòng nhấn hướng dẫn để kiểm tra lại!");
	<c:remove var="errFile" scope="request"/>
}
$(".mark").parent().css("color","red");
</script>
</body>
</html>