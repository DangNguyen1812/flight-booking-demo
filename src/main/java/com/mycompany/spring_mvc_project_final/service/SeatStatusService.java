/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.SeatStatusEntity;
import com.mycompany.spring_mvc_project_final.repository.SeatStatusRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class SeatStatusService {
    @Autowired
    private SeatStatusRepository seatStatusRepository;
    
    public List<SeatStatusEntity> getSeatStatuss() {
        List<SeatStatusEntity> listSeatStatus = (List<SeatStatusEntity>) seatStatusRepository.findAll();
        return listSeatStatus;
    }
}
