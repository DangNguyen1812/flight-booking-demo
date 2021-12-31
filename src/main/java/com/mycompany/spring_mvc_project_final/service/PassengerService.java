/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.PassengerEntity;
import com.mycompany.spring_mvc_project_final.repository.PassengerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class PassengerService {
    @Autowired
    private PassengerRepository passengerRepository;
    
    public void savePassenger(PassengerEntity passenger) {
        passengerRepository.save(passenger);
    }
}
