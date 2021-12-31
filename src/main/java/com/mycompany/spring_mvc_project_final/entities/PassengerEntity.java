/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;



import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "passenger")
public class PassengerEntity extends Personal implements Serializable{
    
    private String idenCode; 
    
    @OneToMany(mappedBy =  "passengerEntity",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<BookingDetailEntity> bookingDetailEntity;
    
    public PassengerEntity() {
    }

    public String getIdenCode() {
        return idenCode;
    }

    public void setIdenCode(String idenCode) {
        this.idenCode = idenCode;
    }

    public List<BookingDetailEntity> getBookingDetailEntity() {
        return bookingDetailEntity;
    }

    public void setBookingDetailEntity(List<BookingDetailEntity> bookingDetailEntity) {
        this.bookingDetailEntity = bookingDetailEntity;
    }      
    
}
