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
    <title>Quản lý kỳ thi - YHP Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
</head>
<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="Welcome" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <input type="search" class="search" placeholder="Tìm kỳ thi..." title="Tìm tất cả kỳ thi">
        <div class="option">
            <span>Exam Manager: </span><a href="UserInfo" class="item2">${mapUser.get(username).getFullname() }</a><br>
            <a href="#" class="item1"><span><img src="Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a id="SignOut" href="Logout" class="item1"><span><img src="Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="https://www.facebook.com/yzenny97" class="item1"> <span><img src="Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>
<!--modal sua ky thi-->
<div class="modal fade" id="myModalExam" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Sửa thông tin kỳ thi</h4>
                </div>
                <div class="modal-body">
                    <form action="InsertExam" class="form-horizontal" id="formexam">
                    <input type="hidden" value="${ex.examId }" name="examid" />
                        <div class="form-group" id="divExamName">
                            <label class="control-label col-sm-3" for="examname">Tên kỳ thi </label>
                            <div class="col-sm-8">
                            <input autofocus value = "${requestScope.ex.examName }" class="form-control" data-toggle="tooltip" title="Tên kỳ thi không được để trống và ít nhất 5 ký tự!" type="text" id="examname" placeholder="Nhập tên kỳ thi" name = "examname" required>
                            <span class="glyphicon" id="spanIconExam"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="testname">Chọn đề thi </label>
                            <div class="col-sm-8">
                                <select id="testname" name="testid" class="form-control" required>
                             <c:forEach items="${mapSub.values()}" var="sub">
	                             <optgroup label="${sub.getSubName() }">
	                             <c:forEach items="${testDAO.getTestForEachSub(sub.getSubId()).values() }" var="test">
	                                 <option value="${test.getTestId() }">${test.getTestName() }</option>
	                                 </c:forEach>
	                             </optgroup>
                             </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="classname">Chọn lớp thi </label>
                            <div class="col-sm-3">
                                <select id="classname" name="classid" class="form-control" multiple required>
                                <c:forEach items="${mapClass.values() }" var="cl">
                                    <option value="${cl.getClassId() }">${cl.className }</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-5">
                                <textarea rows="3" cols="60" class="form-control" readonly title="Danh sách lớp đã chọn" style="color: #b92c28;background-color: white">Danh sách lớp đã chọn:</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="timetest">Thời gian làm bài </label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                <input class="form-control" type="number" id="timetest" name = "timetest" min="1" max="300" value="${requestScope.ex.timeTest }" required>
                                    <span class="input-group-addon">phút</i></span>
                            </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="datestart">Thời gian bắt đầu thi </label>
                            <div class="col-sm-4">
                                <input class="form-control" type="datetime-local" value="${dateStart }" id="datestart" name = "datetest" required>
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
<!--Container-->
<div class="mycontainer">
    <div class="session" style="overflow:hidden;">
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
      <li id="menu"><a href="ViewExam">Tất cả kỳ thi<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-star-empty"></span></a></li>
		<c:forEach items="${mapSub.values()}" var="sub">      	
        	<li id="${sub.getSubId() }"><a href="ViewExam?subid=${sub.getSubId() }">${sub.getSubName() }<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-leaf"></span></a></li>
		</c:forEach> 
        <li ><a href="UserInfo">Tài khoản của tôi<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-apple"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="dataShow" style="float:right;width:100%">
<table id="datatable" class="table table-striped table-bordered">
<thead>
<tr><th>Mã kỳ thi</th><th>Tên kỳ thi</th><th>Tên đề thi</th><th>Môn học</th><th>Thời gian thi</th><th>Ngày thi</th><th>Ngày tạo</th><th>Người tạo</th><th>Thao tác</th></tr>
</thead>
<tbody>
<c:forEach items="${mapExam.values()}" var="exam">
<tr><td>${exam.getExamId() }</td><td>${exam.getExamName() }</td>
<td>
<c:set var="ts" value="${mapTest.get(exam.getTestId()) }" />
<a href="#" title="${ts.getTestName() }" style="color:inherit">${ts.getTestName() }</a></td>
<td>
<c:set var="s" value="${testDAO.getSubject(ts) }" />
${s.getSubName() }</td>
<td>${exam.getTimeTest()}</td>
<td><c:if test="${not empty exam.getDateStart() }">${sdf.format(exam.getDateStart()) }</c:if></td>
<td><c:if test="${not empty exam.getDateCreate() }">${sdf.format(exam.getDateCreate())}</c:if></td>
<td>
<c:set var="us" value="${mapUser.get(exam.getCreator()) }" />
${us.getFullname() }</td><td>
<a href="DeleteExam?examid=${exam.examId }"><span class="glyphicon glyphicon-remove" style="padding-left:5px;padding-bottom:5px;color:red;cursor:pointer;opacity:0.7">Xóa</span></a>
<a href="ViewExam?edit=${exam.getExamId() }"><span class="glyphicon glyphicon-pencil" style="padding-left:8px;color:orange;cursor:pointer">Sửa</span></a></td></tr>
</c:forEach>
</tbody>
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
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	if(${not empty requestScope.ex}){
		$("#myModalExam").modal();
	}
	d = new Date();
	$('input[type=datetime-local]').prop("min",d.getFullYear()+"-"+(d.getMonth() + 1)+"-"+d.getDate()+"T"+d.getHours()+":"+d.getMinutes());
	if(${not empty ex})
	$("#testname option[value=${ex.testId}]").attr("selected","selected");
	<c:forEach items="${listClassId}" var="classid">
		$("#classname option[value=${classid}]").attr("selected","selected");
	</c:forEach>
	var changeSelect = function(){
    	var string = "Danh sách lớp đã chọn:";
    	 $("#classname option:selected").each(function(){
    		 string += $(this).text() + "  ";
    	 });
    	 $("textarea").html(string);
	};
	changeSelect();
	$("#classname").change(changeSelect);
	$('#datatable').DataTable();
	if(${empty param.subid})
		$("#menu").addClass("choosed");
	else $("#${param.subid}").addClass("choosed");
	if(${sessionScope.roleid eq '4'}){
		$("table tr").each(function(){
			   $(this).find("td:nth-child(3)").remove();
			   $(this).find("th:nth-child(3)").remove();
			   $(this).find("td:first").remove();
			   $(this).find("td:last").remove();
			   $(this).find("th:first").remove();
			   $(this).find("th:last").remove();
			});
	}
    
});
</script>
</body>
</html>