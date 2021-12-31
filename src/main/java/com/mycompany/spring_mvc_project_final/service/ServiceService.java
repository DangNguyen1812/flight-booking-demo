/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.repository.ServiceRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class ServiceService {
    @Autowired
    private ServiceRepository serviceRepository;
    
    public List<ServiceEntity> getLuggage() {
        return (List<ServiceEntity>) serviceRepository.getLuggage();
    }
    
    public ServiceEntity getServiceById(int id) {
        Optional<ServiceEntity> optional = serviceRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        }
        return null;
    }
}
