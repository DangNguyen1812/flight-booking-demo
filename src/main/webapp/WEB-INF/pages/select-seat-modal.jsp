

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="body-aircraft-modal">
    <div class="modal-container">
        <div class="aircraft-header">
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
            <div class="passenger-seat-name">
                <c:forEach items="${listBookingDetail}" var="bookingDetail">
                    <div class="passenger-name">
                        <div class="passenger-name-detail">${bookingDetail.passengerEntity.fullName}</div>
                        <div passengerId="${bookingDetail.passengerEntity.idenCode}" class="passengerId"></div>
                        <div flightId ="${bookingDetail.flightEntity.id}" class="flightId"></div>
                        <div class="passenger-seat">${bookingDetail.seatEntity.number}</div>
                        <div class="seat-id-db"></div>
                    </div>
                </c:forEach>
                
                <c:forEach items="${listBookingDetailReturn}" var="bookingDetail">
                    <div class="passenger-name">
                        <div class="passenger-name-detail">${bookingDetail.passengerEntity.fullName}</div>
                        <div passengerId="${bookingDetail.passengerEntity.idenCode}" class="passengerId"></div>
                        <div flightId ="${bookingDetail.flightEntity.id}" class="flightId"></div>
                        <div class="passenger-seat">${bookingDetail.seatEntity.number}</div>
                        <div class="seat-id-db"></div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="aircraft-row-body">
            <div class="aircraft-row-body-left">

            </div>

            <div class="aircraft-row-body-right">
                <div class="aircraft-row-sticky-right">
                    <div class="info-type-seat">
                        <div class="box box-color-red"></div>
                        <span class="notice-name">VIP Seat</span>
                    </div>
                    <div class="info-type-seat">
                        <div class="box box-color-blue"></div>
                        <span class="notice-name">Business Seat</span>
                    </div>
                    <div class="info-type-seat">
                        <div class="box box-color-green"></div>
                        <span class="notice-name">Standard Seat</span>
                    </div>
                    <div class="info-type-seat ">
                        <div class="box box-color-yellow"></div>
                        <span class="notice-name">Selecting Seat</span>
                    </div>
                    <div class="info-type-seat ">
                        <div class="box box-color-grey"></div>
                        <span class="notice-name">Have someone</span>
                    </div>
                </div>

            </div>
        </div>
        <div class="aircraft-footer">
            <div class="seat-confirm">
                <div class="seat-position">
                    Seat
                </div>
                <div class="seat-price">
                    0 VND
                </div>

            </div>
            <div class="button-confirm">
                <button class="btn-confirm" >Confirm</button>
            </div>
        </div>
    </div>

</div> 