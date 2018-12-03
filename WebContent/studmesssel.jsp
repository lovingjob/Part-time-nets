<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>学生个人信息</title>
</head>
<body>
<%! Integer class_id=-1, major_id=-1;
String  score,name1,gender,name2,name3,year; 
%>
<% 
try{
	
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/stsystem","root","111111"); 
    
    String name=(String)session.getAttribute("name");//重新获取登入者名
    String t="select * from student where score='"+name+"'"; //查询学生信息
     
     Statement sql=con.createStatement();
     ResultSet rs=sql.executeQuery(t);
     if(rs.next()){
    	 Integer id= rs.getInt("id");
    	   score=rs.getString("score");
    	   name1=rs.getString("sname");
    	 String  pwd=rs.getString("studentPwd");
    	   gender=rs.getString("gender");
    	
    	 class_id= rs.getInt("class_id");
     }
     String t1="select * from class where id='"+class_id+"'";//查询学生所在班级信息
     
     rs=sql.executeQuery(t1);
     if(rs.next()){
    	 Integer id1= rs.getInt("id");
    	       name2=rs.getString("cname");
         year=(String)rs.getString("year");
    
     }
     String t2="select * from major where major_id='"+class_id+"'";
   
     rs=sql.executeQuery(t2);
     if(rs.next()){
    	 Integer id2= rs.getInt("major_id");
    	  name3=rs.getString("name");
    	 
     }
}
catch(Exception e){
	out.println(e);}
%>

<table  width="80%"height="80%" bgcolor="green" boder="20">
<tr><td rowspan="7" bgcolor="green" align="center"> 
<table boder="20" bgcolor="blue"height="300" width="200">
<tr><td align="center"  colspan="2">学生个人信息</td></tr>
<tr><td  bgcolor="white"><font  size="4">学号</font></td><td width="70%" bgcolor="white"><font size="3"><%=score%></font></td></tr>
<tr><td  bgcolor="white"><font  size="4">姓名</font></td><td width="70%" bgcolor="white"><font size="3"><%=name1%></font></td></tr>
<tr><td  bgcolor="white"><font  size="4">性别</font></td><td width="70%" bgcolor="white"><font size="3"><%=gender%></font></td></tr>
<tr><td  bgcolor="white"><font  size="4">班级</font></td><td width="70%" bgcolor="white"><font size="3"><%=name2%></font></td></tr>
<tr><td  bgcolor="white"><font  size="4">专业名称</font></td><td  width="70%" bgcolor="white"><font size="3"><%=name3%></font></td></tr>
<tr><td  bgcolor="white"><font  size="4">入学年份</font></td><td width="70%" bgcolor="white"><font size="3"><%=year%></font></td></tr>
</table>

</td> <td bgcolor="#00509F" width="20%" height="40">学生选课系统</td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="studmesssel.jsp">学生信息</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="stuchangesecret.jsp">密码修改</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="choosecourse.jsp">选课</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="courseselect.jsp">选课查询及退选</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="gradeselect.jsp">成绩查询</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="zhuxiao.jsp">注销</a></td></tr>
</table>
</body>
</html>