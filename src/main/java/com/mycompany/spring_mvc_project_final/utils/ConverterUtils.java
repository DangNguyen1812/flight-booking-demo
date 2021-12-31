/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightRouteEntity;
import com.mycompany.spring_mvc_project_final.entities.PassengerEntity;
import com.mycompany.spring_mvc_project_final.enums.Gender;
import com.mycompany.spring_mvc_project_final.model.Aircraft;
import com.mycompany.spring_mvc_project_final.model.AircraftSeat;
import com.mycompany.spring_mvc_project_final.model.Airport;
import com.mycompany.spring_mvc_project_final.model.City;
import com.mycompany.spring_mvc_project_final.model.FlightRoute;
import com.mycompany.spring_mvc_project_final.model.Passenger;
import com.mycompany.spring_mvc_project_final.model.Seat;
import com.mycompany.spring_mvc_project_final.model.SeatStatusModel;
import com.mycompany.spring_mvc_project_final.model.SeatTypeModel;

/**
 *
 * @author ADMIN
 */
public class ConverterUtils {

    public static PassengerEntity ConvertPassengerToPassengerEntity(Passenger passenger) {
        PassengerEntity passengerEntity = new PassengerEntity();
        passengerEntity.setFullName(passenger.getFullName());
        passengerEntity.setBirthday(passenger.getBirthday());
        passengerEntity.setAddress(passenger.getAddress());
        passengerEntity.setGender(Gender.valueOf(passenger.getGender().toUpperCase()));
        passengerEntity.setEmail(passenger.getEmail());
        passengerEntity.setPhone(passenger.getPhone());
        passengerEntity.setIdenCode(passenger.getIdenCode());
        return passengerEntity;
    }

    public static String getCharForNumber(int i) {
        char[] alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
        if (i > 25) {
            return null;
        }
        return Character.toString(alphabet[i]);
    }
    
    public static AircraftSeat ConvertAircaftSeatEntityToAircraftSeat(AircraftSeatEntity aircraftSeatEntity) {
        AircraftSeat aircraftSeat = new AircraftSeat();
        aircraftSeat.setId(aircraftSeatEntity.getId());
        
        
        Aircraft aicraft = new Aircraft();
        aicraft.setId(aircraftSeatEntity.getAircraftEntity().getId());
        aicraft.setName(aircraftSeatEntity.getAircraftEntity().getName());
        aicraft.setNumber(aircraftSeatEntity.getAircraftEntity().getNumber());
        aicraft.setColNumber(aircraftSeatEntity.getAircraftEntity().getColNumber());
        aicraft.setRowNumber(aircraftSeatEntity.getAircraftEntity().getRowNumber());
        
        Seat seat = new Seat();
        seat.setId(aircraftSeatEntity.getSeatEntity().getId());
        seat.setNumber(aircraftSeatEntity.getSeatEntity().getNumber());
        
        SeatStatusModel seatStatus = new SeatStatusModel();
        seatStatus.setId(aircraftSeatEntity.getSeatStatusEntity().getId());
        seatStatus.setSeatStatus(aircraftSeatEntity.getSeatStatusEntity().getSeatStatus());
        
        SeatTypeModel seatType = new SeatTypeModel();
        seatType.setId(aircraftSeatEntity.getSeatTypeEntity().getId());
        seatType.setSeatType(aircraftSeatEntity.getSeatTypeEntity().getSeatType());
        seatType.setPrice(aircraftSeatEntity.getSeatTypeEntity().getPrice());
        
        aircraftSeat.setSeat(seat);
        aircraftSeat.setSeatStatus(seatStatus);
        aircraftSeat.setSeatType(seatType);
        aircraftSeat.setAircraft(aicraft);
        
        return aircraftSeat;
    }
}
