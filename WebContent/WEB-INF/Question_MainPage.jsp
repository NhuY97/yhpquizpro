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
    <title>Quản lý ngân hàng câu hỏi - YHP Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body ng-app="">
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="#home" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <input type="search" class="search" placeholder="Tìm kiếm..." title="Tìm tất cả">
        <div class="option">
            <span>Question Manager: </span><a href="UserInfo" class="item2">${mapUser.get(sessionScope.username).fullname}</a><br>
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
        <div class="create col-lg-4 col-md-4 col-sm-4 col-xs-4" data-toggle="modal" data-target="#myModalQues"><span><img src="Icons\add2.png" class="icon2"></span>Tạo câu hỏi mới</div>
        <div class="create col-lg-4 col-md-4 col-sm-4 col-xs-4" data-toggle="modal" data-target="#myModalContent"><span><img src="Icons\add2.png" class="icon2"></span>Tạo nội dung mới</div>
        <div class="create col-lg-4 col-md-4 col-sm-4 col-xs-4"> <a href="UserInfo" style="color:inherit"><span><img src="Icons\tag.png" class="icon2"></span>Thông tin cá nhân</a></div>
    </div>
</div>
<!--modal tao noi dung-->
<div class="modal fade" id="myModalContent" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Tạo nội dung mới</h4>
                </div>
                <div class="modal-body">
                    <form action="InsertContent" class="form-horizontal" id="formcontent">
		                 <div class="form-group">
	                    <label class="control-label col-sm-3" for="subnameC">Chọn môn học </label>
	                    <div class="col-sm-8">
	                        <select id="subnameC" name="subname" class="form-control" required>
	                        <c:forEach var="s" items= "${mapSubject.values() }">
	                                <option value="${s.subId}">${s.subName}</option>
	                        </c:forEach>
	                        </select>
	                    </div>
	                    <input type="hidden" value="${ctEdit.contentId }" name="ctEditId" />
	                    </div>
                          <div class="form-group" id="divContentName">
                           <label class="control-label col-sm-3" for="contentname1">Tên nội dung </label>
                           <div class="col-sm-8">
                           <input value="${ctEdit.contentName}" autofocus class="form-control" data-toggle="tooltip" title="Tên nội dung không được để trống và ít nhất 5 ký tự!" type="text" id="contentname1" placeholder="Nhập tên nội dung" name = "contentname" required>
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
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default" form="formcontent">Clear</button>
                </div>
            </div>
        </div>
</div>
<!--modal tao cau hoi-->
<div class="modal fade" id="myModalQues" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Tạo câu hỏi mới</h4>
            </div>
            <div class="modal-body" style="min-height:130px">
            	<div class="form-group" id="uploadQ">
                        <div class="col-sm-8">
                            Upload File Excel: <input type="file" class="btn btn-info">
                        </div>
                        <div class="col-sm-8"></div>
                        <div class="col-sm-8"></div>
                        <div class="col-sm-8"></div>
                </div>
                <div class="form-group">
                	<div class="col-sm-10">
                		<button class="btn btn-info" id="showFormQ">Nhập câu hỏi</button>
                	</div>
                </div>
                <form action="InsertQuestion" class="form-horizontal" id="formquestion">
                    <div class="form-group">
                    <label class="control-label col-sm-3" for="subname">Chọn môn học </label>
                    <div class="col-sm-8">
                        <select id="subname" name="subname" class="form-control" required>
                        <c:forEach var="s" items= "${mapSubject.values() }">
	                                <option value="${s.subId}">${s.subName}</option>
	                    </c:forEach>
                        </select>
                    </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="contentname">Chọn nội dung </label>
                        <div class="col-sm-8">
                            <select id="contentname" name="contentname" class="form-control" required>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="divTestName">
                        <label class="control-label col-sm-3" for="ftestname">Nội dung câu hỏi </label>
                        <div class="col-sm-8">
                            <textarea rows="4" col="10" class="form-control" data-toggle="tooltip" title="Tên câu hỏi không được để trống và ít nhất 10 ký tự!" id="ftestname" placeholder="Nhập nội dung câu hỏi" name = "questname" autofocus required></textarea>
                            <span class="glyphicon" id="spanIcon"></span>
                        </div>
                    </div>
                    <div class="form-group">
                    	<label class="control-label col-sm-3"></label>
                        <div class="col-sm-8">
                            <button id="addAns" type="button" class="btn btn-info">Thêm phương án</button>
                        </div>
                    </div>
                    <div id="containerAns">

                    </div>
                  <p style="font-size:small;font-family:courier;color:orange;text-align:center">Lưu ý: Phương án đầu tiên là phương án đúng!</p>
                </form>
            </div>
            <div class="modal-footer">
            <div id="footerQ">
                <div class="form-group">
                    <div class="col-sm-1">
                        <button type="button" id="back" class="btn btn-default">Quay lại</button>
                    </div>
                    <div class="col-sm-3 col-sm-offset-7">
                        <button type="submit" class="btn btn-success" id="submitTest" form="formquestion">Hoàn tất</button>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
