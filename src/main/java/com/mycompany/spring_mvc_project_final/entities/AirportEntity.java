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
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "airport")
public class AirportEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column()
    private String name;
    
    @ManyToOne
    @JoinColumn(name =  "city_id")
    private CityEntity cityEntity;
    
    @OneToMany(mappedBy = "airportEntity",fetch = FetchType.LAZY)
    private List<ImageEntity> imageEntity;
    
    @OneToMany(mappedBy = "departure",fetch = FetchType.LAZY)
    private List<FlightRouteEntity> flightRouteEntity;
    
    @OneToMany(mappedBy = "destination",fetch = FetchType.LAZY)
    private List<FlightRouteEntity> flightRouteEntity1;

    public AirportEntity() {
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

    public CityEntity getCityEntity() {
        return cityEntity;
    }

    public void setCityEntity(CityEntity cityEntity) {
        this.cityEntity = cityEntity;
    }

    public List<ImageEntity> getImageEntity() {
        return imageEntity;
    }

    public void setImageEntity(List<ImageEntity> imageEntity) {
        this.imageEntity = imageEntity;
    }

    public List<FlightRouteEntity> getFlightRouteEntity() {
        return flightRouteEntity;
    }

    public void setFlightRouteEntity(List<FlightRouteEntity> flightRouteEntity) {
        this.flightRouteEntity = flightRouteEntity;
    }

    public List<FlightRouteEntity> getFlightRouteEntity1() {
        return flightRouteEntity1;
    }

    public void setFlightRouteEntity1(List<FlightRouteEntity> flightRouteEntity1) {
        this.flightRouteEntity1 = flightRouteEntity1;
    }
    
    
}
