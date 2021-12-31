/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var departureElement = document.getElementById('departure');
departureElement.onchange = function () {
    var flightRouteApi = `http://localhost:8080/Spring_MVC_Project_Final/api/flightRoutesByDepartureId/${departureElement.value}`;
    fetch(flightRouteApi)
            .then(function (response) {
                return response.json();
            })
            .then(function (aiportss) {
                var destination = aiportss.map(function (flightRoute) {
                    return `<option value=${flightRoute.destination.id}>${flightRoute.destination.city.name} (${flightRoute.destination.name})</option>`;
                });
                destination.unshift('<option>Select a location... </option>');
                document.getElementById('destination').innerHTML = destination.join('');
            })
            .catch(function (err) {
                document.getElementById('destination').innerHTML = '';
            });
};

//var destinationElement = document.getElementById('destination');
//destinationElement.onchange = function () {
//    var flightRouteApi = `http://localhost:8080/Spring_MVC_Project_Final/api/flightRoutesByDepartureId/${destinationElement.value}`;
//    fetch(flightRouteApi)
//            .then(function (response) {
//                return response.json();
//            })
//            .then(function (aiports) {
//                var departure = aiports.map(function (flightRoute) {
//                    return `<option value=${flightRoute.destination.id}>${flightRoute.destination.city.name} (${flightRoute.destination.name})</option>`;
//                });
//                document.getElementById('departure').innerHTML = departure.join('');
//            })
//            .catch(function (err) {
//                console.log('has error!');
//            });
//};

