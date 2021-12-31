/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.CityEntity;
import com.mycompany.spring_mvc_project_final.repository.CityRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class CityService {
    @Autowired
    private CityRepository cityRepository;
    
    public List<CityEntity> getListCity() {
        List<CityEntity> list = (List<CityEntity>) cityRepository.findAll();
        return list;
    }
    
    public void saveCity(CityEntity city){
        cityRepository.save(city);
    }
}
