/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.PassengerEntity;
import com.mycompany.spring_mvc_project_final.entities.SeatEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatService;
import com.mycompany.spring_mvc_project_final.service.AirportService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.CreditCardService;
import com.mycompany.spring_mvc_project_final.service.FlightService;
import com.mycompany.spring_mvc_project_final.service.PassengerService;
import com.mycompany.spring_mvc_project_final.service.PaymentService;
import com.mycompany.spring_mvc_project_final.service.SeatService;
import com.mycompany.spring_mvc_project_final.service.SeatStatusService;
import com.mycompany.spring_mvc_project_final.service.SeatTypeService;
import com.mycompany.spring_mvc_project_final.service.ServiceBookingService;
import com.mycompany.spring_mvc_project_final.service.ServiceService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ADMIN
 */
@Controller
public class BookingRoundController {

    @Autowired
    private FlightService flightService;

    @Autowired
    private SeatTypeService seatTypeService;

    @Autowired
    private AirportService airportService;

    @Autowired
    private PassengerService passengerService;

    @Autowired
    private AircraftSeatService aircraftSeatService;

    @Autowired
    private SeatService seatService;

    @Autowired
    private CreditCardService creditCardService;

    @Autowired
    private SeatStatusService seatStatusService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private ServiceBookingService serviceBookingService;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping("/bookingDetail")
    public String bookingDetailRoundTrip(Model model,
            @RequestParam("flightGoId") String flightGoId,
            @RequestParam("flightReturnId") String flightReturnId,
            HttpSession session) {
        session.setAttribute("flight", flightService.findFlightById(Integer.parseInt(flightGoId)));
        session.setAttribute("flightReturn", flightService.findFlightById(Integer.parseInt(flightReturnId)));

        int passenger = (int) session.getAttribute("passenger");
        double price = flightService.findFlightById(Integer.parseInt(flightGoId)).getFlightRouteEntity().getStandardPrice();
        double priceReturn = flightService.findFlightById(Integer.parseInt(flightReturnId)).getFlightRouteEntity().getStandardPrice();

        BookingEntity booking = new BookingEntity();
        List<BookingDetailEntity> listBookingDetail = new ArrayList<>();
        List<BookingDetailEntity> listBookingDetailReturn = new ArrayList<>();
        for (int i = 0; i < passenger; i++) {
            BookingDetailEntity bookingDetailGo = new BookingDetailEntity();
            bookingDetailGo.setBookingEntity(booking);
            bookingDetailGo.setFlightEntity(flightService.findFlightById(Integer.parseInt(flightGoId)));
            bookingDetailGo.setUnitPrice(price);
            bookingDetailGo.setPassengerEntity(new PassengerEntity());
            bookingDetailGo.setSeatEntity(new SeatEntity());
            bookingDetailGo.setServiceLuggage(new String());

            BookingDetailEntity bookingDetailReturn = new BookingDetailEntity();
            bookingDetailReturn.setBookingEntity(booking);
            bookingDetailReturn.setFlightEntity(flightService.findFlightById(Integer.parseInt(flightReturnId)));
            bookingDetailReturn.setUnitPrice(priceReturn);
            bookingDetailReturn.setPassengerEntity(new PassengerEntity());
            bookingDetailReturn.setSeatEntity(new SeatEntity());
            bookingDetailReturn.setServiceLuggage(new String());

            listBookingDetail.add(bookingDetailGo);
            listBookingDetailReturn.add(bookingDetailReturn);
        }

        List<ServiceBookingEntity> serviceBooking = new ArrayList<>();
        session.setAttribute("booking", booking);
        session.setAttribute("totalPriceSeat", 0);
        session.setAttribute("totalServicePrice", 0);
        session.setAttribute("numberOfVipSeat", 0);
        session.setAttribute("numberOfBusinessSeat", 0);
        session.setAttribute("numberOfStandardSeat", 0);
        session.setAttribute("listServiceBookingAll", serviceBooking);
        session.setAttribute("totalPrice", price * passenger + priceReturn*passenger);
        session.setAttribute("listBookingDetail", listBookingDetail);
        session.setAttribute("listBookingDetailReturn", listBookingDetailReturn);

        return "demo-round";
    }
}
