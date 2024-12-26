<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="course.Course"%>
<%@ page import="course.CourseDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
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
		int courseID = 0;
		if (request.getParameter("courseID") != null) {
			courseID = Integer.parseInt(request.getParameter("courseID"));
		}
		if (courseID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'course.jsp'");
			script.println("</script>");
		}
		Course course = new CourseDAO().getCourse(courseID);
	%>

    <nav class ="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
            </button>
            <a class ="navbar-brand" href="main.jsp">건양대학교</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="main.jsp">Home</a></li>
                <li class="active"><a href="course.jsp">Review</a></li>
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
					</ul>
				</li>
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
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<div class="container">
		<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">상세 정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">과목명(교수님)</td>
							<td colspan="2"><%= course.getCourseTitle() %></td>
						</tr>
						<tr>
							<td>작성자</td>	
							<td colspan="2"><%= course.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td colspan="2"><%= course.getCourseDate().substring(0, 11) + course.getCourseDate().substring(11, 13) + "시"
							+ course.getCourseDate().substring(14, 16) + "분"%></td>
						</tr>
						<tr>
							<td>수강 후기</td>	
							<td colspan="2" style="min-height: 200px; text-align: left;">
							<%= course.getCourseContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>")%></td>
						</tr>
					</tbody>
				</table>
				<a href = "course.jsp" class="btn btn-primary">목록</a>
				
				<%
					if(userID != null && userID.equals(course.getUserID())){
				%>
						<a href="update.jsp?courseID=<%= courseID %>" class="btn btn-primary">수정</a>
						<a onclick="return confirm('삭제하시겠습니까?')" href="deleteAct.jsp?courseID=<%= courseID %>" class="btn btn-primary">삭제</a>
				<%					
					}

				%>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>