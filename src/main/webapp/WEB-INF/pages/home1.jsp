<%-- 
    Document   : home1
    Created on : Oct 23, 2021, 8:29:33 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <jsp:include page="include/user/css-page.jsp"/>

        <jsp:include page="include/user/js-page.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/home.css" />" type="text/css"/>
    </head>
    <body id="page1">
        <div class="main">
            <!--header -->
            <jsp:include page="include/user/menu.jsp"/>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <div class="for_banners">
                    <div class="form-flight">
                        <mvc:form  id="form-search" action="${pageContext.request.contextPath}/searchFlight" method="POST" modelAttribute="flight">
                            <div>

                                <div class="form-radio">

                                    <div>
                                        <input type="radio" name="trip" checked value="round" id="round">
                                        <span class="radio-trip"> Round trip </span>
                                    </div>
                                    <div>
                                        <input type="radio" name="trip"  value="one-way" id="oneway">
                                        <span class="radio-trip">One way </span>                                      
                                    </div>
                                </div>

                                <div class="form-group"> 
                                    <label for="departure" class="form-label">Departure</label>
                                    <select  name="flightRouteEntity.departure.id"  id="departure" " class="form-control departure">
                                        <option value="" >Select a location...</option>
                                        <c:forEach items="${airports}" var="airport">
                                            <option value="${airport.id}" >${airport.cityEntity.name} (${airport.name})</option>
                                        </c:forEach>
                                    </select>
                                    <span class="form-message"></span>
                                </div>

                                <div class="form-group"> 
                                    <label for="destination" class="form-label">Destination</label>
                                    <select  name="flightRouteEntity.destination.id"  id="destination" class="form-control destination">
                                        <option value="" >Select a location...</option>
                                        <c:forEach items="${airports}" var="airport">
                                            <option value="${airport.id}" >${airport.cityEntity.name} (${airport.name})</option>
                                        </c:forEach>
                                    </select>
                                    <span class="form-message"></span>
                                </div>

                                <div class="form-group" id="departDate">
                                    <label for="departDate1" class="form-label">Departure date:</label>
                                    <input name="departDate" type="text"  id="departDate1" placeholder="Select date..." class="departDate form-control" onfocus="(this.type = 'date')">
                                    <span class="form-message"></span>
                                </div>

                                <div class="form-group" id="returnDate">
                                    <label for="returnDate1" class="form-label">Return date:</label>
                                    <input name="returnDate" type="text" id="returnDate1" placeholder="Select date..."  class="returnDate form-control" onfocus="(this.type = 'date')">
                                    <span class="form-message"></span>
                                </div>

                                <div class="form-group"> 
                                    <label for="passenger" class="form-label">Passenger</label>
                                    <input type="number" value="1" class="form-control" name="passenger" id="passenger" min="1">
                                    <span class="form-message"></span>
                                </div>

                                <button type="submit"  class="form-submit order-ticket">Order Ticket</button>

                            </div>
                        </mvc:form>
                    </div>  
                </div>
