/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
/////
var serviceParentElement = document.querySelector('.service-detail-parrent');
var iconDownService = document.querySelector('.icon-down-service');

iconDownService.onclick = function () {
    serviceParentElement.classList.toggle('open');
};

if (document.querySelector('.service-detail-parrent').childNodes.length <= 1) {
    iconDownService.style.pointerEvents = 'none';
    document.querySelector('.edit-service').classList.add('disable');
}


