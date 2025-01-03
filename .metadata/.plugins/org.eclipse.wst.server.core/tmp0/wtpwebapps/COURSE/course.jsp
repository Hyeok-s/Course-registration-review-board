<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="course.CourseDAO" %>
<%@ page import="course.Course" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<link rel="stylesheet" href="css/custom.css">
<title>수강 후기</title>
<style type = "text/css">
</style>
</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }

    int pageNumber = 1; 
    if (request.getParameter("pageNumber") != null)
    {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
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
                if(userID == null)
                {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
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
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
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
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th style="background-color:#eeeeee; text-align:center;">번호</th>
                        <th style="background-color:#eeeeee; text-align:center;">과목명(교수님)</th>
                        <th style="background-color:#eeeeee; text-align:center;">작성자</th>
                        <th style="background-color:#eeeeee; text-align:center;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                 	
 				<%
                    CourseDAO courseDAO = new CourseDAO();
                    ArrayList<Course> list = courseDAO.getList(pageNumber);
                	for(int i = 0; i < list.size(); i++)
                    {
                %>
                    <tr>
                        <td><%=list.get(i).getCourseID() %></td>
                        <td><a href="view.jsp?courseID=<%=list.get(i).getCourseID()%>"><%=list.get(i).getCourseTitle() %></a></td>
                        <td><%=list.get(i).getUserID() %></td>
                        <td><%=list.get(i).getCourseDate().substring(0,11) + list.get(i).getCourseDate().substring(11, 13) + "시" 
                        + list.get(i).getCourseDate().substring(14,16) + "분" %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <%
                if(pageNumber != 1) {
            %>
                <a href="course.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
            <%
                } if (courseDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="course.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
            <%
                }
            %>
            <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>