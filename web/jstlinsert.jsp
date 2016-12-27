<%-- 
    Document   : jstlinsert
    Created on : Dec 27, 2016, 12:27:46 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="emp" driver="oracle.jdbc.driver.OracleDriver"
                           url="jdbc:oracle:thin:@172.16.20.20:1521:orcl"
                           user="c##mca52" password="mca52"/>
        <form action="jstlinsert.jsp">
            Employee ID:<input type="text" name="txtid"><br> <br>
            Employee FName:<input type="text" name="txtfnm"><br><br>
            Employee LName:<input type="text" name="txtlnm"><br><br>
            Employee DOB:<input type="text" name="txtdob"><br><br>
            Employee Gender:<input type="text" name="txtgen"><br><br>
            Employee Hire Date:<input type="text" name="txthdt"><br><br>
            Employee Basic Salary:<input type="text" name="txtbsal"><br><br>
            Employee Dept Id:<input type="text" name="txtdid"><br><br>
            <input type=submit value="Insert">
        </form>
        <sql:update dataSource="${emp}" var="result">
            insert into emp values(?,?,?,?,?,?,?,?)
            <sql:param value="${param.txtid}"/>
            <sql:param value="${param.txtfnm}"/>
            <sql:param value="${param.txtlnm}"/>
            <sql:param value="${param.txtdob}"/>
            <sql:param value="${param.txtgen}"/>
            <sql:param value="${param.txthdt}"/>
            <sql:param value="${param.txtbsal}"/>
            <sql:param value="${param.txtdid}"/>
        </sql:update>
            <c:if test="${count>=1}">
                <h1>Congratulations record inserted</h1>
            </c:if>
            <sql:query dataSource="${emp}" var="result">
                select * from emp
            </sql:query>
                <div id="div2" style="display:none;"> <center><h1>Employee Table</h1>
        <h3>Employee table</h3></center>
    <table align="center" border="1">
        <tr>
            <th>Emp ID</th>
            <th>FName</th>
            <th>LName</th>
            <th>Basic Pay</th>
            <th>Gender</th>
            <th>DOB</th>
            <th>hire Date</th>
        </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.empno}"/></td> 
                    <td><c:out value="${row.fname}"/></td>
                    <td><c:out value="${row.lname}"/></td>
                    <td><c:out value="${row.basicsalary}"/></td> 
                    <td><c:out value="${row.gender}"/></td>
                    <td><fmt:formatDate value="${row.dob}" type="date"/></td>
                    <td><fmt:formatDate value="${row.hiredate}" type="date"/></td>
                </tr>
            </c:forEach>
    </table> 
                </div>
    </body>
</html>


