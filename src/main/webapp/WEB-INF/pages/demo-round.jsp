<%-- 
    Document   : demo-round
    Created on : Dec 7, 2021, 10:32:32 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>${flightGo.flightRouteEntity.departure.name}</div>
        <div>${flightGo.flightRouteEntity.destination.name}</div><br>
        <div>${flightReturn.flightRouteEntity.departure.name}</div>
        <div>${flightReturn.flightRouteEntity.destination.name}</div>
        <div>
            <button onclick="location.href = '<c:url value="/passenger"/>'" class="btn-go-on">Go on</button>
        </div>
    </body>
</html>
