/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.FlightEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public interface FlightRepository extends CrudRepository<FlightEntity, Integer> {

    @Query(value = "select flight.* from flight \n"
            + "inner join flight_route on  flight_route.id = flight.flight_route_id\n"
            + "inner join airport on airport.id = flight_route.departure_id\n"
            + " where  departure_id = ?1  and destination_id = ?2 and flight.departDate = ?3 ",
            nativeQuery = true)
    List<FlightEntity> searchFlight(int departure, int destination, Date departDate);
}
