<%-- 
    Document   : mail
    Created on : Dec 1, 2021, 9:54:49 PM
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
        <div style="margin: 8px 8px;font-size: 22px;font-weight: 600;color: #000;">Booking information</div>
        <table style="border-collapse: collapse;border:1px solid black;">
            <tr style="border:1px solid black;font-size: 18px;
                font-weight: 600;background:linear-gradient(90deg,#e60000,#ff944d);color: #e6b800">
                <td style="padding: 8px 20px;border:1px solid black; ">Booking date</td>
                <td style="padding: 8px 20px;border:1px solid black ">The representative</td>
                <td style="padding: 8px 20px; border:1px solid black">Phone</td>
                <td style="padding: 8px 20px; border:1px solid black">Email</td>
                <td style="padding: 8px 20px; border:1px solid black">Total price</td>
            </tr>
            <tr style="border:1px solid black;font-size: 18px;font-weight: 600">                            
                <td style="padding: 8px 20px;border:1px solid black">${booking.bookingDate}</td>
                <td style="padding: 8px 20px;border:1px solid black">${booking.fullName}</td>
                <td style="padding: 8px 20px;border:1px solid black">${booking.phone}</td>
                <td style="padding: 8px 20px;border:1px solid black">${booking.email}</td>
                <td style="padding: 8px 20px;border:1px solid black">${totalPrice} VND</td>
            </tr>
        </table>

        <div style="margin: 8px 8px;font-size: 22px;font-weight: 600;color: #000;"> Passenger Information </div>
        <table style="border-collapse: collapse;border:1px solid black;">
            <tr style="border:1px solid black;font-size: 18px;
                font-weight: 600;background:linear-gradient(90deg,#e60000,#ff944d);color: #e6b800">
                <td style="padding: 8px 20px;border:1px solid black; ">Name</td>
                <td style="padding: 8px 20px;border:1px solid black; ">Email</td>
                <td style="padding: 8px 20px;border:1px solid black; ">Phone number</td>
                <td style="padding: 8px 20px;border:1px solid black; ">Seat</td>
                <td style="padding: 8px 20px;border:1px solid black; ">Luggage</td>
                <td style="padding: 8px 20px;border:1px solid black; ">Flight</td>
            </tr>
            <c:forEach items="${listBookingDetail}" var="bookingDetail">

                <tr style="border:1px solid black;font-size: 18px;font-weight: 600">
                    <td style="padding: 8px 20px;border:1px solid black">${bookingDetail.passengerEntity.fullName}</td>
                    <td style="padding: 8px 20px;border:1px solid black">${bookingDetail.passengerEntity.email}</td>
                    <td style="padding: 8px 20px;border:1px solid black">${bookingDetail.passengerEntity.phone}</td>                    
                    <td style="padding: 8px 20px;border:1px solid black">${bookingDetail.seatEntity.number}</td>                    
                    <td style="padding: 8px 20px;border:1px solid black">${bookingDetail.serviceBookingEntity.get(0).serviceEntity.description}</td>
                    <td style="padding: 8px 20px;border:1px solid black">VJ${bookingDetail.flightEntity.id} </td>
                </tr>
            </c:forEach>
        </table>
        <div style="margin: 8px 8px;font-size: 22px;font-weight: 600;color: #000;">Flight Information</div>
        <table style="border-collapse: collapse;border:1px solid black;">
            <tr style="border:1px solid black;font-size: 18px;
                font-weight: 600;background:linear-gradient(90deg,#e60000,#ff944d);color: #e6b800">
                <td style="padding: 8px 20px;border:1px solid black; ">Flight </td>
                <td style="padding: 8px 20px;border:1px solid black; ">Date</td>
                <td style="padding: 8px 20px;border:1px solid black; ">Departure</td>
                <td style="padding: 8px 20px;border:1px solid black; ">Destination</td>
                <td style="padding: 8px 20px;border:1px solid black; ">Depart time</td>
                <td style="padding: 8px 20px;border:1px solid black; ">Arrival time</td>
            </tr>
            <tr style="border:1px solid black;font-size: 18px;font-weight: 600">
                <td style="padding: 8px 20px;border:1px solid black">VJ${flight.id}</td>
                <td style="padding: 8px 20px;border:1px solid black">${flight.departDate}</td>
                <td style="padding: 8px 20px;border:1px solid black">${flight.flightRouteEntity.departure.cityEntity.name}</td>
                <td style="padding: 8px 20px;border:1px solid black">${flight.flightRouteEntity.destination.cityEntity.name}</td>
                <td style="padding: 8px 20px;border:1px solid black">${flight.departTime}</td>
                <td style="padding: 8px 20px;border:1px solid black">${flight.arrivalTime}</td>
            </tr>
        </table>
    </body>
</html>
