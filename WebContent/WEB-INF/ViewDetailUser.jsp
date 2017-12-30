<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- check login -->
<c:if test="${empty sessionScope.username }">
<c:redirect url="Welcome" />
</c:if>
    <c:set var="user" value="${requestScope.user }" />
<c:set var="mapUser" value="${requestScope.mapAllUser }"/>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${user.getFullname()} - Quiz Professional</title>
<link rel="stylesheet" href="Exam_MainPage.css">
<link rel="stylesheet" href="Exam_MainPage.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
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
<!-- Container -->
<div class="mycontainer">
<div class="session" style="overflow:hidden">
<div style="float:left;width:20%">
<h2>User: ${user.getUsername()}</h2>
<img src="Images/${user.getAvatar() }" class="img-responsive img-thumbnail" style="height: 240px" alt="${user.getFullname()} Avatar" width="300">
<div style="margin-top:10px;">
<button id="btnedit" class="btn btn-info" style="width:100%;font-size:large">Sửa đổi thông tin</button>
</div>
</div>
<div style="float:right;width:75%">
<form action="edit-user?username=${user.getUsername()}" method="post" id="form-edit">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input value="${user.getFullname()}" title="Họ tên" id="fullname" type="text" class="form-control" name="fullname" placeholder="Fullname">
    </div>    <br>
    <div class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-adjust"></i></span>
      <select title="Giới tính" name="sex" class="form-control">
      <c:choose>
      <c:when test="${user.getGenderInt() == 1 }">
            <option value="1" selected="selected">Nam</option>
            <option value="0">Nữ</option>
      </c:when>
      <c:otherwise>
      <option value="1">Nam</option>
      <option value="0" selected="selected">Nữ</option>
	  </c:otherwise>
      </c:choose>
      </select>
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
      <input value="${user.getBirthday()}" title="Ngày sinh" id="birthday" type="date" class="form-control" name="birthday">
    </div>    <br>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
      <input value="${user.getPhonenumber()}" title="Số điện thoại" id="phone" type="text" class="form-control" name="phone">
    </div>    <br>
    <h4>Danh sách quyền: 
    <c:choose> 
    <c:when test="${empty requestScope.listRoleUser }">
    	<c:out value="Chưa có quyền nào!"></c:out>
    </c:when>
    <c:otherwise>
    <c:forEach items="${requestScope.listRoleUser }" var="role">
    <br/><strong style="margin-left:20px"><c:out value="${role.getRoleName() } "></c:out></strong>
    </c:forEach>
    </c:otherwise>
    </c:choose> 
    </h4>
	<div class="form-group" id="role">
		<div class="col-sm-10" style="font-size:large">
	     <input type="checkbox" name="student" value="${requestScope.listRoleID[3]}"  /> Học sinh
	    </div>
	    <div class="col-sm-10" style="font-size:large">
	     <input type="checkbox" name="exammanager" value="${requestScope.listRoleID[1]}"  /> Quản lý kỳ thi 
	    </div>
	    <div class="col-sm-10" style="font-size:large">
	     <input type="checkbox" name="questionmanager" value="${requestScope.listRoleID[2]}"  /> Quản lý câu hỏi 
	    </div>
	    <div class="col-sm-10" style="font-size:large">
	     <input type="checkbox" name="admin" value="${requestScope.listRoleID[0]}"  /> Quản trị viên 
	    </div> 
	</div>
	<div class="input-group">
	<input type="button" class="btn btn-danger" name="cancle" id="cancle" value="Hủy" class="form-control" />
	</div>
	<div class="input-group">
	<input type="submit" class="btn btn-success" name="submit" id="submit" value="Hoàn tất" class="form-control" />
	</div>
  </form>
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
<script type="text/javascript">
$("#submit,#cancle").hide();
$("#role").hide();
$("h4").show();
$("input").prop("readonly",true);
$("select").prop("disabled",true);
$(document).ready(function(){
	$("#btnedit").click(function(){
		$("#submit, #cancle").show();
		$("input").prop("readonly",false);
		$("select").prop("disabled",false);
		$("h4").hide();
		$("#role").show();
		});
	$("#cancle").click(function(){
		location.reload();
	});
	<c:forEach items="${requestScope.listRoleUser }" var="role">
		$("input[value='${role.getRoleId()}']").prop("checked",true);
	</c:forEach>
});
</script>

</body>
</html>