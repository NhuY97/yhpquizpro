<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>${ex.examName } - Quiz Professional</title>
    <link rel="stylesheet" href="Exam_MainPage.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <style>
    	h3 span{color:orange}
   	    .menu { text-align: center; }
	    .menu ul { display:inline-table; }
	    .menu li { display:inline; }
    </style>
</head>
<body>
<!--header-->
<div class="mynav-top">
    <div class="mybar">
        <a href="Welcome" class="item1" title="Æ¯Ìng duÌ£ng thi trÄƒÌc nghiÃªÌ£m trÆ°Ì£c tuyÃªÌn"><span class="logo"><img src="Images\LogoWeb.jpg" alt="YHP"></span>Professional</a>
        <div class="option">
            <div style="float:right"><span>Student: </span><a href="UserInfo" class="item2">${mapUser.get(sessionScope.username).getFullname()}</a><br></div>
            <div style="clear:both"></div>
            <div style="float:right">
            <a class="item1" href="ViewExam"> Danh sách kỳ thi</a>
            <a href="ViewResult" class="item1"> Xem Điểm </a>
            <a href="#" class="item1"> Hướng dẫn</a>
            <a class="item1" href="Logout"> Đăng xuất</a>
            <a href="https://www.facebook.com/yzenny97" class="item1"> Liên hệ</a>
            </div>
        </div>
    </div>
</div>
<div class="mycontainer">
<form action="SubmitExam" method="post">
    <h3 class="header-text"><span style="color:green">${ex.examName }</span> 
    <span style="margin-left:20px;color:red" title="Thời gian thi" class="glyphicon glyphicon-time"></span> <span id="minutes">${min }</span>:<span id="seconds">${sec}</span>
    <button id="submitExam" style="margin-left:20px" type="submit" class="btn btn-success">Nộp bài</button></h3>
</form>
    <div class="session">
	   	<div class="btn-block">
            <c:set var="question" value="${listQuestion[index]}" />
        	<h2>Câu ${index + 1 }: ${question.questionName}</h2>
            <div style="margin-left:100px; margin-top:30px; font-size:18px;">
            <c:forEach items="${answerDAO.getMapAnswer(question.questionId).values() }" var="ans">
                <label class="radio"><input type="radio" value="${ans.answerId }" name="AnsOf${question.questionId}" />
                ${ans.answerName }
                </label>
            </c:forEach>
	    </div>
	    <div class="menu">
			  <ul class="pagination pagination-lg" style="margin:auto">
			  <c:forEach begin="1" end="${listQuestion.size() }" varStatus="num">
			    <li id="index${num.index - 1}"><a onclick="submitClick(this)">${num.index}</a></li>
			  </c:forEach>
			  </ul>
			  </div>
	    </div>
	    <form action="DoExam" method="post" >
	    <input type="hidden" id="ansChoose" name="ansChoose" />
	    <input type="hidden" id="indexNext" name="indexNext" />
	  	<input type="hidden" id="min" name="min" />
	    <input type="hidden" id="sec" name="sec" />
	    <input type="submit" id="submit" style="visibility: hidden" />
	    </form>
    </div>
</div>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="Exam_MainPage.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
var interval = setInterval(function(){
	var seconds = $("#seconds").text();
	var minutes = $("#minutes").text();
	seconds--;
    if(minutes<1&&seconds<1){ 
    	$("#submitExam").click();
    	clearInterval(interval);
    }
    if(seconds < 0){
    	minutes--;
    	seconds = 59;
    }
    if(seconds < 10) $("#seconds").text("0"+seconds);
    else $("#seconds").text(seconds);
    $("#minutes").text(minutes);
    $("#min").val($("#minutes").text());
    $("#sec").val($("#seconds").text());
}, 1000);
if(${not empty listAnsChoosed[index]})
$("input[type=radio][value=${listAnsChoosed[index]}]").attr("checked",true);
$("#index${index}").addClass("active");
var submitClick = function(obj){
	$("a").off('click');
	$("#indexNext").val($(obj).text() - 1);
	$("#submit").click();
};
$("submitExam").click(function(){
	$("#indexNext").val("-1");
	$("#submit").click();
});
var AnsValue = function(){
	$("#ansChoose").val($("input[type=radio]:checked").val());
};
AnsValue();
$("input[type=radio]").change(AnsValue);
</script>
</body>
</html>