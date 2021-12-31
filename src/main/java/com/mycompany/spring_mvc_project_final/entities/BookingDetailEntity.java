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
import javax.persistence.Transient;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "booking_detail")
public class BookingDetailEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column()
    private double unitPrice;
    
    @Column()
    private int discount;
    
    @OneToMany(mappedBy = "bookingDetailEntity",fetch =  FetchType.LAZY)
    private List<ServiceBookingEntity> serviceBookingEntity;
    
    @ManyToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity bookingEntity;
    
    @ManyToOne
    @JoinColumn(name = "ticket_id")
    private TicketTypeEntity ticketTypeEntity;
    
    @ManyToOne
    @JoinColumn(name = "passenger_id")
    private PassengerEntity passengerEntity;
    
    @ManyToOne
    @JoinColumn(name = "seat_id")
    private SeatEntity seatEntity;
    
    @ManyToOne
    @JoinColumn(name = "flight_id")
    private FlightEntity flightEntity;
    
    @Transient
    private int aircraftSeatId;
    
    @Transient
    private String serviceLuggage;
    

    public BookingDetailEntity() {
        
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public List<ServiceBookingEntity> getServiceBookingEntity() {
        return serviceBookingEntity;
    }

    public void setServiceBookingEntity(List<ServiceBookingEntity> serviceBookingEntity) {
        this.serviceBookingEntity = serviceBookingEntity;
    }

    public BookingEntity getBookingEntity() {
        return bookingEntity;
    }

    public void setBookingEntity(BookingEntity bookingEntity) {
        this.bookingEntity = bookingEntity;
    }

    public TicketTypeEntity getTicketTypeEntity() {
        return ticketTypeEntity;
    }

    public void setTicketTypeEntity(TicketTypeEntity ticketTypeEntity) {
        this.ticketTypeEntity = ticketTypeEntity;
    }

    public PassengerEntity getPassengerEntity() {
        return passengerEntity;
    }

    public void setPassengerEntity(PassengerEntity passengerEntity) {
        this.passengerEntity = passengerEntity;
    }

    public SeatEntity getSeatEntity() {
        return seatEntity;
    }

    public void setSeatEntity(SeatEntity seatEntity) {
        this.seatEntity = seatEntity;
    }

    public FlightEntity getFlightEntity() {
        return flightEntity;
    }

    public void setFlightEntity(FlightEntity flightEntity) {
        this.flightEntity = flightEntity;
    }

    public int getAircraftSeatId() {
        return aircraftSeatId;
    }

    public void setAircraftSeatId(int aircraftSeatId) {
        this.aircraftSeatId = aircraftSeatId;
    }

    public String getServiceLuggage() {
        return serviceLuggage;
    }

    public void setServiceLuggage(String serviceLuggage) {
        this.serviceLuggage = serviceLuggage;
    }


    
    
    
}
