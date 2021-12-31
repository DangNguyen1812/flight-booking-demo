<%-- 
    Document   : payment
    Created on : Nov 29, 2021, 5:13:56 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Document : book2 Created on : Oct 30, 2021, 2:44:44 PM Author : ADMIN --%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finish</title>

        <jsp:include page="include/user/css-page.jsp" />
        <jsp:include page="include/user/js-page.jsp" />
        <link rel="stylesheet" href="<c:url value="/resources/css/booking.css"/>" type="text/css"/>


    </head>

    <body id="page1">
        <div class="main">

            <jsp:include page="include/user/menu.jsp" />
            <div class="content">
                <div class="success-header">
                    <div class="success-name">
                        <img src="<c:url value="/resources/images/success-green-check-mark.png"/>">
                        Successful transaction
                    </div>
                    <div class="sucess-notification"> You paid <span class="notice-bold"> <fmt:formatNumber pattern="#,##0" value="${totalPrice}"/> VND </span> for a ${trip} flight from
                        <span class="notice-bold">${flight.flightRouteEntity.departure.cityEntity.name} </span>
                        to <span class="notice-bold">${flight.flightRouteEntity.destination.cityEntity.name}</span>.
                        Thank you for using the service!</div>
                </div>
                <div class="booking-info-head">
                    Booking Info
                </div>
                <div class="booking-represent-box">
                    <div class="represent-name represent-flex">
                        <div class="represent-name-left">The representative</div>
                        <div class="represent-name-right">${booking.fullName}</div>
                    </div>

                    <div class="represent-flex">
                        <div>Phone number</div>
                        <div>${booking.phone}</div>
                    </div>

                    <div class="represent-flex">
                        <div>Booking date</div>
                        <div><fmt:formatDate type = "date" dateStyle = "short"
                                        value = "${booking.bookingDate}" /></div>
                    </div>

                    <div class="represent-flex">
                        <div>Email address</div>
                        <div>${booking.email}</div>
                    </div>

                    <div class="represent-flex represent-total-price">
                        <div>Total price</div>
                        <div class="color-red"> <fmt:formatNumber pattern="#,##0" value="${totalPrice}"/> VND</div>
                    </div>
                </div>
                <div class="booking-info-head">
                    Flight information
                </div>
                <div class="flight-wrap-box">
                    <div class="flight-trip-header">
                        Trip
                    </div>
                    <div class="flight-trip-date">
                        <div><fmt:formatDate type = "date" pattern="E"
                                        value = "${flight.departDate}" />,
                            <fmt:formatDate type = "date" dateStyle = "short"
                                            value = "${flight.departDate}" />, VJ${flight.id}</div>
                    </div>
                    <div class="flight-trip-content">
                        <div class="flight-trip-content-left">
                            <div>
                                <div class="flight-trip-city">${flight.flightRouteEntity.departure.name}</div>
                                <div class="flight-trip-time">
                                    <fmt:formatDate type = "time" timeStyle = "short"
                                                    value = "${flight.departTime}" />
                                </div>
                            </div>
                            <div class="flight-trip-detail">
                                <div>${flight.flightRouteEntity.duration} minutes</div>
                                <div>Detail</div>
                            </div>
                            <div>
                                <div class="flight-trip-city">${flight.flightRouteEntity.destination.name}</div>
                                <div class="flight-trip-time">
                                    <fmt:formatDate type = "time" timeStyle = "short"
                                                    value = "${flight.arrivalTime}" />
                                </div>
                            </div>
                        </div>
                        <div class="flight-trip-content-right">
                            <div class="flight-trip-right-passenger">${passenger} passenger</div>
                            <div class="color-red flight-trip-price"><fmt:formatNumber pattern="#,##0" value="${totalPrice}"/> VND</div>
                        </div>
                    </div>
                </div>
                <div class="passenger-info-wrap">
                    <div class="passenger-info-header">
                        Passenger Information
                    </div>
                    <div>
                        <c:forEach items="${listBookingDetail}" var="bookingDetail">
                            <div class="passenger-detail-box">
                                <div class="passenger-name2">Passenger: <span class="text-uppercase">${bookingDetail.passengerEntity.fullName} </span></div>
                                <div class="depart-from-to">
                                    ${flight.flightRouteEntity.departure.name} - ${flight.flightRouteEntity.destination.name}
                                </div>
                                <div class="seat-number">Seat number : ${bookingDetail.seatEntity.number}</div>
                                <div class="signed-luggage">Signed luggage : ${bookingDetail.serviceBookingEntity.get(0).serviceEntity.description}</div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <div class="btn-return">
                    <a class="btn-finish" href="<c:url value="finish"/>">Finish</a>
                </div>
            </div>
        </div>

        <jsp:include page="include/user/footer.jsp" />

    </div>
    <script type="text/javascript">Cufon.now();</script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('.form_5').jqTransform({
                imgPath: 'jqtransformplugin/img/'
            });
        });
    </script>

</body>

</html>

