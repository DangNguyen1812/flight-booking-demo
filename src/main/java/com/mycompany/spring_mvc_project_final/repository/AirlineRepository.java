/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.AirlineEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public interface AirlineRepository extends CrudRepository<AirlineEntity, Integer>{
    
}
