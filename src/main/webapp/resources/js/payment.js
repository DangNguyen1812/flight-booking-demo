/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



//let regex = '^4[0-9]{12}(?:[0-9]{3})?$';

var validAll = Array.from(document.querySelectorAll('.valid-all'));
validAll.forEach(function (item) {
    item.onblur = function () {
        if (item.value === '') {
            item.parentElement.querySelector('.message-error').innerHTML = 'This field is required';
//            item.parentElement.querySelector('.message-error').classList.add('is-required');
        }
    };

    item.oninput = function () {
        item.parentElement.querySelector('.message-error').innerHTML = '';
    };

});

var monthVaid = document.querySelector('.card-exp-month');
var yearValid = document.querySelector('.card-exp-year');

monthVaid.onblur = function () {
    if (monthVaid.value === '') {
        document.querySelector('.message-error-month-year').innerHTML = 'This filed is required';
    }
};

yearValid.onblur = function () {
    if (yearValid.value === '') {
        document.querySelector('.message-error-month-year').innerHTML = 'This filed is required';
    }
};

monthVaid.oninput = function () {
    document.querySelector('.message-error-month-year').innerHTML = '';
};

yearValid.oninput = function () {
    document.querySelector('.message-error-month-year').innerHTML = '';
};


var btnPayment = document.querySelector('.btn-payment');
btnPayment.onclick = function () {
    validAll.forEach(function (item) {
        if (monthVaid.value === '') {
            document.querySelector('.message-error-month-year').innerHTML = 'This filed is required';
        }
    });
    
    if (monthVaid.value === '') {
        document.querySelector('.message-error-month-year').innerHTML = 'This filed is required';
    }
    
    if (yearValid.value === '') {
        document.querySelector('.message-error-month-year').innerHTML = 'This filed is required';
    }
};




