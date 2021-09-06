<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="currencies" class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" scope="request"/>
<link href="Style.css" rel="stylesheet" type="text/css">

<html>
<body>
<%
    String referenceCurrency = request.getParameter("from");
    out.println("<h1>" + "Exchange Rates for " + referenceCurrency + "</h1>");
%>
<ul>
    <%
        ArrayList<Map.Entry<String, BigDecimal>> list = new ArrayList<>(currencies.getExchangeRates(referenceCurrency).entrySet());
        for (Map.Entry<String, BigDecimal> stringBigDecimalEntry : list) {
            if (!stringBigDecimalEntry.getKey().equals(referenceCurrency)) {
                out.println("<li>" + stringBigDecimalEntry + "</li>");
            }
        }
    %>
</ul>
</body>
</html>