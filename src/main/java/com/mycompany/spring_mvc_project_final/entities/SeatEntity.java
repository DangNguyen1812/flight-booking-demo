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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "seat")
public class SeatEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(nullable = false)
    private String number;
    
    @OneToMany(mappedBy = "seatEntity",fetch = FetchType.LAZY)
    private List<BookingDetailEntity> bookingDetailEntity;
    
    @OneToMany(mappedBy = "seatEntity",fetch = FetchType.LAZY)
    private List<AircraftSeatEntity> aircraftSeatEntity;

    public SeatEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public List<BookingDetailEntity> getBookingDetailEntity() {
        return bookingDetailEntity;
    }

    public void setBookingDetailEntity(List<BookingDetailEntity> bookingDetailEntity) {
        this.bookingDetailEntity = bookingDetailEntity;
    }

    public List<AircraftSeatEntity> getAircraftSeatEntity() {
        return aircraftSeatEntity;
    }

    public void setAircraftSeatEntity(List<AircraftSeatEntity> aircraftSeatEntity) {
        this.aircraftSeatEntity = aircraftSeatEntity;
    }
    
    
}
