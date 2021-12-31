/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.spring_mvc_project_final.entities.AircraftEntity;
import com.mycompany.spring_mvc_project_final.entities.AircraftSeatEntity;
import com.mycompany.spring_mvc_project_final.entities.AirportEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightEntity;
import com.mycompany.spring_mvc_project_final.entities.PassengerEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.entities.SeatEntity;
import com.mycompany.spring_mvc_project_final.entities.SeatStatusEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.enums.SeatStatus;
import com.mycompany.spring_mvc_project_final.model.AircraftSeat;
import com.mycompany.spring_mvc_project_final.model.CreditCard;
import com.mycompany.spring_mvc_project_final.model.Passenger;
import com.mycompany.spring_mvc_project_final.model.PassengerSeat;
import com.mycompany.spring_mvc_project_final.model.PassengerServiceBooking;
import com.mycompany.spring_mvc_project_final.model.TransferPassenger;
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
import com.mycompany.spring_mvc_project_final.utils.ConverterUtils;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author ADMIN
 */
@Controller
public class BookingController {

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
    public String bookingDetail(Model model,
            @RequestParam("flightId") String flightId,
            @RequestParam("flightReturnId") String flightReturnId,
            HttpSession session) {

        session.setAttribute("flight", flightService.findFlightById(Integer.parseInt(flightId)));
        int passenger = (int) session.getAttribute("passenger");
        double price = flightService.findFlightById(Integer.parseInt(flightId)).getFlightRouteEntity().getStandardPrice();
        List<BookingDetailEntity> listBookingDetail = new ArrayList<>();
        List<BookingDetailEntity> listBookingDetailReturn = new ArrayList<>();
        BookingEntity booking = new BookingEntity();

        for (int i = 0; i < passenger; i++) {
            BookingDetailEntity bookingDetail = new BookingDetailEntity();
            bookingDetail.setFlightEntity(flightService.findFlightById(Integer.parseInt(flightId)));
            bookingDetail.setUnitPrice(price);
            SeatEntity seat = new SeatEntity();
            bookingDetail.setSeatEntity(seat);
            bookingDetail.setServiceLuggage(new String());
            PassengerEntity passengerEntity = new PassengerEntity();
            bookingDetail.setPassengerEntity(passengerEntity);
            bookingDetail.setBookingEntity(booking);
            listBookingDetail.add(bookingDetail);
        }

        if (Integer.parseInt(flightReturnId) > 0) {
            session.setAttribute("flightReturn", flightService.findFlightById(Integer.parseInt(flightReturnId)));
            double priceReturn = flightService.findFlightById(Integer.parseInt(flightReturnId)).getFlightRouteEntity().getStandardPrice();

            for (int i = 0; i < passenger; i++) {
                BookingDetailEntity bookingDetailReturn = new BookingDetailEntity();
                bookingDetailReturn.setBookingEntity(booking);
                bookingDetailReturn.setFlightEntity(flightService.findFlightById(Integer.parseInt(flightReturnId)));
                bookingDetailReturn.setUnitPrice(priceReturn);
                bookingDetailReturn.setPassengerEntity(new PassengerEntity());
                bookingDetailReturn.setSeatEntity(new SeatEntity());
                bookingDetailReturn.setServiceLuggage(new String());

                listBookingDetailReturn.add(bookingDetailReturn);
            }
            session.setAttribute("listBookingDetailReturn", listBookingDetailReturn);

        } else {
            session.removeAttribute("flightReturn");
            session.removeAttribute("listBookingDetailReturn");
        }

        List<ServiceBookingEntity> serviceBooking = new ArrayList<>();
        session.setAttribute("booking", booking);
        session.setAttribute("totalPriceSeat", 0);
        session.setAttribute("totalServicePrice", 0);
        session.setAttribute("numberOfVipSeat", 0);
        session.setAttribute("numberOfBusinessSeat", 0);
        session.setAttribute("numberOfStandardSeat", 0);
        session.setAttribute("listServiceBookingAll", serviceBooking);
        session.setAttribute("totalPrice", price * passenger);
        session.setAttribute("listBookingDetail", listBookingDetail);

        return "book1";
    }

