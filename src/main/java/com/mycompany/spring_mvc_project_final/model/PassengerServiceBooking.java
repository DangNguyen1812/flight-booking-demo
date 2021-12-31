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
public class PassengerServiceBooking {
    private String idenCode;
    private int serviceId;
    private String serviceLuggage;

    public PassengerServiceBooking() {
    }

    public String getIdenCode() {
        return idenCode;
    }

    public void setIdenCode(String idenCode) {
        this.idenCode = idenCode;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceLuggage() {
        return serviceLuggage;
    }

    public void setServiceLuggage(String serviceLuggage) {
        this.serviceLuggage = serviceLuggage;
    }
    
    
}
