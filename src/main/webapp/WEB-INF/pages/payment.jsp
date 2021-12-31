<%-- 
    Document   : payment
    Created on : Nov 29, 2021, 5:13:56 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <jsp:include page="include/user/css-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/fontawesome-free-5.15.4-web/css/all.min.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/select-flight.css"/>" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bookingdetail.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/themify-icons/themify-icons.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/payment.css"/>" type="text/css"/>
        <style>
            .trip-time-child  {
                font-weight: 400;
                font-size: 14px;
            }
            .airport-info {
                font-weight: 500;
                margin-bottom: 8px;
            }

        </style>
    </head>
    <body id="page1">
        <div class="main">
            <jsp:include page="include/user/menu.jsp"/>
            <div class="content">

                <div class="flight">
                    <jsp:include page="trip-info.jsp"/>
                    <div class="trip-content">
                        <div class="trip-content-left">
                            <div class="payment-header">
                                <div>Payment</div>
                            </div>

                            <div class="payment-body col-sm-6">
                                <div class="payment-via">Payment via creditcard</div>
                                <div class="payment-for">Payment for AirTicket</div>
                                <div class="payment-price"> <fmt:formatNumber pattern="#,##0" value="${totalPrice}"/> VND</div>
                                <div class="form-group card-name">
                                    <input type="text" class="card-name-input valid-all form-control"  placeholder="Enter card name...">
                                    <div class="message-error"></div>
                                </div>
                                <div class="card-number form-group">
                                    <input type="text" class="card-number-input valid-all form-control" placeholder="Enter card number ..." >
                                    <div class="message-error"></div>
                                </div>
                                <div class="card-ccv-code form-group">
                                    <input type="text" class="card-ccv-input form-control valid-all" maxlength="3" placeholder="CCV/CVV...">
                                    <div class="message-error"></div>
                                </div>
                                <div class="card-exp-date">
                                    <div>Exp date:</div>
                                    <div class="card-date-month">                                        
                                        <select class="card-exp-month">
                                            <option value="">Month</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                            <option>8</option>
                                            <option>9</option>
                                            <option>10</option>
                                            <option>11</option>
                                            <option>12</option>
                                        </select>
                                        <select class="card-exp-year">
                                            <option value="">Year</option>
                                            <option>2021</option>
                                            <option>2022</option>
                                            <option>2023</option>
                                            <option>2024</option>
                                            <option>2025</option>
                                            <option>2026</option>
                                            <option>2027</option>
                                            <option>2028</option>
                                            <option>2029</option>
                                            <option>2030</option>
                                            <option>2031</option>
                                            <option>2032</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="message-error-month-year"></div>

                            </div>
                            <div class="btn-payment-wrap">
                                <button class="btn-payment" >Payment</button>
                            </div>
                        </div>

                        <jsp:include page="booking-detail-right.jsp"/>
                    </div>

                </div>

            </div>
            <jsp:include page="include/user/footer.jsp"/>
        </div>
        <script src="<c:url value="/resources/js/payment.js"/>"></script>
        <script>



            var btnPayment = document.querySelector('.btn-payment');
            var cardNameInput = document.querySelector('.card-name-input');
            var cardNumberInput = document.querySelector('.card-number-input');
            var cardExpMonth = document.querySelector('.card-exp-month');
            var cardExpYear = document.querySelector('.card-exp-year');
            var cardCCVCode = document.querySelector('.card-ccv-input');
            function CreditCard(name, number, month, year, ccv) {
                this.name = name;
                this.number = number;
                this.month = month;
                this.year = year;
                this.ccv = ccv;
            }
            jQuery(document).ready(function ($) {
                btnPayment.onclick = function () {
      
                    validAll.forEach(function (item) {
                        if (item.value === '') {
                            item.parentElement.querySelector('.message-error').innerHTML = 'This field is required';

                        }

                    });

                    if (monthVaid.value === '') {
                        document.querySelector('.message-error-month-year').innerHTML = 'This filed is required';
                    }

                    if (yearValid.value === '') {
                        document.querySelector('.message-error-month-year').innerHTML = 'This filed is required';
                    }


                    var creditCard = new CreditCard();
                    creditCard.name = cardNameInput.value;
                    creditCard.number = cardNumberInput.value;
                    creditCard.month = cardExpMonth.value;
                    creditCard.year = cardExpYear.value;
                    creditCard.ccv = cardCCVCode.value;

                    if (creditCard.name !== '' && creditCard.number !== '' && creditCard.month !== ''
                            && creditCard.year !== '' && creditCard.cvv !== '') {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/checkPayment',
                            contentType: 'application/json',
                            type: 'POST',
                            dataType: 'text',
                            data:
                                    JSON.stringify(creditCard),
                            success: function (data) {
                                console.log(data.trim() === 'AccountError');
                                console.log(data.trim() === 'Success');
                                console.log(data.trim() === 'BalanceError');
                                if(data.trim() === 'AccountError') {
                                    document.querySelector('.card-name').querySelector('.message-error').innerHTML = 'The account not valid!';
                                }
                                
                                if(data.trim() === 'BalanceError') {
                                    document.querySelector('.card-number').querySelector('.message-error').innerHTML = 'The balance is not enough!';
                                }
                                if(data.trim() === 'Success') {
                                    window.location.href = '${pageContext.request.contextPath}/bookinginfo';
                                }
                                

                            },
                            error: function (data) {


                            }
                        });
                    }

                };
            });
        </script>

        <script src="<c:url value="/resources/js/booking-detail-right.js"/>"></script>
    </body>
</html>
