<%-- 
    Document   : home
    Created on : Nov 1, 2021, 1:52:32 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Flight - Travel and Tour</title>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="<c:url value="/resources/css1/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css1/bootstrap-theme.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css1/fontAwesome.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css1/hero-slider.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css1/owl-carousel.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css1/datepicker.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css1/tooplate-style.css"/>">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

        <script src="<c:url value="/resources/js1/vendor/modernizr-2.8.3-respond-1.4.2.min.js"/>"></script>
    </head>
    <body>
        <section class="banner" id="top" style="background-image: url(../resources/img1/banner-bg.jpg)">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="left-side">
                            <div class="logo">
                                <img src="<c:url value="/resources/img1/logo.png"/>" alt="Flight Template">
                            </div>
                            <div class="tabs-content">
                                <h4>Choose Your Direction:</h4>
                                <ul class="social-links">
                                    <li><a href="http://facebook.com">Find us on <em>Facebook</em><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="http://youtube.com">Our <em>YouTube</em> Channel<i class="fa fa-youtube"></i></a></li>
                                    <li><a href="http://instagram.com">Follow our <em>instagram</em><i class="fa fa-instagram"></i></a></li>
                                </ul>
                            </div>
                            <div class="page-direction-button">
                                <a href="contact.html"><i class="fa fa-phone"></i>Contact Us Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <section id="first-tab-group" class="tabgroup">
                            <div id="tab1">
                                <div class="submit-form">
                                    <h4>Check availability for <em>direction</em>:</h4>
                                    <form id="form-submit" action="${pageContext.request.contextPath}/user/searchFlight" method="get">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label for="from">From:</label>
                                                    <select required name="departure" onchange='this.form.()'>
                                                        <option value="">Select a location...</option>
                                                        <c:forEach items="${cities}" var="city">
                                                            <option value="${city.id}">${city.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label for="to">To:</label>
                                                    <select required name="destination" onchange='this.form.()'>
                                                        <option value="">Select a location...</option>
                                                        <c:forEach items="${cities}" var="city">
                                                            <option value="${city.id}">${city.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label for="departDate">Departure date:</label>
                                                    <input name="departDate" type="date"  placeholder="Select date..." required="" onchange='this.form.()'>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label for="returnDate">Return date:</label>
                                                    <input name="returnDate" type="date"  placeholder="Select date..."  onchange='this.form.()'>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="radio-select">
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                                            <label for="round">Round</label>
                                                            <input type="radio" name="trip" id="round" value="round" required="required"onchange='this.form.()'>
                                                        </div>
                                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                                            <label for="oneway">Oneway</label>
                                                            <input type="radio" name="trip" id="oneway" value="one-way" required="required"onchange='this.form.()'>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <button type="submit" id="form-submit" class="btn">Order Ticket Now</button>
                                                </fieldset>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
                            
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="primary-button">
                            <a href="#" class="scroll-top">Back To Top</a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <ul class="social-icons">
                            <li><a href="https://www.facebook.com/tooplate"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <p>Copyright &copy; 2018 Flight Tour and Travel Company

                            | Design: <a href="http://www.tooplate.com/view/2093-flight" target="_parent"><em>Flight</em></a></p>
                    </div>
                </div>
            </div>
        </footer>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>');</script>

        <script src="<c:url value="/resources/js1/vendor/bootstrap.min.js"/>"></script>

        <script src="<c:url value="/resources/js1/datepicker.js"/>"></script>
        <script src="<c:url value="/resources/js1/plugins.js"/>"></script>
        <script src="<c:url value="/resources/js1/main.js"/>"></script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                            $(document).ready(function () {



                                                            // navigation click actions 
                                                            $('.scroll-link').on('click', function (event) {
                                                            event.preventDefault();
                                                            var sectionID = $(this).attr("data-id");
                                                            scrollToID('#' + sectionID, 750);
                                                            });
                                                            // scroll to top action
                                                            $('.scroll-top').on('click', function (event) {
                                                            event.preventDefault();
                                                            $('html, body').animate({scrollTop: 0}, 'slow');
                                                            });
                                                            // mobile nav toggle
                                                            $('#nav-toggle').on('click', function (event) {
                                                            event.preventDefault();
                                                            $('#main-nav').toggleClass("open");
                                                            });
                                                            });
                                                            // scroll function
                                                            function scrollToID(id, speed) {
                                                            var offSet = 0;
                                                            var targetOffset = $(id).offset().top - offSet;
                                                            var mainNav = $('#main-nav');
                                                            $('html,body').animate({scrollTop: targetOffset}, speed);
                                                            if (mainNav.hasClass("open")) {
                                                            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
                                                            mainNav.removeClass("open");
                                                            }
                                                            }
                                                            if (typeof console === "undefined") {
                                                            console = {
                                                            log: function () { }
                                                            };
                                                            }
        </script>
    </body>
</html>
