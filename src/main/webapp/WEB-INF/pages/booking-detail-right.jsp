<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="trip-content-right">
    <div class="booking-detail">
        Booking detail
    </div>
    <div class="passenger-info">
        <div class="passenger-info-in">
            <div>Passenger info </div>
            <i class="ti-arrow-circle-down icon-down-passenger"></i>
        </div>
        <div class="passenger-detail-parrent">
            <c:forEach items="${listBookingDetail}" var="bookingDetail">
                <div class="passenger-detail-child">
                    <div>${bookingDetail.passengerEntity.fullName}</div>               
                    <a href="<c:url value="passenger"/>"><i class="fas fa-edit "></i></a>
                </div>
            </c:forEach>
        </div>

    </div>
    <div class="trip">
        Trip
    </div>
    <div class="trip-all-info">
        <div class="trip-place-time">
            <div class="trip-place">
                ${departure1.cityEntity.name} (${departure1.name}) ----  ${destination.cityEntity.name} (${destination.name})
            </div>
            <div class="trip-time">
                <div class="trip-time-child">
                    <fmt:formatDate type = "date" pattern="E"
                                    value = "${flight.departDate}" />,
                    <fmt:formatDate type = "date" dateStyle = "short"
                                    value = "${flight.departDate}" /> |
                </div>
                <div class="trip-time-child">
                    <fmt:formatDate type = "time" timeStyle = "short"
                                    value = "${flight.departTime}" /> -
                    <fmt:formatDate type = "time" timeStyle = "short"
                                    value = "${flight.arrivalTime}" /> |
                </div>
                <div class="trip-time-child">
                    VJ${flight.id}
                </div>
            </div>
        </div>
        <div class="trip-price">
            <div>Ticket price:</div>
            <div>
                <div class="ticket-price-passenger">x${passenger}</div>
                <fmt:formatNumber pattern="#,##0" value="${flight.flightRouteEntity.standardPrice * passenger}"/> VND                                       
            </div>
        </div>
        <div class="trip-seat-parent">
            <div class="trip-seat-child">
                <div>
                    <div class="service-seat">Seat</div>
                    <a href="<c:url value="selectSeat"/>" class="edit-seat"><i class="fas fa-edit seat-service-edit"></i></a>
                </div>
                <div >
                    <span class="total-price-seat"><fmt:formatNumber pattern="#,##0" value="${totalPriceSeat}"/></span> VND

                    <span style="margin-left: 8px;text-align: center" ><i class="ti-arrow-circle-down icon-down-seat"></i></span>
                </div>
            </div>
            <div class="trip-seat-detail-parrent">
                <c:if test="${numberOfVipSeat > 0}">
                    <div class="trip-seat-detail-child">
                        <div>First class x ${numberOfVipSeat}</div>               
                        <div><fmt:formatNumber pattern="#,##0" value="${numberOfVipSeat*200000}"/> VND</div>
                    </div>
                </c:if>
                <c:if test="${numberOfStandardSeat > 0}">
                    <div class="trip-seat-detail-child">
                        <div>Standard x ${numberOfStandardSeat}</div>               
                        <div><fmt:formatNumber pattern="#,##0" value="${numberOfStandardSeat*50000}"/> VND</div>
                    </div>
                </c:if>
                <c:if test="${numberOfBusinessSeat > 0}">
                    <div class="trip-seat-detail-child">
                        <div>Business x ${numberOfBusinessSeat}</div>               
                        <div><fmt:formatNumber pattern="#,##0" value="${numberOfBusinessSeat*100000}"/> VND</div>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="trip-service-parent">
            <div class="trip-service">
                <div>
                    <div class="service-seat">Service</div>
                    <a href="<c:url value="selectSeat"/>" class="edit-service"><i class="fas fa-edit seat-service-edit"></i></a>
                </div>
                <div>
                    <fmt:formatNumber pattern="#,##0" value="${totalServicePrice}"/> VND
                    <span style="margin-left: 8px;text-align: center" ><i class="ti-arrow-circle-down icon-down-service"></i></span>
                </div>

            </div>
            <div class="service-detail-parrent">
                <c:forEach items="${listServiceBookingAll}" var="serviceBooking">
                    <div class="service-detail-child">
                        <div>
                            ${serviceBooking.serviceEntity.description}
                        </div>               
                        <div>
                            <fmt:formatNumber pattern="#,##0" value="${serviceBooking.serviceEntity.price}"/> VND
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


    </div>
    <div class="trip-total-price">
        <div>Total price:</div>
        <div>
            <fmt:formatNumber pattern="#,##0" value="${totalPrice}"/> VND
        </div>
    </div>

</div>
