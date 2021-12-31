<%-- 
    Document   : demofetch
    Created on : Nov 10, 2021, 3:19:26 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <select id="departure"></select>
    <select id="destination"></select>
    </head>
    <body>
        <h1>Hello World!</h1>
        <script type="text/javascript" src="<c:url value="/resources/js/demofetch.js"/>"></script>
    </body>
</html>