    @RequestMapping("/passenger")
    public String passenger(Model model, HttpSession session) {
        return "passenger";
    }

    @RequestMapping(value = "/savePassengerInfo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String savePassengerInfo(@RequestBody String listPassengers, HttpSession session, Model model) throws JsonProcessingException, ParseException {
        ObjectMapper mapper = new ObjectMapper();
        List<Passenger> passengerInfors = Arrays.asList(mapper.readValue(listPassengers, Passenger[].class));

        List<PassengerEntity> listPassengerEntity = new ArrayList<>();
        List<BookingDetailEntity> listBookingDetail = (List<BookingDetailEntity>) session.getAttribute("listBookingDetail");
        List<BookingDetailEntity> listBookingDetailReturn = (List<BookingDetailEntity>) session.getAttribute("listBookingDetailReturn");

        for (Passenger p : passengerInfors) {

            listPassengerEntity.add(ConverterUtils.ConvertPassengerToPassengerEntity(p));
        }
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        int passenger = (int) session.getAttribute("passenger");
        for (int i = 0; i < passenger + 1; i++) {
            if (i == 0) {
                booking.setFullName(listPassengerEntity.get(0).getFullName());
                booking.setBirthday(listPassengerEntity.get(0).getBirthday());
                booking.setIdenCode(listPassengerEntity.get(0).getIdenCode());
                booking.setGender(listPassengerEntity.get(0).getGender());
                booking.setAddress(listPassengerEntity.get(0).getAddress());
                booking.setEmail(listPassengerEntity.get(0).getEmail());
                booking.setPhone(listPassengerEntity.get(0).getPhone());
            } else {
                listBookingDetail.get(i - 1).setPassengerEntity(listPassengerEntity.get(i));
                if (listBookingDetailReturn != null) {
                    listBookingDetailReturn.get(i - 1).setPassengerEntity(listPassengerEntity.get(i));
                }

            }

        }
        if (listBookingDetailReturn != null) {
            session.setAttribute("listBookingDetailReturn", listBookingDetailReturn);
        } else {

        }

        booking.setBookingDetailEntity(listBookingDetail);
        session.setAttribute("listBookingDetail", listBookingDetail);
        session.setAttribute("booking", booking);
        return null;
    }

