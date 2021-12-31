


var selectServiceElement = document.querySelector('.select-service');
var serviceModalElement = document.querySelector('.body-service-modal');
var serviceModalContainer = document.querySelector('.modal-service-container');
function showSeatTable() {
    serviceModalElement.classList.add('open');
}

function hideSeatTable() {
    serviceModalElement.classList.remove('open');
}
serviceModalElement.addEventListener('click', hideSeatTable);
serviceModalContainer.addEventListener('click', function (event) {
    event.stopPropagation();
});

selectServiceElement.addEventListener('click', showSeatTable);

var passengerServiceElement = Array.from(document.querySelectorAll('.passenger-name-detail-service'));
var passengerService = Array.from(document.querySelectorAll('.passenger-name-service'));
var passengerServiceWrapElement = document.querySelector('.passenger-service-name-wrap');

selectServiceElement.onclick = function () {

    passengerServiceElement.forEach(function (e) {
        if (e.classList.contains('active')) {
            e.classList.remove('active');
        }
    });
    document.querySelector('.passenger-name-detail-service').classList.add('active');

};

passengerService.forEach(function (item) {
    item.onclick = function () {
        passengerServiceElement.forEach(function (e) {
            if (e.classList.contains('active')) {
                e.classList.remove('active');
            }
        });
        item.querySelector('.passenger-name-detail-service').classList.add('active');
    };
});

var luggageBoxAll = Array.from(document.querySelectorAll('.luggage-box-all'));

luggageBoxAll.forEach(function (item) {
    item.onclick = function () {
        passengerService.forEach(function (e) {
            if (e.querySelector('.passenger-name-detail-service').classList.contains('active')) {
                e.querySelector('.passenger-service-description').innerHTML = item.querySelector('.luggage-description').innerText.trim();
                e.querySelector('.service-id-db').innerHTML = item.getAttribute("serviceId");
                document.querySelector('.service-price').innerHTML = item.querySelector('.luggage-price').innerText.trim() + ' VND';
                document.querySelector('.service-description').innerHTML = item.querySelector('.luggage-description').innerText.trim();
            }
        });
    };
});

var btnServiceConfirm = document.querySelector('.button-confirm-service');
var selectServiceType = Array.from(document.querySelectorAll('.select-service-type'));
btnServiceConfirm.onclick = function () {
    hideSeatTable();
    var listLuggageShow = [];
    var listLuggagePass = [];
    function PassengerService(idenCode, serviceId, serviceLuggage) {
        this.idenCode = idenCode;
        this.serviceId = serviceId;
        this.serviceLuggage = serviceLuggage;
    }
    passengerService.forEach(function (e) {
        var passengerService = new PassengerService();
        passengerService.idenCode = e.getAttribute("passengerServiceId");
        passengerService.serviceId = e.querySelector('.service-id-db').innerText;
        passengerService.serviceLuggage = e.querySelector('.passenger-service-description').innerText.trim();
        listLuggagePass.push(passengerService);
        listLuggageShow.push(e.querySelector('.passenger-service-description').innerText);
    });
    selectServiceType.forEach(function (item, index) {
        item.innerHTML = listLuggageShow[index];
    });

    jQuery(document).ready(function ($) {
        $.ajax({
            type: "POST",
            contentType: 'application/json',
            url: '/Spring_MVC_Project_Final/saveService',
            dataType: 'text',
            data: JSON.stringify(listLuggagePass),
            success: function (data) {
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
                    document.querySelector('.edit-seat').classList.add('disable');
                }

                var serviceParentElement = document.querySelector('.service-detail-parrent');
                var iconDownService = document.querySelector('.icon-down-service');

                iconDownService.onclick = function () {
                    serviceParentElement.classList.toggle('open');
                };

                if (document.querySelector('.service-detail-parrent').childNodes.length <= 1) {
                    iconDownService.style.pointerEvents = 'none';
                    document.querySelector('.edit-service').classList.add('disable');
                }

            },
            error: function (data) {
                console.log("Error");
            }
        });
    });
};


