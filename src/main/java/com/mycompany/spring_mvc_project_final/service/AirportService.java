/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AirportEntity;
import com.mycompany.spring_mvc_project_final.repository.AirportRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class AirportService {
    @Autowired AirportRepository airportRepository;
    
    public List<AirportEntity> getListAirport() {
        List<AirportEntity> listAirport = (List<AirportEntity>) airportRepository.findAll();
        return listAirport;
    }
    
    public AirportEntity getAirport(int id) {
        Optional<AirportEntity> optional = airportRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        }
        return new AirportEntity();
    }
    
    public void saveAirport(AirportEntity airportEntity) {
        airportRepository.save(airportEntity);
    }
}
