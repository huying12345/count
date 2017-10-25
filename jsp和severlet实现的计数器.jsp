<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%--引入com.io包里面的count类--%>
<%@ page import="com.io.count"%>
<html>
<html>
<head>
	<meta charset="utf-8"/>
<title>访问量统计</title>
</head>
<body>
<%
	//调用count类
    count CountFileHandler = new count();
	 //readFromFile方法读取文件 ,文件保存在项目的根目录下
	 long count = CountFileHandler.readFromFile(request.getRealPath("/") + "count.txt");
	 count = count + 1; //修改记录 +1
	 out.print("访问量目前是："+count+"位"); //显示数据
	 //write2File方法写入文件内容并更新
	 CountFileHandler.write2File(request.getRealPath("/") + "count.txt", count);
%>

<p>页面访问量为: <%= count%></p>
<p>count.txt文本的绝对地址是：<%= request.getRealPath("/")+"count.txt"%></p>

</body>
</html>