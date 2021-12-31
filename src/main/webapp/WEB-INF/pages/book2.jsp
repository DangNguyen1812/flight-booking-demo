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
        <title>Select flight</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <jsp:include page="include/user/css-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/select-flight.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/themify-icons/themify-icons.css"/>" type="text/css"/>
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

                    <c:if test="${message != null}">
                        <div>${message}</div>
                        <div>button-new search</div>
                    </c:if>
                    <c:if test="${trip == 'one-way'}">
                        <div class="flight-wrapper">

                            <c:forEach items="${flights}" var="flight" varStatus="index">
                                <c:if test="${index.index == 0}">
                                    <div class="trip-trip">
                                        Trip
                                    </div>
                                </c:if>
                                <div class="flight-fully-item js-fully-item" id="item${flight.id}" flightId="${flight.id}">
                                    <div class="flight-item" >
                                        <div class="flight-info">
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
                                        <div class="flight-amount">
                                            From <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice}" /> <br>
                                            VND<br>
                                            5 seats left
                                        </div>
                                    </div>
                                    <div class="flight-ticket-type">
                                        <div class="ticket-type">
                                            <div class="type-ticket-name">First class</div>
                                            <ul>
                                                <li><i class="ti-check"></i>10kg checked luggage</li>
                                                <li><i class="ti-check"></i>12kg hand baggage</li>
                                                <li><i class="ti-check"></i>Free ticket exchange</li>
                                                <li><i class="ti-check"></i>Free return ticket</li>
                                                <li><i class="ti-check"></i>Priority for check-in procedures</li>
                                            </ul>
                                            <div class="flight-price">
                                                <button class="btn-price" onclick="location.href = '<c:url value="/bookingDetail/${flight.id}/${seatType.get(0).id}"/>'">
                                                    <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(0).price}" /> VND
                                                </button>

                                            </div>
                                        </div>
                                        <div class="ticket-type">
                                            <div class="type-ticket-name">Business</div>
                                            <ul>
                                                <li><i class="ti-check"></i>7kg checked luggage</li>
                                                <li><i class="ti-check"></i>12kg hand baggage</li>
                                                <li><i class="ti-check"></i>Free ticket exchange</li>
                                                <li><i class="ti-check"></i>500.000 VND for return ticket</li>

                                            </ul>
                                            <div class="flight-price">
                                                <button class="btn-price" onclick="location.href = '<c:url value="/bookingDetail/${flight.id}/${seatType.get(1).id}"/>'">
                                                    <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice}" /> VND
                                                </button>

                                            </div>
                                        </div>
                                        <div class="ticket-type">
                                            <div class="type-ticket-name">Economy</div>
                                            <ul>                                        
                                                <li><i class="ti-check"></i>12kg hand baggage</li>
                                                <li><i class="ti-check"></i>Free ticket exchange</li>
                                            </ul>
                                            <div class="flight-price">
                                                <button class="btn-price" onclick="location.href = '<c:url value="/bookingDetail/${flight.id}/${seatType.get(2).id}"/>'">
                                                    <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(2).price}" /> VND
                                                </button>

                                            </div>
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
                            </c:forEach>
                        </div>
                    </c:if>

                    <c:if test="${trip == 'round'}">
                        <div class="flight-wrapper">
                            <div class="flight-go-wrapper">
                                <c:forEach items="${flights}" var="flight">
                                    <div class="flight-fully-item js-fully-item-go" id="item${flight.id}" flightId="${flight.id}" >
                                        <div class="flight-item" >
                                            <div class="flight-info">
                                                <div class="flight-info-left">
                                                    <div class="airport-name">${flight.flightRouteEntity.departure.name}</div><br>
                                                    <div>${flight.departTime}</div>
                                                </div>
                                                <div>
                                                    <div class="flight-time">2 hours 15 minutes abc</div><br>
                                                    <div class="detail-path">Detail <i class="ti-angle-down"></i></div>
                                                </div>
                                                <div class="flight-info-left">
                                                    <div class="airport-name">${flight.flightRouteEntity.destination.name}</div><br>
                                                    <div>${flight.departTime}</div>
                                                </div>

                                            </div>
                                            <div class="flight-amount">
                                                From <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(2).price}" /> <br>
                                                VND<br>
                                                3 seats left
                                            </div>
                                        </div>
                                        <div class="flight-ticket-type">
                                            <div class="ticket-type">
                                                <div class="type-ticket-name">First class</div>
                                                <ul>
                                                    <li><i class="ti-check"></i>10kg checked luggage</li>
                                                    <li><i class="ti-check"></i>12kg hand baggage</li>
                                                    <li><i class="ti-check"></i>Free ticket exchange</li>
                                                    <li><i class="ti-check"></i>Free return ticket</li>
                                                    <li><i class="ti-check"></i>Priority for check-in procedures</li>
                                                </ul>
                                                <div class="flight-price">
                                                    <button class="btn-price" onclick="location.href = '<c:url value="/bookingDetail/${flight.id}/${seatType.get(0).id}"/>'">
                                                        <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(0).price}" /> VND
                                                    </button>

                                                </div>
                                            </div>
                                            <div class="ticket-type">
                                                <div class="type-ticket-name">Business</div>
                                                <ul>
                                                    <li><i class="ti-check"></i>7kg checked luggage</li>
                                                    <li><i class="ti-check"></i>12kg hand baggage</li>
                                                    <li><i class="ti-check"></i>Free ticket exchange</li>
                                                    <li><i class="ti-check"></i>500.000 VND for return ticket</li>

                                                </ul>
                                                <div class="flight-price">
                                                    <button class="btn-price" onclick="location.href = '<c:url value="/bookingDetail/${flight.id}/${seatType.get(1).id}"/>'">
                                                        <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(1).price}" /> VND
                                                    </button>

                                                </div>
                                            </div>
                                            <div class="ticket-type">
                                                <div class="type-ticket-name">Economy</div>
                                                <ul>                                        
                                                    <li><i class="ti-check"></i>12kg hand baggage</li>
                                                    <li><i class="ti-check"></i>Free ticket exchange</li>
                                                </ul>
                                                <div class="flight-price">
                                                    <button class="btn-price" onclick="location.href = '<c:url value="/bookingDetail/${flight.id}/${seatType.get(2).id}"/>'">
                                                        <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(2).price}" /> VND
                                                    </button>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="flight-info-detail">
                                            <div class="flight-number">
                                                Flight number: VJ${flight.id}
                                            </div>
                                            <div>                                        
                                                <div>Departure: </div>
                                                <div>${flight.departTime}</div>
                                                <div>${flight.departDate}</div>
                                                <div>${flight.flightRouteEntity.departure.cityEntity.name}</div>
                                            </div>
                                            <div>
                                                <div>Destination: </div>
                                                <div>${flight.arrivalTime}</div>
                                                <div>${flight.returnDate}</div>
                                                <div>${flight.flightRouteEntity.destination.cityEntity.name}</div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="flight-return-wrapper">
                                <c:forEach items="${returnFlights}" var="flight">
                                    <div class="flight-fully-item js-fully-item-return" id="item${flight.id}" flightId="${flight.id}" >
                                        <div class="flight-item">
                                            <div class="flight-info">
                                                <div class="flight-info-left">
                                                    <div class="airport-name">${flight.flightRouteEntity.departure.name}</div><br>
                                                    <div>${flight.departTime}</div>
                                                </div>
                                                <div>
                                                    <div class="flight-time">2 hours 15 minutes abc</div><br>
                                                    <div class="detail-path">Detail <i class="ti-angle-down"></i></div>
                                                </div>
                                                <div class="flight-info-left">
                                                    <div class="airport-name">${flight.flightRouteEntity.destination.name}</div><br>
                                                    <div>${flight.departTime}</div>
                                                </div>

                                            </div>
                                            <div class="flight-amount">
                                                From <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(2).price}" /> <br>
                                                VND<br>
                                                3 seats left
                                            </div>
                                        </div>
                                        <div class="flight-ticket-type">
                                            <div class="ticket-type">
                                                <div class="type-ticket-name">First class</div>
                                                <ul>
                                                    <li><i class="ti-check"></i>10kg checked luggage</li>
                                                    <li><i class="ti-check"></i>12kg hand baggage</li>
                                                    <li><i class="ti-check"></i>Free ticket exchange</li>
                                                    <li><i class="ti-check"></i>Free return ticket</li>
                                                    <li><i class="ti-check"></i>Priority for check-in procedures</li>
                                                </ul>
                                                <div class="flight-price">
                                                    <button class="btn-price" onclick="location.href = '<c:url value="/bookingDetail/${flight.id}/${seatType.get(0).id}"/>'">
                                                        <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(0).price}" /> VND
                                                    </button>

                                                </div>
                                            </div>
                                            <div class="ticket-type">
                                                <div class="type-ticket-name">Business</div>
                                                <ul>
                                                    <li><i class="ti-check"></i>7kg checked luggage</li>
                                                    <li><i class="ti-check"></i>12kg hand baggage</li>
                                                    <li><i class="ti-check"></i>Free ticket exchange</li>
                                                    <li><i class="ti-check"></i>500.000 VND for return ticket</li>

                                                </ul>
                                                <div class="flight-price">
                                                    <button class="btn-price" onclick="location.href = '<c:url value="/bookingDetail/${flight.id}/${seatType.get(1).id}"/>'">
                                                        <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(1).price}" /> VND
                                                    </button>

                                                </div>
                                            </div>
                                            <div class="ticket-type">
                                                <div class="type-ticket-name">Economy</div>
                                                <ul>                                        
                                                    <li><i class="ti-check"></i>12kg hand baggage</li>
                                                    <li><i class="ti-check"></i>Free ticket exchange</li>
                                                </ul>
                                                <div class="flight-price">
                                                    <button class="btn-price" onclick="location.href = '<c:url value="/bookingDetail/${flight.id}/${seatType.get(2).id}"/>'">
                                                        <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice + seatType.get(2).price}" /> VND
                                                    </button>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="flight-info-detail">
                                            <div class="flight-number">
                                                Flight number: VJ${flight.id}
                                            </div>
                                            <div>                                        
                                                <div>Departure: </div>
                                                <div>${flight.departTime}</div>
                                                <div>${flight.departDate}</div>
                                                <div>${flight.flightRouteEntity.departure.cityEntity.name}</div>
                                            </div>
                                            <div>
                                                <div>Destination: </div>
                                                <div>${flight.arrivalTime}</div>
                                                <div>${flight.returnDate}</div>
                                                <div>${flight.flightRouteEntity.destination.cityEntity.name}</div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                    </c:if>
                </div>
            </div>




            <!--content end-->
            <!--footer -->
            <jsp:include page="include/user/footer.jsp"/>
            <!--footer end-->
        </div>
        <script src="<c:url value="/resources/js/select_flight.js"/>"></script>
        <script type="text/javascript">Cufon.now();</script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $('.form_5').jqTransform({
                    imgPath: 'jqtransformplugin/img/'
                });
            });
        </script>
        <script>