    @RequestMapping("/selectSeat")
    public String selectSeat(Model model, HttpSession session) {
        FlightEntity flightSelect = (FlightEntity) session.getAttribute("flight");
        FlightEntity flightReturnSelect = (FlightEntity) session.getAttribute("flightReturn");

        List<AircraftSeatEntity> listAircraftSeatReturn = new ArrayList<>();
        if (flightReturnSelect != null) {
            listAircraftSeatReturn = aircraftSeatService.getListAircraftSeatEntityByFlightId(flightReturnSelect.getId());
        }
        List<AircraftSeatEntity> listAircraftSeatEntity = aircraftSeatService.getListAircraftSeatEntityByFlightId(flightSelect.getId());

        List<String> jsonString = new ArrayList<>();
        List<String> jsonFlightReturn = new ArrayList<>();

        ObjectMapper Obj = new ObjectMapper();

        for (AircraftSeatEntity aircraftSeatt : listAircraftSeatEntity) {
            AircraftSeat aicraftSeat = ConverterUtils.ConvertAircaftSeatEntityToAircraftSeat(aircraftSeatt);
            try {
                jsonString.add(Obj.writeValueAsString(aicraftSeat));
            } catch (JsonProcessingException ex) {
                Logger.getLogger(BookingController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (listAircraftSeatReturn.size() > 0) {
            for (AircraftSeatEntity aircraftSeatt : listAircraftSeatReturn) {
                AircraftSeat aicraftSeat = ConverterUtils.ConvertAircaftSeatEntityToAircraftSeat(aircraftSeatt);
                try {
                    jsonFlightReturn.add(Obj.writeValueAsString(aicraftSeat));
                } catch (JsonProcessingException ex) {
                    Logger.getLogger(BookingController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        List<ServiceEntity> listLuggage = serviceService.getLuggage();
        
        model.addAttribute("jsonAircraftSeatReturn", jsonFlightReturn);
        model.addAttribute("luggageServices", listLuggage);
        model.addAttribute("jsonAircraftSeat", jsonString);
        return "select-seat";
    }

    @RequestMapping(value = {"/saveSeat"}, method = RequestMethod.POST)
    public String saveSeataaa(Model model, HttpSession session, @RequestBody String listSeatOfPassenger) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        List<PassengerSeat> passengerSeat = Arrays.asList(mapper.readValue(listSeatOfPassenger, PassengerSeat[].class));

        List<BookingDetailEntity> listBookingDetail = (List<BookingDetailEntity>) session.getAttribute("listBookingDetail");
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        List<SeatStatusEntity> seatStatus = seatStatusService.getSeatStatuss();
        for (BookingDetailEntity b : listBookingDetail) {
            for (PassengerSeat seat : passengerSeat) {
                if (b.getPassengerEntity().getIdenCode().equals(seat.getIdenCode())
                        && b.getFlightEntity().getId() == seat.getFlightId()) {
                    if (b.getSeatEntity().getNumber() == null || b.getSeatEntity().getNumber().equals("")
                            || b.getSeatEntity().getNumber().isEmpty()) {
                        b.setSeatEntity(seatService.findSeatBySeatNumber(seat.getSeatNumber()));
                        b.setAircraftSeatId(seat.getSeatId());
                        AircraftSeatEntity aircraftSeat = aircraftSeatService.getAircraftSeatEntityById(seat.getSeatId());
                        b.setUnitPrice(b.getUnitPrice() + aircraftSeat.getSeatTypeEntity().getPrice());
                        aircraftSeat.setSeatStatusEntity(seatStatus.get(1));
                        aircraftSeatService.saveAircraftSeat(aircraftSeat);
                        break;

                    } else {
                        AircraftSeatEntity aircraftSeat = aircraftSeatService.getAircraftSeatEntityById(b.getAircraftSeatId());
                        aircraftSeat.setSeatStatusEntity(seatStatus.get(0));
                        aircraftSeatService.saveAircraftSeat(aircraftSeat);

                        b.setSeatEntity(seatService.findSeatBySeatNumber(seat.getSeatNumber()));
                        b.setAircraftSeatId(seat.getSeatId());
                        AircraftSeatEntity aircraftSeat2 = aircraftSeatService.getAircraftSeatEntityById(seat.getSeatId());
                        b.setUnitPrice(b.getUnitPrice() + aircraftSeat2.getSeatTypeEntity().getPrice() - aircraftSeat.getSeatTypeEntity().getPrice());
                        aircraftSeat2.setSeatStatusEntity(seatStatus.get(1));
                        aircraftSeatService.saveAircraftSeat(aircraftSeat2);

                        break;
                    }

                }
            }

        }
        double totalPriceSeat = 0;
        int numberOfVipSeat = 0;
        int numberOfBusinessSeat = 0;
        int numberOfStandardSeat = 0;
        for (PassengerSeat p : passengerSeat) {
            totalPriceSeat += aircraftSeatService.getAircraftSeatEntityById(p.getSeatId()).getSeatTypeEntity().getPrice();
            if (aircraftSeatService.getAircraftSeatEntityById(p.getSeatId()).getSeatTypeEntity().getSeatType().toString().equals("FIRST_CLASS")) {
                numberOfVipSeat += 1;
            }
            if (aircraftSeatService.getAircraftSeatEntityById(p.getSeatId()).getSeatTypeEntity().getSeatType().toString().equals("BUSINESS")) {
                numberOfBusinessSeat += 1;
            }
            if (aircraftSeatService.getAircraftSeatEntityById(p.getSeatId()).getSeatTypeEntity().getSeatType().toString().equals("ECONOMY")) {
                numberOfStandardSeat += 1;
            }
        }
        double totalPrice = 0;
        for (BookingDetailEntity b : listBookingDetail) {
            totalPrice += b.getUnitPrice();
        }
        double totalServicePrice = 0;
        totalPrice += totalServicePrice;
        booking.setBookingDetailEntity(listBookingDetail);
        session.setAttribute("booking", booking);
        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("listBookingDetail", listBookingDetail);
        session.setAttribute("totalPriceSeat", totalPriceSeat);
        session.setAttribute("numberOfVipSeat", numberOfVipSeat);
        session.setAttribute("numberOfBusinessSeat", numberOfBusinessSeat);
        session.setAttribute("numberOfStandardSeat", numberOfStandardSeat);
        return "demo-ajax";
    }

    @RequestMapping(value = {"/saveService"}, method = RequestMethod.POST)
    public String saveService(Model model, @RequestBody String listLuggagePass, HttpSession session) throws JsonProcessingException {
        ObjectMapper Obj = new ObjectMapper();
        List<PassengerServiceBooking> passengerServiceBooking = Arrays.asList(Obj.readValue(listLuggagePass, PassengerServiceBooking[].class));
        List<BookingDetailEntity> listBookingDetail = (List<BookingDetailEntity>) session.getAttribute("listBookingDetail");
        double totalServicePrice = 0;
        List<ServiceBookingEntity> listServiceBookingAll = new ArrayList<>();
        for (BookingDetailEntity bookingDetail : listBookingDetail) {

            for (PassengerServiceBooking p : passengerServiceBooking) {
                if (bookingDetail.getPassengerEntity().getIdenCode().equals(p.getIdenCode())) {
                    List<ServiceBookingEntity> listServiceBooking = new ArrayList<>();
                    ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
                    serviceBooking.setServiceEntity(serviceService.getServiceById(p.getServiceId()));
                    serviceBooking.setBookingDetailEntity(bookingDetail);
                    serviceBooking.setPrice(serviceService.getServiceById(p.getServiceId()).getPrice());
                    serviceBooking.setQuantity(1);

                    listServiceBooking.add(serviceBooking);
                    listServiceBookingAll.add(serviceBooking);

                    bookingDetail.setServiceLuggage(p.getServiceLuggage());
                    bookingDetail.setServiceBookingEntity(listServiceBooking);
                    totalServicePrice += serviceBooking.getPrice();
                    break;

                }

            }
        }
        double totalPrice = 0;
        for (BookingDetailEntity b : listBookingDetail) {
            totalPrice += b.getUnitPrice();
        }
        totalPrice += totalServicePrice;
        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("listServiceBookingAll", listServiceBookingAll);
        session.setAttribute("totalServicePrice", totalServicePrice);
        model.addAttribute("service", passengerServiceBooking);
        return "demo-ajax";
    }

    @RequestMapping("/payment")
    public String aaa(Model model) {
        return "payment";
    }

    @RequestMapping(value = {"/checkPayment"}, method = RequestMethod.POST)
    public String checkPayment(Model model, @RequestBody String creditCard,
            HttpSession session) throws JsonProcessingException, MessagingException {
        ObjectMapper obj = new ObjectMapper();
        CreditCard credit = obj.readValue(creditCard, CreditCard.class);
        List<BookingDetailEntity> listBookingDetail = (List<BookingDetailEntity>) session.getAttribute("listBookingDetail");
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        PaymentEntity paymentEntity = new PaymentEntity();
        double totalPrice = (double) session.getAttribute("totalPrice");
        FlightEntity flight = (FlightEntity) session.getAttribute("flight");
        List<ServiceBookingEntity> listServiceBooking = (List<ServiceBookingEntity>) session.getAttribute("listServiceBookingAll");
        List<CreditCardEntity> creditCards = creditCardService.getCreditCards();
        List<SeatStatusEntity> seatStatus = seatStatusService.getSeatStatuss();
        CreditCardEntity creditCard2 = new CreditCardEntity();
        for (CreditCardEntity card : creditCards) {
            if (card.getCardNumber().equals(credit.getNumber()) && card.getFullName().equals(credit.getName())) {
                creditCard2 = card;
                break;
            } else {
                creditCard2 = null;
            }
        }
        if (creditCard2 == null) {
            model.addAttribute("error", "AccountError");
            return "payment-ajax";
        } else {
            if (creditCard2.getBalance() < totalPrice) {
                model.addAttribute("error", "BalanceError");
                return "payment-ajax";
            } else {
                creditCard2.setBalance(creditCard2.getBalance() - totalPrice);
                creditCardService.saveCreditCard(creditCard2);

                booking.setBookingDate(new Date());
                booking.setBookingStatus(BookingStatus.BOOKED);

                paymentEntity.setAmount(totalPrice);
                paymentEntity.setBookingEntity(booking);
                paymentEntity.setCreditCardEntity(creditCard2);
                paymentEntity.setDescription("Booking success");
                paymentEntity.setPaymentDate(new Date());

                for (BookingDetailEntity bookingDetail : listBookingDetail) {
                    AircraftSeatEntity aircraftSeat = aircraftSeatService.getAircraftSeatEntityById(bookingDetail.getAircraftSeatId());
                    aircraftSeat.setSeatStatusEntity(seatStatus.get(2));
                    aircraftSeatService.saveAircraftSeat(aircraftSeat);
                    bookingDetail.setBookingEntity(booking);
                    passengerService.savePassenger(bookingDetail.getPassengerEntity());
                    sendHtmlMail(bookingDetail.getPassengerEntity().getEmail(), "DANG NGUYEN AIR - successful ticket booking", bookingDetail, booking, totalPrice, flight);
                }
                bookingService.saveBooking(booking);
                paymentService.savePayment(paymentEntity);
                for (ServiceBookingEntity serviceBooking : listServiceBooking) {
                    serviceBookingService.saveServiceBooking(serviceBooking);
                }
                model.addAttribute("Susscess", "Success");
                return "payment-ajax";
            }
        }
//        Calendar calendar = Calendar.getInstance();
//        calendar.setTime(creditCards.get(0).getExpDate());
//        Date date = creditCards.get(0).getExpDate();
//
//        model.addAttribute("date", creditCard2);
////        model.addAttribute("credit", credit);
//        return "payment-ajax";
    }

    @RequestMapping("/bookinginfo")
    public String showBookingInfo(Model model) {
        return "booking-info";
    }

    public void sendEmail(String to, String subject, String text) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setSubject(subject);
        mailMessage.setTo(to);
        mailMessage.setText(text);
        mailSender.send(mailMessage);
    }

    public void sendHtmlMail(String to, String subject, BookingDetailEntity bookingDetail, BookingEntity booking, double totalPrice, FlightEntity flight) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        String htmlMsg = "<div style=\"margin: 8px 8px;font-size: 22px;font-weight: 600;color: #000;\">Booking information</div>\n"
                + "        <table style=\"border-collapse: collapse;border:1px solid black;\">\n"
                + "            <tr style=\"border:1px solid black;font-size: 18px;\n"
                + "                font-weight: 600;background:linear-gradient(90deg,#e60000,#ff944d);color: #e6b800\">\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Booking date</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black \">The representative</td>\n"
                + "                <td style=\"padding: 8px 20px; border:1px solid black\">Phone</td>\n"
                + "                <td style=\"padding: 8px 20px; border:1px solid black\">Email</td>\n"
                + "                <td style=\"padding: 8px 20px; border:1px solid black\">Total price</td>\n"
                + "            </tr>\n"
                + "            <tr style=\"border:1px solid black;font-size: 18px;font-weight: 600\">                            \n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + format.format(booking.getBookingDate()) + "</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + booking.getFullName() + "</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + booking.getPhone() + "</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + booking.getEmail() + "</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + totalPrice + " VND</td>\n"
                + "            </tr>\n"
                + "        </table>\n"
                + "\n"
                + "        <div style=\"margin: 8px 8px;font-size: 22px;font-weight: 600;color: #000;\"> Passenger Information </div>\n"
                + "        <table style=\"border-collapse: collapse;border:1px solid black;\">\n"
                + "            <tr style=\"border:1px solid black;font-size: 18px;\n"
                + "                font-weight: 600;background:linear-gradient(90deg,#e60000,#ff944d);color: #e6b800\">\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Name</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Email</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Phone number</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Seat</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Luggage</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Flight</td>\n"
                + "            </tr>\n"
                + "\n"
                + "                <tr style=\"border:1px solid black;font-size: 18px;font-weight: 600\">\n"
                + "                    <td style=\"padding: 8px 20px;border:1px solid black\">" + bookingDetail.getPassengerEntity().getFullName() + "</td>\n"
                + "                    <td style=\"padding: 8px 20px;border:1px solid black\">" + bookingDetail.getPassengerEntity().getEmail() + "</td>\n"
                + "                    <td style=\"padding: 8px 20px;border:1px solid black\">" + bookingDetail.getPassengerEntity().getPhone() + "</td>                    \n"
                + "                    <td style=\"padding: 8px 20px;border:1px solid black\">" + bookingDetail.getSeatEntity().getNumber() + "</td>                    \n"
                + "                    <td style=\"padding: 8px 20px;border:1px solid black\">" + bookingDetail.getServiceBookingEntity().get(0).getServiceEntity().getDescription() + "</td>\n"
                + "                    <td style=\"padding: 8px 20px;border:1px solid black\">VJ" + bookingDetail.getFlightEntity().getId() + " </td>\n"
                + "                </tr>\n"
                + "        </table>\n"
                + "        <div style=\"margin: 8px 8px;font-size: 22px;font-weight: 600;color: #000;\">Flight Information</div>\n"
                + "        <table style=\"border-collapse: collapse;border:1px solid black;\">\n"
                + "            <tr style=\"border:1px solid black;font-size: 18px;\n"
                + "                font-weight: 600;background:linear-gradient(90deg,#e60000,#ff944d);color: #e6b800\">\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Flight </td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Date</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Departure</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Destination</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Depart time</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black; \">Arrival time</td>\n"
                + "            </tr>\n"
                + "            <tr style=\"border:1px solid black;font-size: 18px;font-weight: 600\">\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">VJ" + flight.getId() + "</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + flight.getDepartDate() + "</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + flight.getFlightRouteEntity().getDeparture().getName() + "</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + flight.getFlightRouteEntity().getDestination().getName() + "</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + flight.getDepartTime() + "</td>\n"
                + "                <td style=\"padding: 8px 20px;border:1px solid black\">" + flight.getArrivalTime() + "</td>\n"
                + "            </tr>\n"
                + "        </table>";
        message.setContent(htmlMsg, "text/html");
        helper.setTo(to);
        helper.setSubject(subject);
        mailSender.send(message);
    }

    @RequestMapping("/mail")
    public String mail(Model model) {
        return "mail";
    }

    @RequestMapping("/finish")
    public String finish(Model model, HttpSession session) {
        session.removeAttribute("booking");
        session.removeAttribute("totalPriceSeat");
        session.removeAttribute("totalServicePrice");
        session.removeAttribute("numberOfVipSeat");
        session.removeAttribute("numberOfBusinessSeat");
        session.removeAttribute("numberOfStandardSeat");
        session.removeAttribute("listServiceBookingAll");
        session.removeAttribute("totalPrice");
        session.removeAttribute("listBookingDetail");
        session.removeAttribute("passenger");
        session.removeAttribute("departure1");
        session.removeAttribute("destination");
        session.removeAttribute("seatType");
        session.removeAttribute("trip");
        session.removeAttribute("flight");
        return "redirect:/home";
    }
}
