<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.io.JSPCount"%>
<html>
<html>
<head>
	<meta charset="utf-8"/>
<title>访问量统计</title>
</head>
<body>
<%
    JSPCount CountFileHandler = new JSPCount(); 
	 //读取文件 ,文件保存在Tomcat根目录下
	 long count = CountFileHandler.readFromFile(request.getRealPath("/") + "count.txt"); 
	 count = count + 1; //修改记录 +1 
	 out.print(count); //显示数据 
	 //更新文件内容。 
	 CountFileHandler.write2File(request.getRealPath("/") + "count.txt", count); 
%>

<p>页面访问量为: <%= count%></p>

</body>
</html>