<%-- 
    Document   : jstldelete
    Created on : Dec 27, 2016, 1:08:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Operation</title>
    </head>
    <body>
         <sql:setDataSource var="emp" driver="oracle.jdbc.driver.OracleDriver"
                           url="jdbc:oracle:thin:@172.16.20.20:1521:orcl"
                           user="c##mca52" password="mca52"/>
        <form action="jstldelete.jsp">
            Employee ID:<input type="text" name="txtid"><br> <br>
            Employee FName:<input type="text" name="txtfnm"><br> <br>
            <input type="submit" value="Update">
        </form>
                    
        <sql:update dataSource="${emp}" var="result">
            delete from emp where empno='${param.empno}' 
        </sql:update>
            
                <h1>record deleted</h1>
            
            
  
    </body>
</html>
