/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.model;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class TransferPassenger implements Serializable{
    private List<Passenger> passengers;

    public TransferPassenger() {
    }

    public List<Passenger> getPassengers() {
        return passengers;
    }

    public void setPassengers(List<Passenger> passengers) {
        this.passengers = passengers;
    }
    
    
    
}
