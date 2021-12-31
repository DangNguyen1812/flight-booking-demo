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
        <title>Seat Service</title>

        <jsp:include page="include/user/css-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources/fontawesome-free-5.15.4-web/css/all.min.css"/>" type="text/css"/>

        <link rel="stylesheet" href="<c:url value="/resources/css/select-service.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/select-seat.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/select-flight.css"/>" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bookingdetail.css"/>" type="text/css"/>
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
                    <div class="trip-content">
                        <div class="trip-content-left">
                            <div class="select-seat">
                                <div class="select-seat-left">
                                    <div class="select">Select your favorite seat</div>
                                    <div class="select-seat-departure">${departure1.name} --> ${destination.name}</div>
                                    <c:forEach items="${listBookingDetail}" var="bookingDetail">
                                        <div class="select-seat-position">${bookingDetail.seatEntity.number}</div>
                                    </c:forEach>
                                </div>
                                <div class="select-seat-right">
                                    <i class="ti-angle-right"></i>
                                </div>
                            </div>
                            <div class="select-service">
                                <div class="select-service-left">
                                    <div class="select">Select luggage</div>
                                    <div class="select-seat-departure">${departure1.name} --> ${destination.name}</div>
                                    <c:forEach items="${listBookingDetail}" var="bookingDetail">
                                        <div class="select-service-type">
                                            ${bookingDetail.serviceLuggage}
                                        </div>
                                    </c:forEach>

                                </div>
                                <div class="select-service-right">
                                    <i class="ti-angle-right"></i>
                                </div>

                            </div>
                            <div class="go-on">
                                <button class="btn-go-on" onclick="location.href = '<c:url value="/payment"/>'">
                                    Go on
                                </button>
                            </div> 
                        </div>
                        <jsp:include page="booking-detail-right.jsp"/>
                    </div>

                </div>

                <jsp:include page="select-seat-modal.jsp" />
                <jsp:include page="select-service-modal.jsp" />
            </div>
            <jsp:include page="include/user/footer.jsp"/>
        </div>
        <script type="text/javascript" src="<c:url value="/resources/js/select-seat.js"/>"></script>
        <script>
            var btnDemo = document.querySelector('.btn-go-on');

            var listSeat = ${jsonAircraftSeat};
            var listSeatReturn = ${jsonAircraftSeatReturn};
            var row = ${flight.aircraftEntity.rowNumber};
            var col = ${flight.aircraftEntity.colNumber};

            createTableSeat(row,col);
            
            var seatElements = Array.from(document.querySelectorAll('.seat-all'));
            var selectSeatElement = document.querySelector('.select-seat');
            var aircraftModalElement = document.querySelector('.body-aircraft-modal');
            var modalContainer = document.querySelector('.modal-container');
            var passengerNameDetail = Array.from(document.querySelectorAll('.passenger-name-detail'));
            function showSeatTable() {
                aircraftModalElement.classList.add('open');
            }

            function hideSeatTable() {
                aircraftModalElement.classList.remove('open');
            }
            selectSeatElement.addEventListener('click', showSeatTable);
            selectSeatElement.onclick = function () {
                var passengerSeat = Array.from(document.querySelectorAll('.passenger-seat'));
                var selectingElement = Array.from(document.querySelectorAll('.selecting-seat'));

                selectingElement.forEach(function (remove) {
                    remove.classList.remove('selecting-seat');
                });

                var passengerSeatColor1 = [];
                passengerSeat.forEach(function (ex) {
                    var xxx = seatElements.find(function (aaa) {
                        return aaa.getAttribute("id") === ex.innerText;

                    });
                    passengerSeatColor1.push(xxx);
                });

                passengerSeatColor1.forEach(function (color) {
                    if (typeof color !== 'undefined') {
                        color.classList.add('selecting-seat');
                    }
                });
                passengerNameDetail.forEach(function (e) {
                    if (e.classList.contains('active')) {
                        e.classList.remove('active');
                    }
                });
                document.querySelector('.passenger-name-detail').classList.add('active');
            };
            aircraftModalElement.addEventListener('click', hideSeatTable);
            modalContainer.addEventListener('click', function (event) {
                event.stopPropagation();
            });
            var passengerId = Array.from(document.querySelectorAll('.passengerId'));
            var passengerInfo = Array.from(document.querySelectorAll('.passenger-name'));

            passengerInfo.forEach(function (item) {
                item.onclick = function () {
                    passengerInfo.forEach(function (detail) {
                        if (detail.querySelector('.passenger-name-detail').classList.contains('active')) {
                            detail.querySelector('.passenger-name-detail').classList.remove('active');
                        }
                        ;
                        item.querySelector('.passenger-name-detail').classList.add('active');
                    });
                };


            });



            var passengerElement = document.querySelector('.passenger-seat');
            var seatPosition = document.querySelector('.seat-position');
            var seatPrice = document.querySelector('.seat-price');
            seatElements.forEach(function (item, index) {

                listSeat.forEach(function (item1) {
                    if (item.getAttribute("id") === item1.seat.number) {
                        var seatType = item1.seatType.seatType.toLowerCase();
                        var seatStatus = item1.seatStatus.seatStatus.toLowerCase();
                        item.classList.add(seatType);
                        item.classList.add(seatStatus);
                        item.setAttribute("price", item1.seatType.price);
                        item.setAttribute("seatType", item1.seatType.seatType);
                        item.setAttribute("seatId", item1.id);

                        var hoverElement = document.createElement('div');
                        hoverElement.className = 'show-info-seat';
                        hoverElement.innerHTML = item1.seatType.price + "VND";
                        item.appendChild(hoverElement);
                    }
                });



                item.onclick = function () {
                    var selectingElement = Array.from(document.querySelectorAll('.selecting-seat'));
                    selectingElement.forEach(function (remove) {
                        remove.classList.remove('selecting-seat');
                    });

                    passengerInfo.forEach(function (itemPassenger) {
                        if (itemPassenger.querySelector('.passenger-name-detail').classList.contains('active')) {
                            itemPassenger.querySelector('.passenger-seat').innerHTML = item.getAttribute("id");
                            seatPosition.innerHTML = item.getAttribute("id") + " : " + item.getAttribute("seatType");
                            seatPrice.innerHTML = item.getAttribute("price") + " VND";
                            itemPassenger.querySelector('.seat-id-db').innerHTML = item.getAttribute("seatId");

                        }

                    });

                    var passengerSeat = Array.from(document.querySelectorAll('.passenger-seat'));
                    var passengerSeatColor = [];
                    passengerSeat.forEach(function (ex) {
                        var xxx = seatElements.find(function (aaa) {
                            return aaa.getAttribute("id") === ex.innerText;

                        });
                        passengerSeatColor.push(xxx);
                    });
                    passengerSeatColor.forEach(function (color) {
                        if (typeof color !== 'undefined') {
                            color.classList.add('selecting-seat');
                        }

                    });

                };

            });
            jQuery(document).ready(function ($) {
                var btnConfirm = document.querySelector('.btn-confirm');
                btnConfirm.onclick = function (e) {

                    aircraftModalElement.classList.remove('open');
                    var listSeatOfPassenger = [];
                    var listSeatShow = [];
                    function PassengerIdenSeat(idenCode, seatId, seatNumber, flightId) {
                        this.idenCode = idenCode;
                        this.seatId = seatId;
                        this.seatNumber = seatNumber;
                        this.flightId = flightId;
                    }
                    hideSeatTable();
                    passengerInfo.forEach(function (item) {
                        var passengerSeatIden = new PassengerIdenSeat();
                        passengerSeatIden.idenCode = item.querySelector('.passengerId').getAttribute("passengerId");
                        passengerSeatIden.seatId = item.querySelector('.seat-id-db').innerText;
                        passengerSeatIden.seatNumber = item.querySelector('.passenger-seat').innerText;
                        passengerSeatIden.flightId = item.querySelector('.flightId').getAttribute("flightId");
                        listSeatOfPassenger.push(passengerSeatIden);
                        listSeatShow.push(passengerSeatIden.seatNumber);
                    });
                    listSeatShow.join(' ,');
                    var seatShow = Array.from(document.querySelectorAll('.select-seat-position'));
                    seatShow.forEach(function (iteem, index) {
                        iteem.innerHTML = listSeatShow[index];
                    });
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        url: '${pageContext.request.contextPath}/saveSeat',
                        dataType: 'text',
                        data: JSON.stringify(listSeatOfPassenger),
                        success: function (data) {
                            console.log("SUCCESS: ");
                            var aaa = document.querySelector('.trip-content-right');
                            aaa.innerHTML = data;
                            var passengerParrentElemnt = document.querySelector('.passenger-detail-parrent');
                            var iconDownPassenger = document.querySelector('.icon-down-passenger');
                            var passengerDetailChild = Array.from(document.querySelectorAll('.passenger-detail-child'));


                            iconDownPassenger.onclick = function () {
                                passengerParrentElemnt.classList.toggle('open');
                            };


                            passengerDetailChild.forEach(function (e) {
                                if (e.innerText.trim() === '') {
                                    iconDownPassenger.style.pointerEvents = 'none';
                                }

                            });
                            var seatParentElement = document.querySelector('.trip-seat-detail-parrent');
                            var iconDownSeat = document.querySelector('.icon-down-seat');
                            iconDownSeat.onclick = function () {
                                seatParentElement.classList.toggle('open');
                            };
                            if (document.querySelector('.trip-seat-detail-parrent').childNodes.length <= 1) {
                                iconDownSeat.style.pointerEvents = 'none';
                            }

                            var serviceParentElement = document.querySelector('.service-detail-parrent');
                            var iconDownService = document.querySelector('.icon-down-service');

                            iconDownService.onclick = function () {
                                serviceParentElement.classList.toggle('open');
                            };

                            if (document.querySelector('.service-detail-parrent').childNodes.length <= 1) {
                                iconDownService.style.pointerEvents = 'none';
                            }

                        },
                        error: function (data) {
                            console.log(data);
                        }

                    });
                };
            });
        </script>        
        <script src="<c:url value="/resources/js/booking-detail-right.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/select-service.js"/>"></script>
</html>
