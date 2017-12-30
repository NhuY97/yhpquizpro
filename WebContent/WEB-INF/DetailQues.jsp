<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="Images/yhp.ico" type="image/x-icon">
<link rel="shortcut icon" href="Images/yhp.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Chi tiết câu hỏi - Quiz Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>

<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="Welcome" class="item1" title="Ứng dụng thi trắc nghiệm trực tuyến"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <input type="search" class="search" placeholder="Tìm kiếm..." title="Tìm tất cả">
        <div class="option">
            <span>Question Manager: </span><a href="UserInfo" class="item2">${mapUser.get(sessionScope.username).getFullname()}</a><br>
            <a href="#" class="item1"><span><img src="Icons\guide.png"  class="icon2"></span> Hướng dẫn</a>
            <a class="item1" href="Logout"><span><img src="Icons\signin.png"  class="icon2"></span> Đăng xuất</a>
            <a href="https://www.facebook.com/yzenny97" class="item1"> <span><img src="Icons\contact.png" class="icon2"></span> Liên hệ</a>
        </div>
    </div>
</div>

<div class="mycontainer">
    <div class="session">
         <form action="InsertQuestion" class="form-horizontal" id="formquestion">
         <input type="hidden" value="${q.questionId }" name="quesEditId">
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
                     <textarea rows="4" cols="10" class="form-control" data-toggle="tooltip" title="Tên câu hỏi không được để trống và ít nhất 10 ký tự!" id="ftestname" placeholder="Nhập nội dung câu hỏi" name = "questname" autofocus required>${q.questionName }</textarea>
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
             <div class="col-sm-2">
                 <a href="ViewQuestion"><button class="btn btn-info">Trở về</button></a>
             </div>
         </div>
         <div class="form-group">
             <div class="col-sm-9">
                 <button type="submit" class="btn btn-success" id="submitTest" form="formquestion">Cập nhật</button>
             </div>
         </div>
     </div>
	</div>
</div>
<!--FOOTER-->
<footer>
    <p style="text-align: center;margin-top: 10px"><span><img src="Icons/fb.png" class="icon2"></span>Design by <a href="https://www.facebook.com/yzenny97" title="Trần Nguyễn Thanh Như Ý" target="_blank">YZenny</a></p>
</footer>
<!--end page-->
<div class="end"></div>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="Exam_MainPage.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$("#formquestion").css("display","block");
$("#footerQ").css("display","block");
$(this).css("display","none");
$("#uploadQ").css("display","none");
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
    $("#subname").change(displayContent);
    $("#subname option[value=${subid}]").attr("selected",true);
	displayContent();
    $("#contentname option[value=${q.contentId}]").attr("selected",true);
var i=1;
	
	$("#addAns").click(function(){
		var str="";
	    str+="<div class='form-group ans'";
	    str+="<label class='control-label col-sm-3' for='ftestname'>Phương án : </label>";
	    str+="<div class='col-sm-8'>";
	    str+="<textarea rows='2' col='10' class='form-control' data-toggle='tooltip' placeholder='Nhập nội dung phương án' name ='answername' autofocus required></textarea><input type='button' class='btn btn-danger' value='Hủy' onclick='removeEntry(this)'  />";
	    str+="<span class='glyphicon' id='spanIcon'></span></div></div>";
			$("#containerAns").append(str);
			i++;
		    $('.ans:first-child').css("color", "red");
	});
	<c:forEach var="ans" items="${ansDAO.getMapAnswer(q.questionId).values()}">
	var str="";
    str+="<div class='form-group ans'> ";
    str+="<label class='control-label col-sm-3' for='ftestname'>Phương án : </label>";
    str+="<div class='col-sm-8'>";
    str+="<textarea rows='2' col='10' class='form-control' data-toggle='tooltip' placeholder='Nhập nội dung phương án' name ='answername' autofocus required>"+"${ans.answerName}"+"</textarea><input type='button' class='btn btn-danger' value='Hủy' onclick='removeEntry(this)'  />";
    str+="<span class='glyphicon' id='spanIcon'></span></div></div>";
    if(${ans.isCorrect eq "1"})
    	$("#containerAns").prepend(str);
    else
		$("#containerAns").append(str);
		i++;
	</c:forEach>
    function removeEntry(obj){
    	$(obj).parent().parent().remove();
        $('.ans:first-child').css("color", "red");
    };
    $('.ans:first-child').css("color", "red");
</script>
</body>
</html>
