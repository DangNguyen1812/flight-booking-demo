/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FlightRouteEntity;
import com.mycompany.spring_mvc_project_final.repository.FlightRouteRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class FlightRouteService {
    @Autowired
    private FlightRouteRepository flightRouteRepository;
    
    public List<FlightRouteEntity>  getDestinationByDeparture(int id) {
        List<FlightRouteEntity> listFlightRoutes =  flightRouteRepository.getDestinationByDeparture(id);
        return listFlightRoutes;
    }
    public List<FlightRouteEntity>  getDepartureByDestination(int id) {
        List<FlightRouteEntity> listFlightRoutes =  flightRouteRepository.getDepartureByDestination(id);
        return listFlightRoutes;
    }
    
    public List<FlightRouteEntity>  getFlighRoutes() {
        List<FlightRouteEntity> listFlightRoutes = (List<FlightRouteEntity>) flightRouteRepository.findAll();
        return listFlightRoutes;
    }
    

}
