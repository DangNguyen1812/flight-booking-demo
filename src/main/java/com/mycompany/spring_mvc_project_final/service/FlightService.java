/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FlightEntity;
import com.mycompany.spring_mvc_project_final.repository.FlightRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class FlightService {
    @Autowired
    private FlightRepository flightRepository;
    
    public List<FlightEntity> seachFlight(int departure, int destination, Date departDate) {
        List<FlightEntity> flights = flightRepository.searchFlight(departure, destination, departDate);
        return flights;
    }
    
    public FlightEntity findFlightById(int id) {
        Optional<FlightEntity> optional = flightRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        }
        return new FlightEntity();
    }
}
