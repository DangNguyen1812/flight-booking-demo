
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

   

        
    </head>
    <body style="background:#dadde6;">
 
        <div class="padding">
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <form id="form-payment" >
                            <div class="card-header">
                                <strong>Thẻ tín dụng</strong>
                            </div>
                            <div class="card-header">
                                <img style="width: 100%" class="img-responsive cc-img" src="http://www.prepbootstrap.com/Content/images/shared/misc/creditcardicons.png">
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="credit-card-name">Tên</label>
                                            <input id="credit-card-name" class="form-control" id="name" type="text" placeholder="Nhập tên của bạn">
                                            <span class="form-message" style="color: red;font-size: 9px"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="credit-card-number">Số thẻ</label>
                                            <input id="credit-card-number" class="form-control" type="text" placeholder="000 000 000">                         
                                               <span class="form-message" style="color: red;font-size: 9px"></span>                                                                                                                          
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-4">
                                        <label for="credit-card-month">Tháng</label>
                                        <select class="form-control" id="credit-card-month">
                                            <option></option>
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
                                       <span class="form-message" style="color: red;font-size: 9px"></span>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label for="credit-cart-year">Năm</label>
                                        <select class="form-control" id="credit-cart-year">
                                            <option></option>
                                            <option>2019</option>
                                            <option>2020</option>
                                            <option>2021</option>
                                            <option>2022</option>
                                            <option>2023</option>
                                            <option>2024</option>
                                            <option>2025</option>
                                        </select>
                                       <span class="form-message" style="color: red;font-size: 9px"></span>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="credit-card-cvv">CVV/CVC</label>
                                            <input class="form-control" id="credit-card-cvv" type="password" maxlength="3">
                                            <span class="form-message" style="color: red;font-size: 9px"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <p id="message-payment" style="color: red"></p>
                                    </div>
                                </div>
                            </div>
                            <div id="change-payment" class="card-footer" style="padding-left: 35%">
                                <button id="payment-submit" style="width: 50%;height: 40px;" class="btn btn-sm btn-success" type="submit">Thanh Toán</button>
                            </div>
                            <div id="change-payment1" class="card-footer display-chnage-payment" style="padding-left: 35%">
                                <button onclick="location.href = '<c:url value="/home"/>'" style="width: 50%;height: 40px;" class="btn btn-sm btn-success">Tìm kiếm mới</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
