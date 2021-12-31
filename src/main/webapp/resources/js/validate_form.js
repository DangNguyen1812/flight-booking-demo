/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var departureElement = document.querySelector('.departure');

function Validator(options) {
    var formElement = document.querySelector(options.form);
    var selectorRules = {};

    function getParent(element, selector) {
        if (element) {
            while (element.parentElement) {
                if (element.parentElement.matches(selector)) {
                    return element.parentElement;
                }
                element = element.parentElement;
            }
        }

    }
    function validate(inputElement, rule) {
        var errorElement = getParent(inputElement, options.formGroup).querySelector(options.errorSelector);
        var errorMessage;
        var rules = selectorRules[rule.selector];
        for (var i = 0; i < rules.length; i++) {
            errorMessage = rules[i](inputElement.value);
            if (errorMessage)
                break;
        }
        if (errorMessage) {
            errorElement.innerText = errorMessage;
            getParent(inputElement, options.formGroup).classList.add('invalid');
        } else {
            errorElement.innerText = '';
            getParent(inputElement, options.formGroup).classList.remove('invalid');
        }
        return !errorMessage;
    }

    if (formElement) {

        formElement.onsubmit = function (e) {
            var isFormValid = true;
            e.preventDefault();
            options.rules.forEach(function (rule) {
                var inputElement = formElement.querySelector(rule.selector);
                var isValid = validate(inputElement, rule);
                if (!isValid) {
                    isFormValid = false;
                }
                if (isFormValid) {
                    if (typeof options.onSubmit === 'function') {
                        var enableInputs = formElement.querySelectorAll('[name]:not([disable])');
                        var formValues = Array.from(enableInputs).reduce(function (values, input) {
                            values[input.name] = input.value;
                            return  values;
                        }, {});
                        options.onSubmit(formValues);
                    } else {
                        formElement.submit();
                    }
                }
            })
        }


        options.rules.forEach(function (rule) {

            var inputElement = formElement.querySelector(rule.selector);
            if (Array.isArray(selectorRules[rule.selector])) {
                selectorRules[rule.selector].push(rule.test);
            } else {
                selectorRules[rule.selector] = [rule.test];
            }
            if (inputElement) {
                inputElement.onblur = function () {
                    validate(inputElement, rule);
                }

                inputElement.oninput = function () {
                    var errorElement = getParent(inputElement, options.formGroup).querySelector(options.errorSelector);
                    errorElement.innerText = '';
                    getParent(inputElement, options.formGroup).classList.remove('invalid');
                }
            }
        })
    }
}

Validator.isRequired = function (selector, message) {
    return {
        selector: selector,
        test: function (value) {
            return value.trim() ? undefined : message || 'This field is required';
        }
    };
}

Validator.checkDate = function (selector, message) {
    return {
        selector: selector,
        test: function (value) {
//            var re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
//            return value.match(re) ? false : message;
        }
    };
}

Validator.isEmail = function (selector, message) {
    return {
        selector: selector,
        test: function (value) {
            var regex = '/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/';
            return regex.test(value) ? undefined : message || 'please enter correct email';
        }
    };
}

Validator.isPassword = function (selector, min, message) {
    return {
        selector: selector,
        test: function (value) {
            return value.length > 8 ? undefined : message || `please enter ${min} character at least`;
        }
    };
}

Validator.isConfirmed = function (selector, getConfirmValue, message) {
    return {
        selector: selector,
        test: function (value) {
            return  value === getConfirmValue ? undefined : message || 'password is not same'
        }
    }
}

Validator.isValidPassenger = function (selector, message) {
    return {
        selector: selector,
        test: function (value) {
            return  value > 0 ? undefined : message || 'not valid';
        }
    };
}