<!--container-->
<div class="mycontainer">
    <div class="session">
    <div class="col-sm-5 ani"><a href="ViewQuestion" style="color:inherit">Tất cả câu hỏi <span class="badge">${mapQuestion.size() }</span></a></div>
    <div class="col-sm-5 ani">Tất cả nội dung <span class="badge">${mapContentSize }</span></div>
    </div>
    <h1 class="header-text"><span><img src="Icons\exam6.png" class="icon1" width="23px" height="23px">
        </span>Danh sách môn học</h1>
    <div class="session">
    <c:forEach var="s" items= "${mapSubject.values() }">
        <div class="sub-list col-lg-5 col-md-5 col-sm-9 col-xs-11">
            <ul>
                <li><span class="dropdown-toggle glyphicon glyphicon-education" data-toggle="dropdown"> ${s.subName }</span></li>
                <c:forEach var="ct" items="${contentDAO.getListContentForEachSub(s.subId).values()}">
                	<c:set var="numQues" value="${contentDAO.getNumOfQuestion(ct.contentId)}" />
                <li>
                    <div class="dropdown">
                        <span data-toggle="dropdown"> ${ct.contentName } <span class="badge">${numQues }</span></span>
                        <ul class="dropdown-menu" style="left: 100px">
                            <li style="font-size: small!important;"><a href="question-manager-home?editCT=${ct.contentId }">Chỉnh sửa nội dung này</a></li>
                            <li style="font-size: small!important;"><a href="DeleteContent?id=${ct.contentId }">Xóa nội dung này</a></li>
                        </ul>
                    </div>
                </li>
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
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script type="text/javascript">
$(function(){
	if(${not empty ctEdit}){
		$("#subnameC option[value=${ctEdit.subId}]").attr("selected",true);
		$("#myModalContent").modal();
	}
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
	$("#showFormQ").click(function(){
		$("#formquestion").css("display","block");
		$("#footerQ").css("display","block");
		$(this).css("display","none");
		$("#uploadQ").css("display","none");
	});
	$("#back").click(function(){
		$("#formquestion").css("display","none");
		$("#footerQ").css("display","none");
		$("#showFormQ").css("display","block");
		$("#uploadQ").css("display","block");
	});
	var i=1;
    window.removeEnt= function (obj){
    	$(obj).parent().parent().remove();
        $('.ans:first-child').css("color", "red");
    };
	$("#addAns").click(function(){
		var str="";
	    str+="<div class='form-group ans'>";
	    str+="<label class='control-label col-sm-3' for='ftestname'>Phương án : </label>";
	    str+="<div class='col-sm-8'>";
	    str+="<textarea rows='2' col='10' class='form-control' data-toggle='tooltip' placeholder='Nhập nội dung phương án' name ='answername' autofocus required></textarea><input type='button' class='btn btn-danger' value='Hủy' onclick='removeEnt(this)'  />";
	    str+="<span class='glyphicon' id='spanIcon'></span></div></div>";
			$("#containerAns").append(str);
			i++;
		    $('.ans:first-child').css("color", "red");
	});
});
    
</script>
</body>
</html>