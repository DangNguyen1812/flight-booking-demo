/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public interface ServiceRepository extends CrudRepository<ServiceEntity, Integer>{
    
    @Query(nativeQuery = true, value = "SELECT * FROM jv44_project_final_flightbooking.service where name = 'luggage'")
    public List<ServiceEntity> getLuggage();
}
