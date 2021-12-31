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
@Table(name = "image")
public class ImageEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column()
    private String name;
    
    @ManyToOne
    @JoinColumn(name = "service_id")
    private ServiceEntity serviceEntity;
    
    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftEntity aircraftEntity;
    
    @ManyToOne
    @JoinColumn(name = "airport_id")
    private AirportEntity airportEntity;

    public ImageEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ServiceEntity getServiceEntity() {
        return serviceEntity;
    }

    public void setServiceEntity(ServiceEntity serviceEntity) {
        this.serviceEntity = serviceEntity;
    }

    public AircraftEntity getAircraftEntity() {
        return aircraftEntity;
    }

    public void setAircraftEntity(AircraftEntity aircraftEntity) {
        this.aircraftEntity = aircraftEntity;
    }

    public AirportEntity getAirportEntity() {
        return airportEntity;
    }

    public void setAirportEntity(AirportEntity airportEntity) {
        this.airportEntity = airportEntity;
    }
    
    
}
