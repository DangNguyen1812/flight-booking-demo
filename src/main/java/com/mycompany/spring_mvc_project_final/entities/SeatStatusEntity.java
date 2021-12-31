/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.SeatStatus;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
@Table(name = "seat_status")
public class SeatStatusEntity implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column()
    @Enumerated(EnumType.STRING)
    private SeatStatus seatStatus;
    
    @OneToMany(mappedBy = "seatStatusEntity")
    private List<AircraftSeatEntity> aircraftSeatEntity;

    public SeatStatusEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SeatStatus getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(SeatStatus seatStatus) {
        this.seatStatus = seatStatus;
    }

    public List<AircraftSeatEntity> getAircraftSeatEntity() {
        return aircraftSeatEntity;
    }

    public void setAircraftSeatEntity(List<AircraftSeatEntity> aircraftSeatEntity) {
        this.aircraftSeatEntity = aircraftSeatEntity;
    }
    
    
}
