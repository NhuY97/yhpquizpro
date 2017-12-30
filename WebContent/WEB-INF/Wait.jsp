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
<title>Quiz Professional</title>
<link rel="stylesheet" href="DongHoDemNguoc.css" />
</head>

<body>
	<div id="a">	
    	<h1 ><a style="color:inherit;text-decoration:none" href="student-home-page">Hiện tại không nằm trong thời gian làm bài thi !</a></h1>
    </div>
	<div id="countdown">
      <div id='tiles'></div>
      <div class="labels">
        <li>Days</li>
        <li>Hours</li>
        <li>Mins</li>
    	<li>Secs</li>
 	  </div>
</div>
<div style="display:none">
<form action="DoExam">
<button type="submit" id="subDoExam" ></button>
</form>
</div>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="DongHoDemNguoc.js"></script>
<script type="text/javascript">
var target_date = ${requestScope.time}; // set the countdown date
var days, hours, minutes, seconds; // variables for time units

var countdown = document.getElementById("tiles"); // get tag element

getCountdown();

setInterval(function () { getCountdown(); }, 1000);

function getCountdown(){

	// find the amount of "seconds" between now and target
	var current_date = new Date().getTime();
	var seconds_left = (target_date - current_date) / 1000;
	//
	if(seconds_left<0)
	{
		$("#subDoExam").click();
	}
	//
	days = pad( parseInt(seconds_left / 86400) );
	seconds_left = seconds_left % 86400;
		 
	hours = pad( parseInt(seconds_left / 3600) );
	seconds_left = seconds_left % 3600;
		  
	minutes = pad( parseInt(seconds_left / 60) );
	seconds = pad( parseInt( seconds_left % 60 ) );

	// format countdown string + set tag value
	countdown.innerHTML = "<span>" + days + "</span><span>" + hours + "</span><span>" + minutes + "</span><span>" + seconds + "</span>"; 
}

function pad(n) {
	return (n < 10 ? '0' : '') + n;
}

// JavaScript Document
</script>
</body>
</html>
