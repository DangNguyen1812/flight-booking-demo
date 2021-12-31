/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AircraftEntity;
import com.mycompany.spring_mvc_project_final.entities.AircraftSeatEntity;
import com.mycompany.spring_mvc_project_final.entities.AirportEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightRouteEntity;
import com.mycompany.spring_mvc_project_final.entities.SeatEntity;
import com.mycompany.spring_mvc_project_final.entities.SeatStatusEntity;
import com.mycompany.spring_mvc_project_final.entities.SeatTypeEntity;
import com.mycompany.spring_mvc_project_final.model.FlightRoute;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatService;
import com.mycompany.spring_mvc_project_final.service.AircraftService;
import com.mycompany.spring_mvc_project_final.service.AirlineService;
import com.mycompany.spring_mvc_project_final.service.AirportService;
import com.mycompany.spring_mvc_project_final.service.CityService;
import com.mycompany.spring_mvc_project_final.service.FlightRouteService;
import com.mycompany.spring_mvc_project_final.service.FlightService;
import com.mycompany.spring_mvc_project_final.service.SeatService;
import com.mycompany.spring_mvc_project_final.service.SeatStatusService;
import com.mycompany.spring_mvc_project_final.service.SeatTypeService;
import com.mycompany.spring_mvc_project_final.utils.ConverterUtils;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private CityService cityService;
    @Autowired
    private FlightService flightService;

    @Autowired
    private AirportService airportService;

    @Autowired
    private FlightRouteService flightRouteService;

    @Autowired
    private SeatTypeService seatTypeService;

    @Autowired
    private AirlineService airlineService;

    @Autowired
    private AircraftService aircraftService;

    @Autowired
    private SeatService seatService;
    
    @Autowired
    private SeatStatusService seatStatusService;
    
    @Autowired
    private AircraftSeatService aircraftSeatService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {

        model.addAttribute("flight", new FlightEntity());

//        List<String> roles = SecurityUtils.getRolesOfUser();
//        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_ADMIN")
//                || roles.contains("ROLE_SELLER") || roles.contains("ROLE_MANAGER"))) {
//            return "redirect:/admin/home";
//        }
        List<FlightRouteEntity> flightRouteEntitys = flightRouteService.getFlighRoutes();
        List<FlightRoute> flightRoutes = new ArrayList<>();
        if (flightRouteEntitys != null && flightRouteEntitys.size() > 0) {

            for (FlightRouteEntity flightRouteEntity : flightRouteEntitys) {
                flightRoutes.add(SecurityUtils.convertFlightRouteFromFlightRouteEntity(flightRouteEntity));
            }

        }
        model.addAttribute("airports", airportService.getListAirport());
//        model.addAttribute("flightRoutes", flightRoutes);
        return "home1";
    }

    @RequestMapping("/login")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!!!");
        }
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }

    @RequestMapping("/about")
    public String about(Model model) {
        return "home1";
    }

    @RequestMapping("/offer")
    public String offer(Model model) {
        return "offers";
    }

    @RequestMapping("/service")
    public String service(Model model) {
        return "contact";
    }

    @RequestMapping("/book1")
    public String book1(Model model) {
        return "book1";
    }

    @RequestMapping("/book2")
    public String book2(Model model) {
        return "book2";
    }

    @RequestMapping("/safety")
    public String safety(Model model) {
        return "safety";
    }

    @RequestMapping("/contact")
    public String contact(Model model) {
        return "contact";
    }

    @RequestMapping("/demofetch")
    public String demoFetch(Model model) {
        return "demofetch";
    }

    @RequestMapping("/add-Flight")
    public String selectFlight(Model model) {
        AircraftEntity aircraft = aircraftService.getAircrafts().get(2);
        int numberSeatOfAircraft = aircraft.getNumber();
//        List<String> numberofSeat = new ArrayList<>();
//        for (int i = 1; i <= aircraft.getRowNumber(); i++) {
//            for (int j = 0; j < aircraft.getColNumber(); j++) {
//                String number = i + ConverterUtils.getCharForNumber(j);
//                numberofSeat.add(number);
//                SeatEntity seatEntity = new SeatEntity();
//                seatEntity.setNumber(number);
//                seatService.saveSeat(seatEntity);
//                
//            }
//        }
        List<AircraftSeatEntity> listAircraftSeats = new ArrayList<>();
        List<SeatEntity> listSeats = seatService.getSeats();
        List<SeatTypeEntity> listSeatType = seatTypeService.getSeatTypes();
        List<SeatStatusEntity> listSeatStatus = seatStatusService.getSeatStatuss();
        for (int i = 0;i<numberSeatOfAircraft;i++) {
            AircraftSeatEntity aircraftSeatEntity = new AircraftSeatEntity();
            aircraftSeatEntity.setAircraftEntity(aircraft);
            aircraftSeatEntity.setSeatEntity(listSeats.get(i));
            aircraftSeatEntity.setSeatStatusEntity(listSeatStatus.get(0));
            aircraftSeatEntity.setFlightEntity(flightService.findFlightById(37));
            
            if(i < 30) {
                aircraftSeatEntity.setSeatTypeEntity(listSeatType.get(0));
            }else if (i < 90) {
                aircraftSeatEntity.setSeatTypeEntity(listSeatType.get(1));
            }else {
                aircraftSeatEntity.setSeatTypeEntity(listSeatType.get(2));
            }
//            aircraftSeatService.saveAircraftSeat(aircraftSeatEntity);
            listAircraftSeats.add(aircraftSeatEntity);
        }
//         List<AircraftSeatEntity> listAircraftSeats = aircraftSeatService.getListAircraftSeatEntityByFlightId(18);
//        model.addAttribute("listAircraftSeats", listAircraftSeats);

        return "demo-add-flight";
    }

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String addAirport(Model model, @ModelAttribute("addAirport") AirportEntity airportEntity) {
        airportService.saveAirport(airportEntity);
        return "home";
    }

    @RequestMapping(value = "/searchFlight", method = RequestMethod.POST)
    private String viewFlight(Model model, @ModelAttribute("flight") FlightEntity flight,
            @ModelAttribute("passenger") int passenger,
            @ModelAttribute("flightRouteEntity.departure.id") String departure,
            @ModelAttribute("flightRouteEntity.destination.id") String destination,
            @ModelAttribute("trip") String trip,
            HttpSession session
    ) {

        List<FlightEntity> flights
                = flightService.seachFlight(flight.getFlightRouteEntity().getDeparture().getId(),
                        flight.getFlightRouteEntity().getDestination().getId(),
                        flight.getDepartDate());
        session.setAttribute("passenger", passenger);
        session.setAttribute("departure", airportService.getAirport(Integer.parseInt(departure)));
        session.setAttribute("destination", airportService.getAirport(Integer.parseInt(destination)));
        session.setAttribute("seatType", seatTypeService.getSeatTypes());
        session.setAttribute("trip", trip);
        if (flight.getTrip().equals("one-way")) {

            if (flights.size() > 0) {

                model.addAttribute("flights", flights);
                return "book2";
            } else {
                model.addAttribute("message", "there's no flight like request");
                return "book2";
            }

        } else if (flight.getTrip().equals("round")) {
            List<FlightEntity> returnFlights
                    = flightService.seachFlight(flight.getFlightRouteEntity().getDestination().getId(),
                            flight.getFlightRouteEntity().getDeparture().getId(),
                            flight.getReturnDate());
            if (flights.size() > 0 && returnFlights.size() > 0) {
                model.addAttribute("flights", flights);
                model.addAttribute("returnFlights", returnFlights);
                return "book2";
            } else {
                model.addAttribute("message", "there's no flight like request");
                return "book2";
            }
        }

        return "book2";

    }

}
