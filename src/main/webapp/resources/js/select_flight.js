/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var typeTicketElements = Array.from(document.querySelectorAll('.flight-ticket-type'));
var flightDetailElements = Array.from(document.querySelectorAll('.flight-info-detail'));
var enableFlightItems = Array.from(document.querySelectorAll('.js-fully-item'));

var enableGoFlightItems = Array.from(document.querySelectorAll('.js-fully-item-go'));
var enableReturnFlightItems = Array.from(document.querySelectorAll('.js-fully-item-return'));

var flightGoId;

enableFlightItems.forEach(function (item) {
    var ticketTypePathElement = document.querySelector('#' + item.id + ' .flight-amount');
    var detailInfoPathElement = document.querySelector('#' + item.id + ' .detail-path');


    detailInfoPathElement.onclick = function () {

        flightDetailElements.forEach(function (detail) {
            var isSameDetail = item === detail.parentElement;
            if (detail.classList.contains('block-default') && !isSameDetail) {
                detail.classList.remove('block-default');
            }
        });

        typeTicketElements.forEach(function (ticketType) {
            if (ticketType.classList.contains('block-flex')) {
                ticketType.classList.remove('block-flex');
            }
        });

        document.querySelector('#' + item.id + ' .flight-info-detail').classList.toggle('block-default');
    };

    ticketTypePathElement.onclick = function () {
        var flightId = item.getAttribute("flightId");
        var link = '/Spring_MVC_Project_Final/bookingDetail?flightId=' + flightId + '&flightReturnId=-1';
        window.location.href = link;
    };
});

enableGoFlightItems.forEach(function (item) {

    var ticketTypePathElement = document.querySelector('#' + item.id + ' .flight-amount');
    var detailInfoPathElement = document.querySelector('#' + item.id + ' .detail-path');
    detailInfoPathElement.onclick = function () {
        flightDetailElements.forEach(function (detail) {
            var isSameDetail = item === detail.parentElement;
            if (detail.classList.contains('block-default') && !isSameDetail) {
                detail.classList.remove('block-default');
            }
        });

        typeTicketElements.forEach(function (ticketType) {
            if (ticketType.classList.contains('block-flex')) {
                ticketType.classList.remove('block-flex');
            }
        });

        document.querySelector('#' + item.id + ' .flight-info-detail').classList.toggle('block-default');
    };
    ticketTypePathElement.onclick = function () {
        flightGoId = item.getAttribute("flightId");
        document.querySelector('.flight-go-wrapper').style.display = "none";
        document.querySelector('.flight-return-wrapper').style.display = "block";
        var link = '/Spring_MVC_Project_Final/bookingDetail/' + flightGoId;

    };
});

enableReturnFlightItems.forEach(function (item) {
    var ticketTypePathElement = document.querySelector('#' + item.id + ' .flight-amount');
    var detailInfoPathElement = document.querySelector('#' + item.id + ' .detail-path');
    detailInfoPathElement.onclick = function () {
        flightDetailElements.forEach(function (detail) {
            var isSameDetail = item === detail.parentElement;
            if (detail.classList.contains('block-default') && !isSameDetail) {
                detail.classList.remove('block-default');
            }
        });

        typeTicketElements.forEach(function (ticketType) {
            if (ticketType.classList.contains('block-flex')) {
                ticketType.classList.remove('block-flex');
            }
        });

        document.querySelector('#' + item.id + ' .flight-info-detail').classList.toggle('block-default');
    };

    ticketTypePathElement.onclick = function () {
//        flightGoId = item.getAttribute("flightId");
//        document.querySelector('.flight-go-wrapper').style.display = "none";
//        document.querySelector('.flight-return-wrapper').style.display = "block";
        var flightReturnId = item.getAttribute("flightId");
        var linkRound = '/Spring_MVC_Project_Final/bookingDetail?flightId=' + flightGoId + '&flightReturnId=' + flightReturnId;
        console.log(linkRound);
        window.location.href = linkRound;

    };
});


//        flightDetailElements.forEach(function (detail) {
//            if (detail.classList.contains('block-default')) {
//                detail.classList.remove('block-default');
//            }
//        });
//        typeTicketElements.forEach(function (ticketType) {
//            var isSameContent = item === ticketType.parentElement;
//            if (ticketType.classList.contains('block-flex') && !isSameContent) {
//                ticketType.classList.remove('block-flex');
//            }
//        });
//        
//        document.querySelector('#' + item.id + ' .flight-ticket-type').classList.toggle('block-flex');
//        var ticketPrice = document.querySelector('input[name=ticketType]:checked').value;
//        console.log(ticketPrice);
//    };





