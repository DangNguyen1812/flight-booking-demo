/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "flight")
public class FlightEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @ManyToMany(mappedBy = "flightEntity")
    private List<PromotionEntity> promotionEntity;
    
    @Column()
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date departDate;
    
    
    @Column()
    @Temporal(TemporalType.TIME)
    private Date departTime;
    
    @Column()
    @Temporal(TemporalType.TIME)
    private Date arrivalTime;
    
    @ManyToOne
    @JoinColumn(name = "flight_route_id")
    private FlightRouteEntity flightRouteEntity;
    
    @ManyToOne
    @JoinColumn(name = "airline_id")
    private AirlineEntity airlineEntity;
    
    @OneToMany(mappedBy = "flightEntity",fetch = FetchType.LAZY)
    private List<BookingDetailEntity> bookingDetailEntity;
    
    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftEntity aircraftEntity;
    
    @OneToMany(mappedBy =  "flightEntity",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<AircraftSeatEntity> aircraftSeatEntity;
    
    @Transient
    private String trip;
    
    @Transient
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date returnDate;

    public FlightEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<PromotionEntity> getPromotionEntity() {
        return promotionEntity;
    }

    public void setPromotionEntity(List<PromotionEntity> promotionEntity) {
        this.promotionEntity = promotionEntity;
    }

    public Date getDepartDate() {
        return departDate;
    }

    public void setDepartDate(Date departDate) {
        this.departDate = departDate;
    }

    public Date getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Date arrivalTime) {
        this.arrivalTime = arrivalTime;
    }
    
    
    

    public Date getDepartTime() {
        return departTime;
    }

    public void setDepartTime(Date departTime) {
        this.departTime = departTime;
    }



    public FlightRouteEntity getFlightRouteEntity() {
        return flightRouteEntity;
    }

    public void setFlightRouteEntity(FlightRouteEntity flightRouteEntity) {
        this.flightRouteEntity = flightRouteEntity;
    }

    public AirlineEntity getAirlineEntity() {
        return airlineEntity;
    }

    public void setAirlineEntity(AirlineEntity airlineEntity) {
        this.airlineEntity = airlineEntity;
    }

    public List<BookingDetailEntity> getBookingDetailEntity() {
        return bookingDetailEntity;
    }

    public void setBookingDetailEntity(List<BookingDetailEntity> bookingDetailEntity) {
        this.bookingDetailEntity = bookingDetailEntity;
    }

    public AircraftEntity getAircraftEntity() {
        return aircraftEntity;
    }

    public void setAircraftEntity(AircraftEntity aircraftEntity) {
        this.aircraftEntity = aircraftEntity;
    }

    public List<AircraftSeatEntity> getAircraftSeatEntity() {
        return aircraftSeatEntity;
    }

    public void setAircraftSeatEntity(List<AircraftSeatEntity> aircraftSeatEntity) {
        this.aircraftSeatEntity = aircraftSeatEntity;
    }

    public String getTrip() {
        return trip;
    }

    public void setTrip(String trip) {
        this.trip = trip;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }
    
    
 }
