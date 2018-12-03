<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>登入验证</title>
</head>
<body>
<%
Connection con; 
Statement sql; 
ResultSet rs;   
String name=(String)request.getParameter("user");        
String password=(String)request.getParameter("password");
String select=(String)request.getParameter("userselect");

String submit1=(String)request.getParameter("submit1");
String submit2=(String)request.getParameter("submit2");  
String selectnumber="0";  //创建存储登入者类型保存对象
try{Class.forName("com.mysql.jdbc.Driver");}
catch(Exception e)
{out.println("未加载驱动！");}
try{
	 //连接数据库
    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/stsystem", "root", "111111");
    /*学生验证*/
    if(select.equals("a")){
 
    	String t="select * from student where score='"+name+"' and studentPwd='"+password+"'";//数据库查询登入者
    	sql=con.createStatement();
    	rs=sql.executeQuery(t);
    	if(rs.next()){
    		selectnumber="a";
    		session.setAttribute("selectnumber",selectnumber);//保存登入者类型的相关信息
    		session.setAttribute("name",name);                //保存登入者名字
    		out.println("登入成功！页面转载中。。。。。");
    		response.sendRedirect("studentindex.html");
    	}
    	else{
    		 out.println("登入名或密码有误！");
    		 %>
    		 <a href=index.html>返回主界面</a>
    		 <% 
    		 }
   
    }
    /*教师验证*/
    if(select.equals("b")){
    	String t="select * from teacher where tcode='"+name+"' and teacherPwd='"+password+"'";//数据库查询登入者
    	sql=con.createStatement();
    	rs=sql.executeQuery(t);
    	if(rs.next()){
    		selectnumber="b";
    		session.setAttribute("selectnumber",selectnumber);//保存登入者类型的相关信息
    		session.setAttribute("name",name);                //保存登入者名字
    		out.println("登入成功！页面转载中。。。。。");
    		response.sendRedirect("teacherindex.html");
    	}
    	else{
    		 out.println("登入名或密码有误！");
    		 %>
    		<a href=index.html>返回主界面</a>;
    		<%
    		 
    		 }
    }
   
    
   }
catch(Exception e)
{out.println(e);}
%>
</body>
</html>