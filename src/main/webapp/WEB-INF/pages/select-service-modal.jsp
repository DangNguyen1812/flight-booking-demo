
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="body-service-modal">
    <div class="modal-service-container">
        <div class="service-header">
            <c:if test="${trip == 'one-way'}">
                <div class="trip-name">
                    Trip
                </div>   
            </c:if>
            <c:if test="${trip == 'round'}">
                <div class="trip-name">
                    <div class="trip-name-child">Trip</div>
                    <div class="trip-name-child">Return trip</div>
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
                            ${bookingDetail.serviceLuggage}
                        </div>

                        <div class="service-id-db"></div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="service-body">
            <c:forEach items="${luggageServices}" var="luggage">
                <div class="luggage-box-all" serviceId="${luggage.id}">
                    <div class="luggage-img"><i class="fas fa-suitcase-rolling"></i></div>
                    <div class="luggage-description">${luggage.description}</div>
                    <div class="luggage-price">
                        <fmt:formatNumber pattern="#,##0" value="${luggage.price}"/> VND
                    </div>
                    <div class="luggage-add-icon"><i class="fas fa-plus-circle"></i></div>
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