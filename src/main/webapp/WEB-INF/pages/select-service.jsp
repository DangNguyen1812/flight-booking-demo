<%-- 
    Document   : select-service
    Created on : Dec 3, 2021, 12:29:09 AM
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
        <div class="body-service-modal">
            <div class="modal-service-container">
                <div class="service-header">
                    <c:if test="${trip == 'one-way'}">
                        <div class="trip-name">
                            Trip
                        </div>   
                    </c:if>
                    <div class="passenger-service-name-wrap">
                        <c:forEach items="${listBookingDetail}" var="bookingDetail">
                            <div class="passenger-name-service" passengerServiceId="${bookingDetail.passengerEntity.idenCode}"
                                 flightId ="${bookingDetail.flightEntity.id}" >

                                <div class="passenger-name-detail-service" >
                                    ${bookingDetail.passengerEntity.fullName}
                                </div>

                                <div class="passenger-service-description">
                                    ${bookingDetail.luggageDescription}
                                </div>

                                <div class="service-id-db"></div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="service-body">
                    <c:forEach items="${luggageServices}" var="luggage">
                        <div class="luggage-box-all">
                            <div class="luggage-img"><i class="fas fa-suitcase-rolling"></i></div>
                            <div class="luggage-description">${luggage.description}</div>
                            <div class="luggage-price">${luggage.price}</div>
                            <div><i class="fas fa-plus-circle"></i></div>
                        </div>
                    </c:forEach>

                </div>
                <div class="service-footer">
                    <div class="service-confirm">
                        <div class="service-description">
                            Service
                        </div>
                        <div class="service-price">
                            0 VND
                        </div>

                    </div>
                    <div class="button-confirm-service">
                        <button class="btn-confirm-service">Confirm</button>
                    </div>
                </div>
            </div>

        </div>   
    </body>
</html>
