<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
</head>
<body >
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="Welcome" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <input type="search" class="search" placeholder="Tìm kiếm..." title="Tìm tất cả">
        <div class="option">
            <span>Exam Manager: </span><a href="UserInfo" class="item2">${mapUser.get(sessionScope.username).getFullname()}</a><br>
            <a href="#" class="item1"><span><img src="Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a class="item1" href="Logout"><span><img src="Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="https://www.facebook.com/yzenny97" class="item1"> <span><img src="Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>
</div>
<!--bottom fixed-->
<div class="mybottom">
    <div class="bar-create">
        <div class="create col-lg-4 col-md-4 col-sm-4 col-xs-4" data-toggle="modal" data-target="#myModalTest"><span><img src="Icons\add2.png" class="icon2"></span>Tạo đề thi mới</div>
        <div class="create col-lg-4 col-md-4 col-sm-4 col-xs-4" data-toggle="modal" data-target="#myModalExam"><span><img src="Icons\add2.png" class="icon2"></span>Tạo kỳ thi mới</div>
        <div class="create col-lg-4 col-md-4 col-sm-4 col-xs-4"><a href="UserInfo" style="color:inherit"> <span><img src="Icons\tag.png" class="icon2"></span>Thông tin cá nhân</a></div>
    </div>
</div>
<!--modal tao ky thi-->
<div class="modal fade" id="myModalExam" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Tạo kỳ thi mới</h4>
                </div>
                <div class="modal-body">
                    <form action="InsertExam" class="form-horizontal" id="formexam">
                        <div class="form-group" id="divExamName">
                            <label class="control-label col-sm-3" for="examname">Tên kỳ thi </label>
                            <div class="col-sm-8">
                            <input autofocus class="form-control" data-toggle="tooltip" title="Tên kỳ thi không được để trống và ít nhất 5 ký tự!" type="text" id="examname" placeholder="Nhập tên kỳ thi" name = "examname" required>
                            <span class="glyphicon" id="spanIconExam"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="testname">Chọn đề thi </label>
                            <div class="col-sm-8">
                                <select id="testname" name="testid" class="form-control" required>
        				<c:forEach items="${mapSubject.values()}" var="sub">
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
                                <textarea rows="3" cols="60" class="form-control" readonly title="Danh sách lớp đã chọn" style="color: #b92c28;background-color: white">Danh sách lớp đã chọn: </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="timetest">Thời gian làm bài </label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                <input class="form-control" type="number" id="timetest" name = "timetest" min="1" max="300" value="60" required>
                                    <span class="input-group-addon">phút</i></span>
                            </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="datestart">Thời gian bắt đầu thi </label>
                            <div class="col-sm-4">
                                <input class="form-control" type="datetime-local" id="datestart" name = "datetest" required>
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
<!--modal tao de thi-->
<div class="modal fade" id="myModalTest" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Tạo đề thi mới</h4>
            </div>
            <div class="modal-body">
                <form action="InsertTest" class="form-horizontal" id="formtest">
                    <div class="form-group" id="divTestName">
                        <label class="control-label col-sm-3" for="ftestname">Tên đề thi </label>
                        <div class="col-sm-8">
                            <input class="form-control" data-toggle="tooltip" title="Tên đề thi không được để trống và ít nhất 5 ký tự!" type="text" id="ftestname" placeholder="Nhập tên đề thi" name = "testname" autofocus required>
                            <span class="glyphicon" id="spanIcon"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="testname">Chọn môn học </label>
                        <div class="col-sm-8">
                            <select id="subname" name="subname" class="form-control" required>
                            <c:forEach items="${mapSubject.values()}" var="sub">
                                    <option value="${sub.getSubId() }">${sub.getSubName() }</option>
                            </c:forEach>
                            </select>
                        </div>
                    </div>
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
<!--container-->
<div class="mycontainer">
    <h1 class="header-text"><span><img src="Icons\new1.png" class="icon1"></span>Kỳ thi và đề thi mới nhất</h1>
    <div class="session">
        <div class="trend-menu">
            <ul class="examlist">
            <c:forEach items="${requestScope.mapTopExam.values() }" var="ex">
                <li><a style="color:inherit" href="ViewExam?edit=${ex.getExamId() }" title='${ex.getExamName() }'>${ex.getExamName() }</a><span class="badge">${subjectDAO.getSubName(ex.getTestId()) }</span>
                <p style="font-size:small;font-family:courier;color:gray">
                <span title="Người tạo/cập nhật gần nhất" class="glyphicon glyphicon-user">
                ${mapUser.get(ex.getCreator()).getFullname() }</span>
                 <span style="margin-left:20px" title="Ngày tạo/cập nhật gần nhất" class="glyphicon glyphicon-time">
                 <c:if test="${not empty ex.getDateCreate() }">${sdf.format(ex.getDateCreate())}</c:if></span></p>
                </li>
            </c:forEach>
                <a href="ViewExam">Xem thêm...</a>
            </ul>
            <ul class="testlist">
            <c:forEach items="${requestScope.mapTopTest.values() }" var="test">
                <li><a style="color:inherit" title='${test.getTestName()}'>${test.getTestName() }</a><span class="badge">${subjectDAO.getSubName(test.getTestId()) }</span>
                                <p style="font-size:small;font-family:courier;color:gray">
                <span title="Người tạo/cập nhật gần nhất" class="glyphicon glyphicon-user">
                ${mapUser.get(test.getCreator()).getFullname() }</span>
                 <span style="margin-left:20px" title="Ngày tạo/cập nhật gần nhất" class="glyphicon glyphicon-time">
                 <c:if test="${not empty test.getDateCreate() }">${sdf.format(test.getDateCreate())}</c:if></span></p></li>
            </c:forEach>
                <a href="ViewTest">Xem thêm...</a>
            </ul>
        </div>
        <div class="trend-create">
            <div id="slider">
                <ul>
                    <li><img src="Images\bg1.jpg"></li>
                    <li><img src="Images\bg2.jpg"></li>
                    <li><img src="Images\bg3.gif"></li>
                    <li><img src="Images\bg4.png"></li>
                    <li><img src="Images\bg5.jpg"></li>
                </ul>
            </div>
            <div class="pro-text"><marquee direction="up" height="350px" scrollamount="2">Với ngân hàng câu hỏi khổng lồ, những đề thi tổng hợp vô cùng hay và bổ ích, kỳ thi tổ chức vô cùng chặc chẽ, <strong>YHP Professional</strong> nhiều năm liền được bình chọn là Website Giáo dục hàng đầu Việt Nam và mang tầm cỡ thế giới. <br>Chúng tôi luôn nỗ lực hết mình Vì một Việt Nam tươi đẹp!
                <br><br><br><br><br><span style="color: #5D0C7B">With a huge question bank, incredibly good and useful quizzes, and extremely well organized exams, <strong>YHP Professional</strong> has been voted Education Website of Vietnam for many years. <br>We always try our best for a beautiful Vietnam!</span></marquee></div>
        </div>
    </div>
    <h1 class="header-text"><span><img src="Icons\exam6.png" class="icon1" width="23px" height="23px">
        </span>Danh sách môn học</h1>
    <div class="session">
            <c:forEach items="${requestScope.mapSubject.values()}" var="subject">
        <div class="sub-list col-lg-5 col-md-5 col-sm-9 col-xs-11">
            <ul>
                <li>
                    <div class="dropdown">
                        <span class="dropdown-toggle glyphicon glyphicon-education" data-toggle="dropdown">${subject.getSubName() }</span>
                        <ul class="dropdown-menu" style="left: 100px">
                            <li style="font-size: small!important;"><a href="#">Xem đề thi môn học này</a></li>
                            <li style="font-size: small!important;"><a href="#">Xem kỳ thi môn học này</a></li>
                            <li style="font-size: small!important;"><a onclick="createTest('${subject.getSubId()}')">Tạo đề thi cho môn học này</a></li>
                        </ul>
                    </div>
                </li>
                <c:forEach items="${requestScope.contentDAO.getListContentForEachSub(subject.getSubId()).values() }" var="content">
                <li>${content.getContentName() } <span class="badge">${requestScope.contentDAO.getNumOfQuestion(content.getContentId())}</span></li>
                </c:forEach>
            </ul>
        </div>
       	</c:forEach>
    </div>
    <!--footer-->
    <footer>
        <p style="text-align: center;margin-top: 10px"><span><img src="Icons/fb.png" class="icon2"></span>Design by <a href="https://www.facebook.com/yzenny97" title="Trần Nguyễn Thanh Như Ý" target="_blank">YZenny</a></p>
    </footer>
    <!--end page-->
    <div class="end"></div>
