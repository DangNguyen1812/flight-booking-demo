/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.SeatEntity;
import com.mycompany.spring_mvc_project_final.repository.SeatRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class SeatService {
    @Autowired
    private SeatRepository seatRepository;
    
    public void saveSeat(SeatEntity seat) {
        seatRepository.save(seat);
    }
    
    public List<SeatEntity> getSeats() {
        List<SeatEntity> listSeats = (List<SeatEntity>) seatRepository.findAll();
        return listSeats;
    }
    
    public SeatEntity findSeatBySeatNumber(String number) {
        SeatEntity optional =seatRepository.findByNumber(number);
        
        return optional;
    }
}