//            var typeTicketElements = Array.from(document.querySelectorAll('.flight-ticket-type'));
//            var flightDetailElements = Array.from(document.querySelectorAll('.flight-info-detail'));
//            var enableFlightItems = Array.from(document.querySelectorAll('.flight-fully-item'));
//
//            enableFlightItems.forEach(function (item) {
//                var ticketTypePathElement = document.querySelector('#' + item.id + ' .flight-amount');
//                var detailInfoPathElement = document.querySelector('#' + item.id + ' .detail-path');
//                detailInfoPathElement.onclick = function () {
//                    flightDetailElements.forEach(function (detail) {
//                        var isSameDetail = item === detail.parentElement;
//                        if (detail.classList.contains('block-default') && !isSameDetail) {
//                            detail.classList.remove('block-default');
//                        }
//                    });
//
//                    typeTicketElements.forEach(function (ticketType) {
//                        if (ticketType.classList.contains('block-flex')) {
//                            ticketType.classList.remove('block-flex');
//                        }
//                    });
//
//                    document.querySelector('#' + item.id + ' .flight-info-detail').classList.toggle('block-default');
//                };
//
//                ticketTypePathElement.onclick = function () {
//                    var flightId = item.getAttribute("flightId");
//                    var link = '${pageContext.request.contextPath}/bookingDetail/' + flightId ;
//                    window.location.href = link;
//
////                     console.log(link);
//                };
//
////        flightDetailElements.forEach(function (detail) {
////            if (detail.classList.contains('block-default')) {
////                detail.classList.remove('block-default');
////            }
////        });
////        typeTicketElements.forEach(function (ticketType) {
////            var isSameContent = item === ticketType.parentElement;
////            if (ticketType.classList.contains('block-flex') && !isSameContent) {
////                ticketType.classList.remove('block-flex');
////            }
////        });
////        
////        document.querySelector('#' + item.id + ' .flight-ticket-type').classList.toggle('block-flex');
////        var ticketPrice = document.querySelector('input[name=ticketType]:checked').value;
////        console.log(ticketPrice);
////    };
//
//            });
        </script>

    </body>
</html>