<!--             <h2><a href="<c:url value="/add-Flight" />">Select Flight</a></h2>-->
                                <div class="wrapper pad1">
                                    <article class="col1">
                                        <div class="box1">
                                            <h2 class="top">Offers of the Week from UK</h2>
                                            <div class="pad"> <strong>From Birmingham</strong><br>
                                                <ul class="pad_bot1 list1">
                                                    <li> <span class="right color1">from GBP 143.-</span> <a href="book2.html">Zurich</a> </li>
                                                </ul>
                                                <strong>From London City</strong><br>
                                                <ul class="pad_bot1 list1">
                                                    <li> <span class="right color1">from GBP 176.-</span> <a href="book2.html">Basel</a> </li>
                                                    <li> <span class="right color1">from GBP 109.-</span> <a href="book2.html">Geneva</a> </li>
                                                </ul>
                                                <strong>From London Heathrow</strong><br>
                                                <ul class="pad_bot2 list1">
                                                    <li> <span class="right color1">from GBP 100.-</span> <a href="book2.html">Geneva</a> </li>
                                                    <li> <span class="right color1">from GBP 112.-</span> <a href="book2.html">Zurich</a> </li>
                                                    <li> <span class="right color1">from GBP 88.-</span> <a href="book2.html">Basel</a> </li>
                                                </ul>
                                            </div>
                                            <h2>From Ireland To Switzerland</h2>
                                            <div class="pad"> <strong>From Dublin</strong><br>
                                                <ul class="pad_bot2 list1">
                                                    <li class="pad_bot1"> <span class="right color1">from EUR 122.-</span> <a href="book2.html">Zurich</a> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="col2">
                                        <h3>About Our Airlines<span>Template created by TemplateMonster.com team</span></h3>
                                        <div class="wrapper">
                                            <article class="cols">
                                                <figure><img src="<c:url value="/resources/images/page1_img1.jpg"/>" alt="" class="pad_bot2"></figure>
                                                <p class="pad_bot1"><strong>Airlines is one of free website templates created by TemplateMonster.com team.</strong></p>
                                                <p>This website template is optimized for 1024X768 screen resolution. It is also XHTML &amp; CSS valid. This website template has several pages: <a href="index.html">About</a>, <a href="offers.html">Offers</a>, <a href="book.html">Book</a>, <a href="services.html">Services</a>, <a href="safety.html">Safety</a>, <a href="contacts.html">Contacts</a>.</p>
                                            </article>
                                            <article class="cols pad_left1">
                                                <figure><img src="<c:url value="/resources/images/page1_img2.jpg"/>" alt="" class="pad_bot2"></figure>
                                                <p class="pad_bot1"><strong>This Airlines Template goes with two packages.</strong></p>
                                                <p>With PSD source files and without them. PSD source files are available for free for the registered members of Templates.com. The basic package (without PSD source files) is available for anyone without registration).</p>
                                            </article>
                                        </div>
                                        <a href="#" class="button1"><strong>Read More</strong></a> </article>
                                </div>
            </section>
            <!--content end-->

            <!--footer -->
            <jsp:include page="include/user/footer.jsp"/>
            <!--footer end-->
        </div>
        <script type="text/javascript" src="<c:url value="/resources/js/validate_form.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/homefetch.js"/>"></script>
        <script language="javascript">
                                        var today = new Date();
                                        var dd = String(today.getDate()).padStart(2, '0');
                                        var mm = String(today.getMonth() + 1).padStart(2, '0');
                                        var yyyy = today.getFullYear();

                                        today = yyyy + '-' + mm + '-' + dd;
                                        $('#departDate1').attr('min', today);
                                        $('#returnDate1').attr('min', today);
        </script>
        <script >
                    Validator({
                        form: '#form-search',
                        errorSelector: '.form-message',
                        formGroup: '.form-group',
                        rules: [
                            Validator.isRequired('.departure'),
                            Validator.isRequired('.destination'),
                            Validator.isRequired('.departDate'),
                            Validator.isRequired('.returnDate'),
                            Validator.isValidPassenger('#passenger'),
                            Validator.isConfirmed('.password-confirm', function () {
                                return  document.querySelector('#form-search .password').value;
                            }, 'password does not match')
                        ]
//            ,
//            onSubmit: function (data) {
//                console.log(data);
//            }
                    });
//                                        var depatdate = document.querySelector('.departDate');
//                                        var retudate = document.querySelector('.returnDate');
//                                        var onsubit = document.querySelector('.order-ticket');
//                                        onsubit.onclick = function (e) {
//                                            
//                                            if (depatdate.value !== "") {
//                                                document.getElementById(form-search).submit();
//                                            } else {
//
//                                            }
//                                        };


            document.getElementById("oneway").onclick = function () {
                document.getElementById('returnDate1').value = '';
                document.getElementById('returnDate').style.display = 'none';
            };

            document.getElementById("round").onclick = function () {
                document.getElementById('returnDate').style.display = '';
            };

        </script>

        <script type="text/javascript">Cufon.now();</script>

        <script type="text/javascript">

            $(document).ready(function () {
                tabs.init();
            });
            jQuery(document).ready(function ($) {
                $('#form_1, #form_2, #form_3').jqTransform({
                    imgPath: 'jqtransformplugin/img/'
                });
            });
            $(window).load(function () {
                $('#slider').nivoSlider({
                    effect: 'fade', //Specify sets like: 'fold,fade,sliceDown, sliceDownLeft, sliceUp, sliceUpLeft, sliceUpDown, sliceUpDownLeft' 
                    slices: 15,
                    animSpeed: 500,
                    pauseTime: 6000,
                    startSlide: 0, //Set starting Slide (0 index)
                    directionNav: false, //Next & Prev
                    directionNavHide: false, //Only show on hover
                    controlNav: false, //1,2,3...
                    controlNavThumbs: false, //Use thumbnails for Control Nav
                    controlNavThumbsFromRel: false, //Use image rel for thumbs
                    controlNavThumbsSearch: '.jpg', //Replace this with...
                    controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
                    keyboardNav: true, //Use left & right arrows
                    pauseOnHover: true, //Stop animation while hovering
                    manualAdvance: false, //Force manual transitions
                    captionOpacity: 1, //Universal caption opacity
                    beforeChange: function () {},
                    afterChange: function () {},
                    slideshowEnd: function () {} //Triggers after all slides have been shown
                });
            });
        </script>
    </body>
</html>
