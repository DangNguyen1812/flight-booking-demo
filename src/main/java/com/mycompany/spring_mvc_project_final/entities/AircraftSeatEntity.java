/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "aircraft_seat")
public class AircraftSeatEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;    
    
    @ManyToOne
    @JoinColumn(name = "seat_id")
    private SeatEntity seatEntity;
    
    @ManyToOne
    @JoinColumn(name = "seat_status_id")
    private SeatStatusEntity seatStatusEntity;
    
    
    @ManyToOne
    @JoinColumn(name = "seat_type_id")
    private SeatTypeEntity seatTypeEntity;
    
    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftEntity aircraftEntity;
    
    @ManyToOne()
    @JoinColumn(name = "flight_id")
    private FlightEntity flightEntity;

    public AircraftSeatEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SeatEntity getSeatEntity() {
        return seatEntity;
    }

    public void setSeatEntity(SeatEntity seatEntity) {
        this.seatEntity = seatEntity;
    }

    public SeatStatusEntity getSeatStatusEntity() {
        return seatStatusEntity;
    }

    public void setSeatStatusEntity(SeatStatusEntity seatStatusEntity) {
        this.seatStatusEntity = seatStatusEntity;
    }

    public SeatTypeEntity getSeatTypeEntity() {
        return seatTypeEntity;
    }

    public void setSeatTypeEntity(SeatTypeEntity seatTypeEntity) {
        this.seatTypeEntity = seatTypeEntity;
    }

    public AircraftEntity getAircraftEntity() {
        return aircraftEntity;
    }

    public void setAircraftEntity(AircraftEntity aircraftEntity) {
        this.aircraftEntity = aircraftEntity;
    }

    public FlightEntity getFlightEntity() {
        return flightEntity;
    }

    public void setFlightEntity(FlightEntity flightEntity) {
        this.flightEntity = flightEntity;
    }
    
    
}
