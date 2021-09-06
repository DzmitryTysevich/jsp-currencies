<%@ page import="java.math.BigDecimal" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="currencies" class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" scope="request"/>
<link href="Style.css" rel="stylesheet" type="text/css">

<html>
<body>
<%
    String sourceCurrency = request.getParameter("from");
    String targetCurrency = request.getParameter("to");
    BigDecimal amount = new BigDecimal(request.getParameter("amount"));
    BigDecimal resultExchange = currencies.convert(amount, sourceCurrency, targetCurrency);

    out.println("<h1>" + "Converting " + sourceCurrency + " to " + targetCurrency + "</h1>");
    out.println("<p>" + "Amount " + sourceCurrency + " = " + amount + "</p>");
    out.println("<p>" + targetCurrency + " result value = " + resultExchange + "</p>");
%>
</body>
</html>