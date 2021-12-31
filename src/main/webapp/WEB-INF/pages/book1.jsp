<%-- 
    Document   : book2
    Created on : Oct 30, 2021, 2:44:44 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Flight</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <jsp:include page="include/user/css-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>

        <link rel="stylesheet" href="<c:url value="/resources/css/select-flight.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/themify-icons/themify-icons.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/bookingdetail.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/fontawesome-free-5.15.4-web/css/all.min.css"/>" type="text/css"/>
    </head>
    <body id="page1">
        <div class="main">
            <!--header -->
            <jsp:include page="include/user/menu.jsp"/>
            <!-- / header -->
            <!--content -->
            <div class="content">
                <div class="flight">
                    <jsp:include page="trip-info.jsp"/>
                    <div class="trip-content">
                        <div class="trip-content-left">
                            <div class="trip-1">
                                Trip | <fmt:formatDate type="date" dateStyle="short" value="${flight.departDate}"/>
                            </div>
                            <div class="flight-fully-item fix-fully-item" id="item${flight.id}" style="margin-top: 0px;margin-top: -1px">
                                <div class="flight-item flight-item-fix">
                                    <div class="flight-info flight-info-fix">
                                        <div class="flight-info-left">
                                            <div class="airport-name">${flight.flightRouteEntity.departure.name}</div><br>
                                            <div>
                                                <fmt:formatDate type="time" timeStyle="short" value="${flight.departTime}"/>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="flight-time">${flight.flightRouteEntity.duration} minutes</div><br>
                                            <div class="detail-path">Detail <i class="ti-angle-down"></i></div>
                                        </div>
                                        <div class="flight-info-left">
                                            <div class="airport-name">${flight.flightRouteEntity.destination.name}</div><br>
                                            <div>
                                                <fmt:formatDate type="time" timeStyle="short" value="${flight.arrivalTime}"/>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="flight-amount flight-amount-fix">
                                        Price:<br>
                                        <fmt:formatNumber pattern="#,##0" value="${(flight.flightRouteEntity.standardPrice)*passenger}" /> VND
                                    </div>
                                </div>

                                <div class="flight-info-detail">
                                    <div class="flight-number">
                                        Flight number: VJ${flight.id}
                                    </div>
                                    <div class="flight-depart-detail">                                        
                                        <div>Departure: </div>
                                        <div>${flight.departTime}</div>
                                        <div>${flight.departDate}</div>
                                        <div>${flight.flightRouteEntity.departure.cityEntity.name}</div>
                                    </div>
                                    <div class="flight-return-detail">
                                        <div>Destination: </div>
                                        <div>${flight.arrivalTime}</div>
                                        <div>${flight.departDate}</div>
                                        <div>${flight.flightRouteEntity.destination.cityEntity.name}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-wrap">
                                <button onclick="location.href = '<c:url value="/passenger"/>'" class="btn-go-on">
                                    Go on
                                </button>
                            </div> 
                        </div>
                        <jsp:include page="booking-detail-right.jsp"/>
                    </div>




                </div>
            </div>
            <jsp:include page="include/user/footer.jsp"/>
        </div>
        <script src="<c:url value="/resources/js/booking-detail-right.js"/>"></script>
        <script src="<c:url value="/resources/js/select_flight.js"/>"></script>
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
