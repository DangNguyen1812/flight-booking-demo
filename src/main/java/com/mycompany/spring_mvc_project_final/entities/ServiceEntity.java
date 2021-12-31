/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.ServiceStatus;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
@Table(name = "service")
public class ServiceEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column()
    private String name;
    
    @Column()
    private String description;
    
    @Column()
    private double price;
    
    @Column()
    @Enumerated(EnumType.STRING)
    private ServiceStatus status;
    
    @OneToMany(mappedBy = "serviceEntity",fetch = FetchType.LAZY)
    private List<ImageEntity> imageEntity;
    
    @OneToMany(mappedBy = "serviceEntity",fetch = FetchType.LAZY)
    private List<ServiceBookingEntity> serviceBookingEntity;

    public ServiceEntity() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public ServiceStatus getStatus() {
        return status;
    }

    public void setStatus(ServiceStatus status) {
        this.status = status;
    }

    public List<ImageEntity> getImageEntity() {
        return imageEntity;
    }

    public void setImageEntity(List<ImageEntity> imageEntity) {
        this.imageEntity = imageEntity;
    }

    public List<ServiceBookingEntity> getServiceBookingEntity() {
        return serviceBookingEntity;
    }

    public void setServiceBookingEntity(List<ServiceBookingEntity> serviceBookingEntity) {
        this.serviceBookingEntity = serviceBookingEntity;
    }
    
    
}
