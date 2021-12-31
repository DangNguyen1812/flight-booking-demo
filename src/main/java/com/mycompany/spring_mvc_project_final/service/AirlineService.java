/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AirlineEntity;
import com.mycompany.spring_mvc_project_final.repository.AirlineRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class AirlineService {
    @Autowired
    private AirlineRepository airlineRepository;
    
    public List<AirlineEntity> getAirlines () {
        List<AirlineEntity> listAirline = (List<AirlineEntity>) airlineRepository.findAll();
        
        return  listAirline;
    }
}
