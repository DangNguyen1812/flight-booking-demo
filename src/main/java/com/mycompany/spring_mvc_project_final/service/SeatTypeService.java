/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.SeatTypeEntity;
import com.mycompany.spring_mvc_project_final.repository.SeatTypeRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class SeatTypeService {
    @Autowired
    private SeatTypeRepository seatTypeRepository;
    
    public List<SeatTypeEntity> getSeatTypes() {
        List<SeatTypeEntity> listSeatTypes = (List<SeatTypeEntity>) seatTypeRepository.findAll();
        return listSeatTypes;
    }
    
    public SeatTypeEntity getSeatTypeById(int id) {
        Optional<SeatTypeEntity> optional = seatTypeRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        }
        return new SeatTypeEntity();
    }
}
