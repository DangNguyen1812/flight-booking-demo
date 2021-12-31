/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public interface AircraftSeatRepository extends CrudRepository<AircraftSeatEntity, Integer>{
    
    @Query(nativeQuery = true, value = "SELECT * FROM jv44_project_final_flightbooking.aircraft_seat where flight_id = ?1")
    List<AircraftSeatEntity> getListAircraftSeatByFlightId(int id);
    
   
}
