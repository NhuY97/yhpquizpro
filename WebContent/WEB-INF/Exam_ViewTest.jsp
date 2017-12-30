<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý đề thi - YHP Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
</head>
<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="exam-manager-home" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <div class="option">
            <span>Exam Manager: </span><a href="UserInfo" class="item2">${mapUser.get(sessionScope.username).getFullname()}</a><br>
            <a href="#" class="item1"><span><img src="Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a id="Logout" href="Logout" class="item1"><span><img src="Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="https://www.facebook.com/yzenny97" class="item1"> <span><img src="Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>
<div class="modal fade" id="myModalTest" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Sửa đề thi</h4>
            </div>
            <div class="modal-body">
                <form action="InsertTest" class="form-horizontal" id="formtest">
                <input type="hidden" value="${test.testId }" name="testid" />
                    <div class="form-group" id="divTestName">
                        <label class="control-label col-sm-3" for="ftestname">Tên đề thi </label>
                        <div class="col-sm-8">
                            <input class="form-control" data-toggle="tooltip" title="Tên đề thi không được để trống và ít nhất 5 ký tự!" type="text" id="ftestname" value="${test.testName }" placeholder="Nhập tên đề thi" name = "testname" autofocus required>
                            <span class="glyphicon" id="spanIcon"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="testname">Chọn môn học </label>
                        <div class="col-sm-8">
                            <select id="subname" class="form-control" required>
                            <c:forEach items="${mapSub.values()}" var="sub">
                                    <option value="${sub.getSubId() }">${sub.getSubName() }</option>
                            </c:forEach>
                            </select>
                        </div>
                    </div>
                    <input type="hidden" id="subvalue" name="subname" />
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="testname">Chọn nội dung </label>
                        <div class="col-sm-8">
                            <select id="contentname" name="contentname" class="form-control" required>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                    <label class="control-label col-sm-3"></label>
                        <div class="col-sm-8">
                            <button id="addContent" type="button" class="btn btn-info">Chọn nội dung này</button>
                        </div>
                    </div>
                    <div id="ctContainer">

                   </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="form-group">
                    <div class="col-sm-1">
                        <button type="reset" id="resetTest" class="btn btn-default" form="formtest">Đặt lại</button>
                    </div>
                    <div class="col-sm-3 col-sm-offset-7">
                        <button type="submit" class="btn btn-success" id="submitTest" form="formtest">Hoàn tất</button>
                    </div>
                </div>
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
      <li ><a id="menu" href="ViewTest">Tất cả đề thi<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-grain"></span></a></li>
		<c:forEach items="${mapSub.values()}" var="sub">      	
        	<li id="${sub.getSubId() }"><a href="ViewTest?subid=${sub.getSubId() }">${sub.getSubName() }<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-leaf"></span></a></li>
		</c:forEach> 
	<li ><a href="UserInfo">Tài khoản của tôi<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-apple"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="dataShow" style="float:right;width:100%">
<table id="datatable" class="table table-striped table-bordered">
<thead>
<tr><th>Mã Đề thi</th><th>Tên Đề thi</th><th>Môn học</th><th>Ngày tạo</th><th>Người tạo</th><th>Thao tác</th></tr>
</thead>
<tbody>
<c:forEach items="${mapTest.values()}" var="test" >
<tr><td>${test.testId }</td><td><a href="Question_View.jsp" style="color:inherit" title="${test.testName }"">${test.testName }</a></td>
<td>${subDAO.getSubName(test.testId)}
<td>${sdf.format(test.dateCreate)}</td>
<td>${mapUser.get(test.creator).getFullname() }</td><td>
<a href="DeleteTest?testid=${test.testId }"><span class="glyphicon glyphicon-remove" style="padding-left:5px;padding-bottom:5px;color:red;cursor:pointer;opacity:0.7">Xóa</span></a>
<a href="ViewTest?edit=${test.testId }"><span class="glyphicon glyphicon-pencil" style="padding-left:8px;color:orange;cursor:pointer">Sửa</span></a></td></tr>
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

	$("#subname").change(function(){
		$("#subvalue").val($("#subname").val());
	});
	var displayContent = function(){
		<c:forEach items="${mapSub.values()}" var="subject">
		if($("#subname").val() === '${subject.getSubId()}') {
				$("#contentname").html(function (){
				var result = "";
				<c:forEach items="${requestScope.contentDAO.getListContentForEachSub(subject.getSubId()).values() }" var="ct">
				result += "<option value='${ct.getContentId()}'>${ct.getContentName()}</option>";
				</c:forEach>
				return result;
				});
			}
		</c:forEach>
	};
	
	if(${empty param.subid})
		$("#menu").addClass("choosed");
	else $("#${param.subid}").addClass("choosed");
	$('#datatable').DataTable();
    window.remove = function (obj){
    	$(obj).parent().parent().remove();
    };
	$("#addContent").click(function(){
    	<c:forEach items="${mapContent.values()}" var="content">
    	if($("#contentname").val() === '${content.getContentId()}')
    		var countQ = ${questionDAO.countQuesFromContent(content.getContentId())};
    	</c:forEach>
    	$("#subname").prop("disabled",true);
        var ctID = $("#contentname").val();
        var ctName = $("#contentname option:selected").text();
    	var entry = $("#ctEntry"+ctID);
    	
    	if(entry.val() != undefined)
    		return;
        var str ="<div class='form-group' id='ctEntry"+ctID+"'>";
    	str += "<input type='hidden' name='ctID"+ctID+"' value='"+ctID+"' >";
    	str += "<label class='control-label col-sm-2' for='ctName'>Tên nội dung </label>";
   		str += "<div class='col-sm-3'>";
        str +="<input class='form-control' type='text' value='"+ctName+"' readonly='readonly'></div>"; 
        str += "<label class='control-label col-sm-2' for='numques'>Số câu hỏi </label>";
        str += "<div class='col-sm-2'>";
        str += "<input class='form-control' type='number' min='0' max='"+countQ+"' id='numques"+ctID+"' name='numques"+ctID+"' value='"+countQ+"' required></div>"; 
        str += "<div class='col-sm-2'>";
        str += " <button type='button' onclick='remove(this)' class='btn btn-danger'>Hủy nội dung này</button></div></div>";
    	$("#ctContainer").append(str);
    });

    $("#resetTest").click(function(){
    	$("#ctContainer").html("");
    	$("#subname").prop("disabled",false);
    });
    if(${not empty requestScope.test}){
	    $("#subname").change(displayContent);
	    $("#subname option[value=${test.subId}]").attr("selected","selected");
		displayContent();
		$("#subvalue").val($("#subname").val());
		<c:forEach items="${mapContentQuest.keySet()}" var="contentid">
		$("#contentname option[value=${contentid}]").attr("selected","selected");
		$("#addContent").click();
		$("#numques"+"${contentid}").val("${mapContentQuest.get(contentid)}");
		</c:forEach>
	$("#myModalTest").modal();
	}
});
</script>
</body>
</html>