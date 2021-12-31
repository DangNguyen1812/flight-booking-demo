/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.model;

import com.mycompany.spring_mvc_project_final.enums.SeatStatus;

/**
 *
 * @author ADMIN
 */
public class SeatStatusModel {
    private int id;
    private SeatStatus seatStatus;

    public SeatStatusModel() {
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
    
    
}
