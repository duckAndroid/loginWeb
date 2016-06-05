<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<%
	String error = (String) session.getAttribute("error");
	if (error == null)
		error = "";

	Cookie[] cookies = request.getCookies();
	String username = "";
	String password = "";
	if (cookies != null) {
		for (Cookie c : cookies) {
			if ("username".equals(c.getName())) {
				username = c.getValue();
			} else if ("password".equals(c.getName())) {
				password = c.getValue();
			}
		}
	}
	username = URLDecoder.decode(username, "utf-8");
%>
<!-- 记住用户名和密码的案例 -->
<body>
	<h1>Login</h1>
	<h4 style="color:red"><%=error%></h4>
	<form action="/dc11/L" method="post">
		<span>用户名：</span> <input type="text" name="username"
			value="<%=username%>"><br /> <span>密 码：</span> <input
			type="password" name="password" value="<%=password%>"><br />
		<input type="submit" value="LOGIN" />
	</form>
</body>
</html>
