<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="currencies" class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" scope="request"/>
<link href="Style.css" rel="stylesheet" type="text/css">

<html>
<body>
<%
    out.println("<h1>" + "Exchange Rates for " + request.getParameter("from") + "</h1>");
%>
</body>
</html>