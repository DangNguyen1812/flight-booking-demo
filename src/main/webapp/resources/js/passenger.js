/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var namePassenger = Array.from(document.querySelectorAll('.namePassenger'));
var birthdayPassenger = Array.from(document.querySelectorAll('.birthdayPassenger'));
var idencodePassenger = Array.from(document.querySelectorAll('.idencodePassenger'));
var genderPassenger = Array.from(document.querySelectorAll('.genderPassenger'));
var addressPassenger = Array.from(document.querySelectorAll('.addressPassenger'));
var emailPassenger = Array.from(document.querySelectorAll('.emailPassenger'));
var phonePassenger = Array.from(document.querySelectorAll('.phonePassenger'));


var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0');
var yyyy = today.getFullYear();

today = yyyy + '-' + mm + '-' + dd;
$('.birthdayPassenger').attr('max', today);

namePassenger.forEach(function (item) {
    item.onblur = function () {
        if (item.value === '') {
            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
            item.parentElement.querySelector('.form-message').classList.add('is-required');
        }
    };
    
    item.oninput = function  () {
        item.parentElement.querySelector('.form-message').innerHTML = '';
    };
});

birthdayPassenger.forEach(function (item) {
    item.defaultValue = "1996-12-18";
    item.onblur = function () {
        if (item.value === '') {
            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
            item.parentElement.querySelector('.form-message').classList.add('is-required');
        }
    };
    
    item.oninput = function  () {
        item.parentElement.querySelector('.form-message').innerHTML = '';
    };
});

idencodePassenger.forEach(function (item) {
    item.onblur = function () {
        if (item.value === '') {
            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
            item.parentElement.querySelector('.form-message').classList.add('is-required');
        }
    };
    item.oninput = function  () {
        item.parentElement.querySelector('.form-message').innerHTML = '';
    };
});

genderPassenger.forEach(function (item) {
    item.onblur = function () {
        if (item.value === '') {
            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
            item.parentElement.querySelector('.form-message').classList.add('is-required');
        }
    };
    item.oninput = function  () {
        item.parentElement.querySelector('.form-message').innerHTML = '';
    };
});

addressPassenger.forEach(function (item) {
    item.onblur = function () {
        if (item.value === '') {
            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
            item.parentElement.querySelector('.form-message').classList.add('is-required');
        }
    };
    item.oninput = function  () {
        item.parentElement.querySelector('.form-message').innerHTML = '';
    };
});

emailPassenger.forEach(function (item) {
    item.onblur = function () {
        if (item.value === '') {
            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
            item.parentElement.querySelector('.form-message').classList.add('is-required');
        }
    };
    item.oninput = function  () {
        item.parentElement.querySelector('.form-message').innerHTML = '';
    };
});


phonePassenger.forEach(function (item) {
    item.onblur = function () {
        if (item.value === '') {
            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
            item.parentElement.querySelector('.form-message').classList.add('is-required');
        }
    };
    item.oninput = function  () {
        item.parentElement.querySelector('.form-message').innerHTML = '';
    };
});





