$(function () {
	$('[data-toggle="tooltip"]').tooltip();
    $("h1").mousemove(function () {
        $(".icon1").css({"transform":"rotate(180deg) scale(1.5,1.5)","transition":"transform 2s"});
    });
    $("h1").mouseleave(function () {
        $(".icon1").css({"transform":"rotate(180deg) scale(1.2,1.2)","transition":"transform 1s"});
    });
    $("#ftestname").focusout(function(){
    	var value = $("#ftestname").val();
    	var length = $("#ftestname").val().length;
    	if(value != "" && value != undefined){
    		if(length > 5){
    		$("#divTestName").removeClass("has-error");
    		$("#divTestName").removeClass("has-feedback");
    		$("#spanIcon").removeClass("glyphicon-remove");
    		$("#spanIcon").removeClass("form-control-feedback");
    		}
    	}
    	if(value == "" || length < 6){
    		$("#divTestName").addClass("has-error");
    		$("#divTestName").addClass("has-feedback");
    		$("#spanIcon").addClass("glyphicon-remove");
    		$("#spanIcon").addClass("form-control-feedback");
    	}
    		});
    $("#submitTest").click(function(){
    	var value = $("#ftestname").val();
    	var length = $("#ftestname").val().length;
    	if(value != "" && value != undefined){
    		if(length > 5){
    		$("#divTestName").removeClass("has-error");
    		$("#divTestName").removeClass("has-feedback");
    		$("#spanIcon").removeClass("glyphicon-remove");
    		$("#spanIcon").removeClass("form-control-feedback");
    		}
    	}
    	if(value == "" || length < 6){
    		$("#divTestName").addClass("has-error");
    		$("#divTestName").addClass("has-feedback");
    		$("#spanIcon").addClass("glyphicon-remove");
    		$("#spanIcon").addClass("form-control-feedback");
    	}
    		});
    $("#examname").focusout(function(){
    	var value = $("#examname").val();
    	var length = $("#examname").val().length;
    	if(value != "" && value != undefined){
    		if(length > 5){
    		$("#divExamName").removeClass("has-error");
    		$("#divExamName").removeClass("has-feedback");
    		$("#spanIconExam").removeClass("glyphicon-remove");
    		$("#spanIconExam").removeClass("form-control-feedback");
    		}
    	}
    	if(value == "" || length < 6){
    		$("#divExamName").addClass("has-error");
    		$("#divExamName").addClass("has-feedback");
    		$("#spanIconExam").addClass("glyphicon-remove");
    		$("#spanIconExam").addClass("form-control-feedback");
    	}
    		});
    $("#submitTest").click(function(){
    	var value = $("#examname").val();
    	var length = $("#examname").val().length;
    	if(value != "" && value != undefined){
    		if(length > 5){
    		$("#divExamName").removeClass("has-error");
    		$("#divExamName").removeClass("has-feedback");
    		$("#spanIconExam").removeClass("glyphicon-remove");
    		$("#spanIconExam").removeClass("form-control-feedback");
    		}
    	}
    	if(value == "" || length < 6){
    		$("#divExamName").addClass("has-error");
    		$("#divExamName").addClass("has-feedback");
    		$("#spanIconExam").addClass("glyphicon-remove");
    		$("#spanIconExam").addClass("form-control-feedback");
    	}
    		});
//slide image
    var slideCount = $('#slider ul li').length;
    var slideWidth = $('#slider ul li').width();
    var slideHeight = $('#slider ul li').height();
    var sliderUlWidth = slideCount * slideWidth;

    $('#slider').css({ width: slideWidth, height: slideHeight });
//hien thi li thu 2
    $('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
//them li cuoi vao dau ul, luc nay li thu nhat se hien thi (truoc no la li cuoi) 
    $('#slider ul li:last-child').prependTo('#slider ul');
	$('#slider ul').css("display","block");
    function moveRight() {
        $('#slider ul').animate({
            left: - slideWidth
        }, 1000, function () {
        	//them firstchild vao cuoi ul
        	// muc dich de dat lai left = 0
        	$('#slider ul li:first-child').appendTo('#slider ul');
            $('#slider ul').css('left', '0');
        });
    };
    setInterval(function () {
        moveRight();
    }, 6000);

});
