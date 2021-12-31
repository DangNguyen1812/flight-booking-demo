/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "booking")
public class BookingEntity extends Personal implements Serializable{
    
    @Column()
    @Temporal(TemporalType.DATE)
    private Date bookingDate;
    
    @Transient
    private String idenCode;
    
    
    @Column()
    private String bookingNumber;
    
    @Column()
    @Enumerated(EnumType.STRING)
    private BookingStatus bookingStatus;
    
    @OneToMany(mappedBy = "bookingEntity",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<BookingDetailEntity> bookingDetailEntity;
    
    @OneToMany(mappedBy = "bookingEntity",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<PaymentEntity> paymentEntity;

    public BookingEntity() {
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingNumber() {
        return bookingNumber;
    }

    public void setBookingNumber(String bookingNumber) {
        this.bookingNumber = bookingNumber;
    }

    public BookingStatus getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(BookingStatus bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public List<BookingDetailEntity> getBookingDetailEntity() {
        return bookingDetailEntity;
    }

    public void setBookingDetailEntity(List<BookingDetailEntity> bookingDetailEntity) {
        this.bookingDetailEntity = bookingDetailEntity;
    }

    public List<PaymentEntity> getPaymentEntity() {
        return paymentEntity;
    }

    public void setPaymentEntity(List<PaymentEntity> paymentEntity) {
        this.paymentEntity = paymentEntity;
    }

    public String getIdenCode() {
        return idenCode;
    }

    public void setIdenCode(String idenCode) {
        this.idenCode = idenCode;
    }
    
    
    
}
