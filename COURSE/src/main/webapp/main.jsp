<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>수강 후기</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expand="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">건양대학교</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">Home</a></li>
				<li><a href="course.jsp">Review</a></li>
			</ul>
			<%
			if (userID == null) {
			%>		
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">로그인<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">메뉴<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAct.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
<div class="container">
<div class="jumbotron">
<h1>강의 후기</h1>
<p>이 사이트는 실제로 들었던 강의들을 소개하고 수강 신청시 도움이 되고자 만들었습니다.</p>
<p><a class="btn btn-primary btn-pull" href="https://www.konyang.ac.kr/kor.do" role="button">@Konyang University</a></p>
</div>
</div>
<div class="container">
<div id="myCarousel" class="carousel slide" data-rid="carousel">
<ol class="carousel-indicators">
<li data-target="#myCarousel" data-slice-to="0" class="active"></li>
<li data-target="#myCarousel" data-slice-to="1"></li>
<li data-target="#myCarousel" data-slice-to="2"></li>
</ol>
<div class="carousel-inner">
<div class="item active">
<img src="./images/1.png">
</div>
<div class="item">
<img src="./images/2.png">
</div>
<div class="item">
<img src="./images/3.png">
</div>
</div>
<a class="left carousel-control" href="#myCarousel" 
data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
</a> 
<a class="right carousel-control" href="#myCarousel" data-slide="next"> 
<span class="glyphicon glyphicon-chevron-right"></span>
</a>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>