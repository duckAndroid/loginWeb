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

<title>My JSP 'succ1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
		boolean hasLogined = false;
		String error = (String) session.getAttribute("error");
		if (error == null)
			error = "";

		Cookie[] cookies = request.getCookies();
		String username = null;
		String password = null;
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
		if (username != null && password != null
				&& !"duck".equals(username)) {
			hasLogined = true;
		}
		//以上是避免二次登录
	%>
	<%
		String msg;
		if (!hasLogined) {
			username = (String) session.getAttribute("username");
			if (username == null) {
				msg = "不要冒充领导";
			} else {
				msg = "欢迎" + username + "归来";
			}

		} else {
			msg = "欢迎" + username + "归来";
		}
	%>
	<h1>Success 1</h1>
	<h3><%=msg%></h3>
	<%
		if (username == null)
			return;
	%>
	<div>大爷，过来玩啊~ 来玩啊~ 玩~ 啊~ 啊~ 啊~</div>
</body>
</html>
