<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="course.CourseDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<jsp:useBean id="course" class="course.Course" scope="page" />
<jsp:setProperty name="course" property="courseTitle" />
<jsp:setProperty name="course" property="courseContent" />
<%
	System.out.println(course);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강 후기</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if (course.getCourseTitle() == null || course.getCourseContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('제목이나 내용에 입력된 사항이 없습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				CourseDAO CourseDAO = new CourseDAO();
				int result = CourseDAO.write(course.getCourseTitle(), userID, course.getCourseContent());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='course.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>