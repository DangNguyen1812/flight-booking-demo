/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "aircraft")
public class AircraftEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column()
    private String name;
    
    @Column()
    private int number;
    
    @Column()
    private int rowNumber;
    
    @Column()
    private int colNumber;
    
    @OneToMany(mappedBy = "aircraftEntity")
    private List<AircraftSeatEntity> aircraftSeatEntity;
    
    @OneToMany(mappedBy = "aircraftEntity")
    private List<ImageEntity> imageEntity;
    
    @OneToMany(mappedBy = "aircraftEntity")
    private List<FlightEntity> flightEntity;

    public AircraftEntity() {
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    
    
    public int getRowNumber() {
        return rowNumber;
    }

    public void setRowNumber(int rowNumber) {
        this.rowNumber = rowNumber;
    }

    public int getColNumber() {
        return colNumber;
    }

    public void setColNumber(int colNumber) {
        this.colNumber = colNumber;
    }

    
    public List<AircraftSeatEntity> getAircraftSeatEntity() {
        return aircraftSeatEntity;
    }

    public void setAircraftSeatEntity(List<AircraftSeatEntity> aircraftSeatEntity) {
        this.aircraftSeatEntity = aircraftSeatEntity;
    }

    public List<ImageEntity> getImageEntity() {
        return imageEntity;
    }

    public void setImageEntity(List<ImageEntity> imageEntity) {
        this.imageEntity = imageEntity;
    }

    public List<FlightEntity> getFlightEntity() {
        return flightEntity;
    }

    public void setFlightEntity(List<FlightEntity> flightEntity) {
        this.flightEntity = flightEntity;
    }
    
    
    
}
