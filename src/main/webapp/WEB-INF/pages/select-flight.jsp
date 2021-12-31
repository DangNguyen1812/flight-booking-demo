<%-- 
    Document   : select-flight
    Created on : Nov 11, 2021, 12:37:21 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select flight</title>
        <style>
            body {

            }


            .block {
                width: 300px;
                height: auto;
                background-color: #e6f2ff;

            }
            .detail {
                background-color: #ffffcc;
                height: 100px;
                margin: 0;
                display: none;
            }
            .content {
                background-color: #b3ffb3;               
                display: none;
                margin: 0;
                height: 100px;
            }
            .container-content {
                background-color: #cce0ff;
            }
            p{
                margin: 0;
            }
            .block-default {
                display: block;
            }
        </style>
    </head>
    <body>
        <header>

        </header>
        <div class="block" id="block1">
            <div class="container-content">
                <div class="detail-path">click here to show detail</div>
                <div class="content-path">Click here to show content</div>
            </div>
            <div class="detail">
                <div>
                    <p>detail</p>
                </div>
            </div>
            <div class="content">
                <div>
                    <p>content</p>
                </div>
            </div>
        </div>
        <div class="block" id="block2">
            <div class="container-content">
                <div class="detail-path">click here to show detail</div>
                <div class="content-path">Click here to show content</div>
            </div>
            <div class="detail">
                <div>
                    <p>detail</p>
                </div>
            </div>
            <div class="content">
                <div>
                    <p>content</p>
                </div>
            </div>
        </div>
        <div class="block" id="block3">
            <div class="container-content">
                <div class="detail-path">click here to show detail</div>
                <div class="content-path">Click here to show content</div>
            </div>
            <div class="detail">
                <div>
                    <p>detail</p>
                </div>
            </div>
            <div class="content">
                <div>
                    <p>content</p>
                </div>
            </div>
        </div>
        <script>
            var detailElements = Array.from(document.querySelectorAll('.detail'));
            var contentElements = Array.from(document.querySelectorAll('.content'));
            var enableBlocks = Array.from(document.querySelectorAll('.block'));
            enableBlocks.forEach(function (block) {
                var detailPathElement = document.querySelector('#' + block.id + ' .detail-path');
                var contentPathElement = document.querySelector('#' + block.id + ' .content-path');
                detailPathElement.onclick = function () {
                    detailElements.forEach(function (detail) {
                        var isSameDetail = block === detail.parentElement;
                        if (detail.classList.contains('block-default') && !isSameDetail) {
                            detail.classList.remove('block-default');
                        }
                    });

                    contentElements.forEach(function (content) {
                        if (content.classList.contains('block-default')) {
                            content.classList.remove('block-default');
                        }
                    });

                    document.querySelector('#' + block.id + ' .detail').classList.toggle('block-default');
                }

                contentPathElement.onclick = function () {
                    detailElements.forEach(function (detail) {
                        if (detail.classList.contains('block-default')) {
                            detail.classList.remove('block-default');
                        }
                    });
                    contentElements.forEach(function (content) {
                        var isSameContent = block === content.parentElement;
                        if (content.classList.contains('block-default') && !isSameContent) {
                            content.classList.remove('block-default');
                        }
                    });

                    document.querySelector('#' + block.id + ' .content').classList.toggle('block-default');
                };

            });
        </script>
    </body>
</html>
