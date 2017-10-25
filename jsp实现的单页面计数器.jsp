<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,java.text.*"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>JSP计数器</title>
	</head>
	<body>
<%
//访问量统计
//如果统计单页面的访问量，则可以修改Count和Counter的名称，并把访问量保存到不同的txt文本中去
	Integer Count = 
		      (Integer)application.getAttribute("Counter");
		    if( Count ==null || Count == 0 ){
		       Count = 1;
		    }else{
		       Count+=1;
		    }
		    application.setAttribute("Counter", Count);
    
    //写入txt文本
    //手动新建一个文件夹
    	String count=getServletContext().getRealPath("/")+"Allcount//"; 
    	
    	File dirFile = new File(count);
			 if (!dirFile.exists()) {
			     dirFile.mkdirs();//如果不存在则创建文件夹
				//dirFile.delete();//删除文件夹
			 }
	  	String filename=count+"count.txt";
	    
	    try{
	    	PrintWriter pw = new PrintWriter(new FileWriter(filename)); 
		     pw.println("count2.jsp页面访问量目前是："+Count); 
		     pw.close(); 
	    	 
	    }catch(IOException e) { 
	    	out.println(e.getMessage()); 
	    }
%>

		<p>页面访问量为:<%= Count%></p>
		<p>文件count.txt的绝对地址：<%= filename%></p>
	</body>

</html>