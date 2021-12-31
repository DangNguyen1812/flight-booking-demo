<%-- 
    Document   : view-flight
    Created on : Nov 2, 2021, 9:42:44 AM
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
        <table>
            <c:forEach items="${flights}" var="flight">
                <tr>
                    <td>${flight.departDate}</td>
                    <td>${flight.departTime}</td>
                    <td>${flight.flightRouteEntity.departure.name}</td>
                    <td>${flight.flightRouteEntity.destination.name}</td>
                    <td>${flight.airlineEntity.name}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
