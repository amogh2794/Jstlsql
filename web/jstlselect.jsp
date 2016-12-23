<%-- 
    Document   : jstlselect
    Created on : Dec 23, 2016, 11:54:55 AM
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
        <sql:query dataSource="${emp}" var="result">
            select * from emp
        </sql:query>
    <center><h1>Select Statement</h1>
        <h3>Employee table</h3></center>
    <table align="center" border="1">
        <tr>
            <th>Emp ID</th>
            <th>FName</th>
            <th>LName</th>
            <th>Basic Pay</th>
            <th>Gender</th>
            <th>DOB</th>
        </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.empno}"/></td> 
                    <td><c:out value="${row.fname}"/></td>
                    <td><c:out value="${row.lname}"/></td>
                    <td><c:out value="${row.basicsalary}"/></td> 
                    <td><c:out value="${row.gender}"/></td>
                    <td><fmt:formatDate value="${row.dob}" type="date"/></td>
                </tr>
            </c:forEach>
    </table> 
    </body>
</html>
