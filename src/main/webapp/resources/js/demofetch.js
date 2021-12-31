/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var flightRouteApi = `http://localhost:8080/Spring_MVC_Project_Final/api/flightRoutes`;
fetch(flightRouteApi)
        .then(function (response) {
            return response.json();
        })
        .then(function (flightRoutes) {
            var departures = flightRoutes.map(function (flightRoute) {
                return `<option value=${flightRoute.departure.id}>${flightRoute.departure.name}</option>`;
            });
            console.log(flightRoutes);
            var departure = departures.join('');
            document.getElementById('departure').innerHTML = departure;

//            var demo = document.querySelector('.demo');
//            demo.onclick = function () {
//                document.getElementById('dang').innerHTML = html;
//            }
        })
        .catch(function (err) {
            console.log('has error!');
        });
        var departureElement = document.getElementById('departure');
        departureElement.onchange = function () {
            var a = `aaaa ${departureElement.value}`
            console.log(a)
            var flightRouteApi2 = `http://localhost:8080/Spring_MVC_Project_Final/api/flightRoute/${departureElement.value}`;
                fetch(flightRouteApi2)
                .then(function (response) {
                return response.json();
                })
                .then(function (aiports) {
                    var destination = aiports.map(function (flightRoute) {
                        return `<option value=${flightRoute.destination.id}>${flightRoute.destination.name}</option>`;
                    });
                    document.getElementById('destination').innerHTML = destination.join('');
                })
                .catch(function (err) {
                console.log('has error!');
                });
        };
        
        

