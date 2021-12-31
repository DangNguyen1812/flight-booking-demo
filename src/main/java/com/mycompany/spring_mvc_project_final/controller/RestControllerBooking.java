/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.model.TransferPassenger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ADMIN
 */
@RestController
@RequestMapping("/restBooking")
public class RestControllerBooking {
    
    @RequestMapping(value = "/savePassengerInfo",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String savePassengerInfo(Model model, @RequestBody String listPassenger) {
        return "dang";
    }
}
