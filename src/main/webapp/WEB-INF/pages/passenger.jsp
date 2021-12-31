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
        <title>Passenger</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <jsp:include page="include/user/css-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/select-flight.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/passenger.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/themify-icons/themify-icons.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/bookingdetail.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/resources/fontawesome-free-5.15.4-web/css/all.min.css"/>" type="text/css"/>
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
                            <div class="passenger">
                                <div class="passenger-head">
                                    Passenger information
                                </div>
                                <div >
                                    <form action="${pageContext.request.contextPath}/selectSeat" method="post" class="form-passenger">
                                        <div class="passenger-form">
                                            <div class="passenger-form-header" >The representative</div>
                                            <div class="row">

                                                <div class="form-group col-6">
                                                    <input type="text" name="fullName" value="${booking.fullName}" class="form-control  representName namePassenger"   placeholder="Enter full name">
                                                    <div class="form-message"></div>                                    
                                                </div>

                                                <div class="form-group col-6">
                                                    <input type="date" name="birthday" value="<fmt:formatDate pattern = "yyyy-MM-dd" 
                                                                    value = "${booking.birthday}" />" class="form-control  representBirthday birthdayPassenger"  placeholder="Birthday">
                                                    <div class="form-message"></div>                                    
                                                </div> 


                                            </div>
                                            <div class="row">
                                                <div class="form-group col-6">
                                                    <input type="text" name="idenCode" value="${booking.idenCode}" class="form-control  representIdencode idencodePassenger"  placeholder="Identity code">
                                                    <div class="form-message"></div>                                    
                                                </div>

                                                <div class="form-group col-6 ">
                                                    <select name="gender" class=" custom-select representGender genderPassenger">
                                                        <option value="">Gender</option>
                                                        <c:if test="${booking.gender == 'MALE'}">
                                                            <option value="male" selected="">MALE</option>
                                                        </c:if>
                                                        <c:if test="${booking.gender == 'FEMALE'}">
                                                            <option value="female" selected="">FEMALE</option>
                                                        </c:if>
                                                        <c:if test="${booking.gender == 'OTHER'}">
                                                            <option value="other" selected="">OTHER</option>
                                                        </c:if>
                                                        <c:if test="${booking.gender != 'MALE'}">
                                                            <option value="male" >MALE</option>
                                                        </c:if>
                                                        <c:if test="${booking.gender != 'FEMALE'}">
                                                            <option value="female">FEMALE</option>
                                                        </c:if>
                                                        <c:if test="${booking.gender != 'OTHER'}">
                                                            <option value="other">OTHER</option>
                                                        </c:if>    



                                                    </select>
                                                    <div class="form-message"></div>                                    
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-12">
                                                    <input type="text" name="address" value="${booking.address}" class="form-control  representAddress addressPassenger"  placeholder="Address">
                                                    <div class="form-message"></div>                                    
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-6">
                                                    <input type="text" name="email" value="${booking.email}" class="form-control  representEmail emailPassenger"  placeholder="Email">
                                                    <div class="form-message"></div>                                    
                                                </div>

                                                <div class="form-group col-6">
                                                    <input type="text" name="phone" value="${booking.phone}" class="form-control  representPhone phonePassenger"  placeholder="Phone">
                                                    <div class="form-message"></div>                                    
                                                </div>
                                            </div>
                                        </div>
                                        <c:forEach var="x" items="${listBookingDetail}" varStatus="index">
                                            <div class="passenger-form">
                                                <div class="passenger-form-header" id="adult${index.index + 1}" >Passenger ${index.index +1}</div>
                                                <div class="row">

                                                    <div class="form-group col-6">
                                                        <input type="text" name="fullName" value="${x.passengerEntity.fullName}" class="form-control namePassenger" id="fullName${index.index}"  placeholder="Enter full name">
                                                        <div class="form-message"></div>                                    
                                                    </div>

                                                    <div class="form-group col-6">
                                                        <input type="date" name="birthday" value="<fmt:formatDate pattern = "yyyy-MM-dd" 
                                                                        value = "${x.passengerEntity.birthday}" />" class="form-control birthdayPassenger" id="birthday${index.index}" placeholder="Birthday">
                                                        <div class="form-message"></div>                                    
                                                    </div> 


                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-6">
                                                        <input type="text" name="idenCode" value="${x.passengerEntity.idenCode}" class="form-control idencodePassenger" id="idenCode${index.index}" placeholder="Identity code">
                                                        <div class="form-message"></div>                                    
                                                    </div>

                                                    <div class="form-group col-6 ">
                                                        <select name="gender" id="gender${index.index}" class="custom-select genderPassenger">
                                                            <option value="">Gender</option>
                                                            <c:if test="${x.passengerEntity.gender == 'MALE'}">
                                                                <option value="male" selected="">MALE</option>
                                                            </c:if>
                                                            <c:if test="${x.passengerEntity.gender == 'FEMALE'}">
                                                                <option value="female" selected="">FEMALE</option>
                                                            </c:if>
                                                            <c:if test="${x.passengerEntity.gender == 'OTHER'}">
                                                                <option value="other" selected="">OTHER</option>
                                                            </c:if>
                                                            <c:if test="${x.passengerEntity.gender != 'MALE'}">
                                                                <option value="male" >MALE</option>
                                                            </c:if>
                                                            <c:if test="${x.passengerEntity.gender != 'FEMALE'}">
                                                                <option value="female">FEMALE</option>
                                                            </c:if>
                                                            <c:if test="${x.passengerEntity.gender != 'OTHER'}">
                                                                <option value="other">OTHER</option>
                                                            </c:if>    



                                                        </select>
                                                        <div class="form-message"></div>                                    
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-12">
                                                        <input type="text" name="address" value="${x.passengerEntity.address}" class="form-control addressPassenger" id="address${index.index}" placeholder="Address">
                                                        <div class="form-message"></div>                                    
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group col-6">
                                                        <input type="text" name="email" value="${x.passengerEntity.email}" class="form-control emailPassenger" id="email${index.index}" placeholder="Email">
                                                        <div class="form-message"></div>                                    
                                                    </div>

                                                    <div class="form-group col-6">
                                                        <input type="text" name="phone" value="${x.passengerEntity.phone}" class="form-control phonePassenger" id="phone${index.index}" placeholder="Phone">
                                                        <div class="form-message"></div>                                    
                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>
                                    </form>
                                </div>


                            </div>
                            <div class="btn-save-info">
                                <button class="saveInfo btn-go-on" type="submit">
                                    Go on
                                </button>
                            </div>
                        </div>
                        <jsp:include page="booking-detail-right.jsp"/>
                    </div>            



                </div>



            </div>
            <jsp:include page="include/user/footer.jsp"/>    
        </div>
        <script src="<c:url value="/resources/js/booking-detail-right.js"/>"></script>
        <script src="<c:url value="/resources/js/select_flight.js"/>"></script>
        <script src="<c:url value="/resources/js/passenger.js"/>"></script>
        <script type="text/javascript">Cufon.now();</script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $('.form_5').jqTransform({
                    imgPath: 'jqtransformplugin/img/'
                });
            });
        </script>
        <script>
            var numberOfPassenger = ${passenger};
            function Passenger(fullName, birthday, idenCode, gender, address, email, phone) {
                this.fullName = fullName;
                this.birthday = birthday;
                this.idenCode = idenCode;
                this.gender = gender;
                this.address = address;
                this.email = email;
                this.phone = phone;

            }


            jQuery(document).ready(function ($) {
                var save = document.querySelector('.saveInfo');
                save.onclick = function (e) {
                    e.preventDefault();
                    var listPassengers = [];
                    var listIden = [];
                    // validate 
                    namePassenger.forEach(function (item) {
                        if (item.value === '') {
                            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
                            item.parentElement.querySelector('.form-message').classList.add('is-required');
                        }
                    });

                    birthdayPassenger.forEach(function (item) {
                        if (item.value === '') {
                            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
                            item.parentElement.querySelector('.form-message').classList.add('is-required');
                        }
                    });



                    genderPassenger.forEach(function (item) {
                        if (item.value === '') {
                            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
                            item.parentElement.querySelector('.form-message').classList.add('is-required');
                        }
                    });

                    addressPassenger.forEach(function (item) {
                        if (item.value === '') {
                            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
                            item.parentElement.querySelector('.form-message').classList.add('is-required');
                        }
                    });

                    emailPassenger.forEach(function (item) {
                        if (item.value === '') {
                            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
                            item.parentElement.querySelector('.form-message').classList.add('is-required');
                        }
                    });

                    phonePassenger.forEach(function (item) {
                        if (item.value === '') {
                            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
                            item.parentElement.querySelector('.form-message').classList.add('is-required');
                        }
                    });
                    // isValid --> use ajax
                    var representative = new Passenger();
                    representative.fullName = document.querySelector('.representName').value;
                    representative.birthday = document.querySelector('.representBirthday').value;
                    representative.idenCode = document.querySelector('.representIdencode').value;
                    representative.gender = document.querySelector('.representGender').value;
                    representative.address = document.querySelector('.representAddress').value;
                    representative.email = document.querySelector('.representEmail').value;
                    representative.phone = document.querySelector('.representPhone').value;

                    listPassengers.push(representative);

                    for (var i = 0; i < numberOfPassenger; i++) {
                        var passenger = new Passenger();

                        passenger.fullName = document.querySelector('#fullName' + i).value;
                        passenger.birthday = document.querySelector('#birthday' + i).value;
                        passenger.idenCode = document.querySelector('#idenCode' + i).value;
                        passenger.gender = document.querySelector('#gender' + i).value;
                        passenger.address = document.querySelector('#address' + i).value;
                        passenger.email = document.querySelector('#email' + i).value;
                        passenger.phone = document.querySelector('#phone' + i).value;

                        listIden.push(document.querySelector('#idenCode' + i).value);
                        listPassengers.push(passenger);

                    }
                    idencodePassenger.forEach(function (item) {
                        if (item.value === '') {
                            item.parentElement.querySelector('.form-message').innerHTML = 'This field is required';
                            item.parentElement.querySelector('.form-message').classList.add('is-required');
                        }

                    });
                    var checkIden = idencodePassenger.every(function (item) {
                        return item.value !== '';
                    });
                    console.log("aaa" + checkIden);

                    if (listIden.every((e, i, a) => a.indexOf(e) === i) === false) {

                        idencodePassenger.forEach(function (item) {
                            item.parentElement.querySelector('.form-message').innerHTML = 'The idencode is same';
                            item.parentElement.querySelector('.form-message').classList.add('is-required');
                        });
                    } else {
                        idencodePassenger.forEach(function (item) {
                            item.parentElement.querySelector('.form-message').innerHTML = '';
                            item.parentElement.querySelector('.form-message').classList.add('is-required');
                        });
                    }
                    if (checkIden === true) {
                        if (listIden.every((e, i, a) => a.indexOf(e) === i) === true) {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json",
                                url: '${pageContext.request.contextPath}/savePassengerInfo',
                                dataType: 'text',
                                data: JSON.stringify(listPassengers),
                                success: function (data) {
                                    console.log("SUCCESS: ", data);
                                    window.location.href = '${pageContext.request.contextPath}/selectSeat';
                                },
                                error: function (e) {
                                    console.log("ERROR: ", e);

                                },
                                done: function (e) {
                                    console.log("DONE");
                                }

                            });
                        } else {
                            console.log(false);
                        }
                    }

//



                };
            });



        </script>
    </body>
</html>
