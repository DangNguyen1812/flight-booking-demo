/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatEntity;
import com.mycompany.spring_mvc_project_final.repository.AircraftSeatRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class AircraftSeatService {
    @Autowired
    private AircraftSeatRepository aircraftSeatRepository;
    
    public void saveAircraftSeat(AircraftSeatEntity aircraftSeat) {
        aircraftSeatRepository.save(aircraftSeat);
    }
    public List<AircraftSeatEntity> getListAircraftSeatEntityByFlightId(int id) {
        List<AircraftSeatEntity> listAircraftSeat = (List<AircraftSeatEntity>) aircraftSeatRepository.getListAircraftSeatByFlightId(id);
        return listAircraftSeat;
    }
    
    public AircraftSeatEntity getAircraftSeatEntityById(int id) {
        Optional<AircraftSeatEntity> optional = aircraftSeatRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        }
        return new AircraftSeatEntity();
    }
}
