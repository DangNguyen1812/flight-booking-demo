/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.model;

/**
 *
 * @author ADMIN
 */
public class AircraftSeat {
    private int id;
    private Seat seat;
    private SeatStatusModel seatStatus;
    private SeatTypeModel seatType;
    private Aircraft aircraft;

    public AircraftSeat() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public SeatStatusModel getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(SeatStatusModel seatStatus) {
        this.seatStatus = seatStatus;
    }

    public SeatTypeModel getSeatType() {
        return seatType;
    }

    public void setSeatType(SeatTypeModel seatType) {
        this.seatType = seatType;
    }

    public Aircraft getAircraft() {
        return aircraft;
    }

    public void setAircraft(Aircraft aircraft) {
        this.aircraft = aircraft;
    }
    
    
    
}