</div>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="Exam_MainPage.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
d = new Date();
var hour = d.getHours() < 10 ? '0'+d.getHours() : d.getHours();
var minute = d.getMinutes() < 10 ? '0'+d.getMinutes() : d.getMinutes();
$('input[type=datetime-local]').prop("min",d.getFullYear()+"-"+(d.getMonth() + 1)+"-"+d.getDate()+"T"+hour+":"+minute);
$('input[type=datetime-local]').val(d.getFullYear()+"-"+(d.getMonth() + 1)+"-"+d.getDate()+"T"+hour+":"+minute);
var displayContent = function(){
	<c:forEach items="${mapSubject.values()}" var="subject">
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
	displayContent();
    $("#subname").change(displayContent);
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
        str += "<input class='form-control' type='number' min='0' max='"+countQ+"' name='numques"+ctID+"' value='"+countQ+"' required></div>"; 
        str += "<div class='col-sm-2'>";
        str += " <button type='button' onclick='removeEntry(this)' class='btn btn-danger'>Hủy nội dung này</button></div></div>";
    	$("#ctContainer").append(str);
    });
    function removeEntry(obj){
    	$(obj).parent().parent().remove();
    };
    $("#resetTest").click(function(){
    	$("#ctContainer").html("");
    	$("#subname").prop("disabled",false);
    });
    $("#submitTest").click(function(){
    	$("#subname").prop("disabled",false);
    });
    $("#classname").change(function(){
    	var string = "Danh sách lớp đã chọn:";
    	 $("#classname option:selected").each(function(){
    		 string += $(this).text() + "  ";
    	 });
    	 $("textarea").html(string);
    });
    var createTest = function(subid){
    	$("#subname option[value="+subid+"]").attr("selected","selected");
    	displayContent();
    	$("#myModalTest").modal();
    };
</script>
</body>
</html>