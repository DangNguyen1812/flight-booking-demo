/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.api;

import com.mycompany.spring_mvc_project_final.entities.FlightRouteEntity;
import com.mycompany.spring_mvc_project_final.model.FlightRoute;
import com.mycompany.spring_mvc_project_final.service.FlightRouteService;
import com.mycompany.spring_mvc_project_final.utils.ConverterUtils;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ADMIN
 */
@RestController
@RequestMapping("/api")
public class FlightRouteApiController {
    @Autowired
    private FlightRouteService flightRouteService;
    
    @RequestMapping(value = "/flightRoutes", method = RequestMethod.GET)
    public ResponseEntity<List<FlightRoute>> getFlightRoutes() {
        List<FlightRouteEntity> flightRouteEntitys = flightRouteService.getFlighRoutes();
        if(flightRouteEntitys != null && flightRouteEntitys.size() > 0) {
            List<FlightRoute> flightRoutes = new ArrayList<>();
            for(FlightRouteEntity flightRouteEntity:flightRouteEntitys) {
                flightRoutes.add(SecurityUtils.convertFlightRouteFromFlightRouteEntity(flightRouteEntity));
            }
            return new ResponseEntity<List<FlightRoute>>(flightRoutes, HttpStatus.OK);
        } else {
            return new ResponseEntity(HttpStatus.NO_CONTENT);
        }
        
    }
    
    @RequestMapping(value = "/flightRoutesByDepartureId/{departureId}", method = RequestMethod.GET)
    public ResponseEntity<List<FlightRoute>> getFlightRoutesByDepartureId(@PathVariable("departureId")int id) {
        List<FlightRouteEntity> flightRouteEntitys = flightRouteService.getDestinationByDeparture(id);
        if(flightRouteEntitys != null && flightRouteEntitys.size() > 0) {
            List<FlightRoute> flightRoutes = new ArrayList<>();
            for(FlightRouteEntity flightRouteEntity:flightRouteEntitys) {
                flightRoutes.add(SecurityUtils.convertFlightRouteFromFlightRouteEntity(flightRouteEntity));
            }
            return new ResponseEntity<List<FlightRoute>>(flightRoutes, HttpStatus.OK);
        } else {
            return new ResponseEntity(HttpStatus.NO_CONTENT);
        }
        
    }
    @RequestMapping(value = "/flightRoutesByDestinationId/{destinationId}", method = RequestMethod.GET)
    public ResponseEntity<List<FlightRoute>> getFlightRoutesByDestinationId(@PathVariable("destinationId")int id) {
        List<FlightRouteEntity> flightRouteEntitys = flightRouteService.getDepartureByDestination(id);
        if(flightRouteEntitys != null && flightRouteEntitys.size() > 0) {
            List<FlightRoute> flightRoutes = new ArrayList<>();
            for(FlightRouteEntity flightRouteEntity:flightRouteEntitys) {
                flightRoutes.add(SecurityUtils.convertFlightRouteFromFlightRouteEntity(flightRouteEntity));
            }
            return new ResponseEntity<List<FlightRoute>>(flightRoutes, HttpStatus.OK);
        } else {
            return new ResponseEntity(HttpStatus.NO_CONTENT);
        }
        
    }
}
