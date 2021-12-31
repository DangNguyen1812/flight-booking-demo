/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.FlightRouteEntity;
import com.mycompany.spring_mvc_project_final.enums.Role;
import com.mycompany.spring_mvc_project_final.model.Airport;
import com.mycompany.spring_mvc_project_final.model.City;
import com.mycompany.spring_mvc_project_final.model.FlightRoute;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author ldanh
 */
public class SecurityUtils {

    public static List<String> getRolesOfUser() {
        List<String> roles = new ArrayList<>();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) principal;
                Collection<GrantedAuthority> authoritys = (Collection<GrantedAuthority>) userDetails.getAuthorities();
                if (!CollectionUtils.isEmpty(authoritys)) {
                    for (GrantedAuthority authority : authoritys) {
                        roles.add(authority.getAuthority());
                    }
                }
            }
        }
        return roles;
    }
    public static FlightRoute convertFlightRouteFromFlightRouteEntity(FlightRouteEntity flightRoutEntity) {
        FlightRoute flightRoute = new FlightRoute();
        flightRoute.setId(flightRoutEntity.getId());
        flightRoute.setDuration(flightRoutEntity.getDuration());
        flightRoute.setDistance(flightRoutEntity.getDistance());
        flightRoute.setStandardPrice(flightRoutEntity.getStandardPrice());
        
        
        Airport departure = new Airport();
        departure.setId(flightRoutEntity.getDeparture().getId());
        departure.setName(flightRoutEntity.getDeparture().getName());
        
        
        City city1 = new City();
        city1.setId(flightRoutEntity.getDeparture().getCityEntity().getId());
        city1.setName(flightRoutEntity.getDeparture().getCityEntity().getName());
        
        Airport destination = new Airport();
        destination.setId(flightRoutEntity.getDestination().getId());
        destination.setName(flightRoutEntity.getDestination().getName());
        
        
        City city2 = new City();
        city2.setId(flightRoutEntity.getDestination().getCityEntity().getId());
        city2.setName(flightRoutEntity.getDestination().getCityEntity().getName());
        
        departure.setCity(city1);
        destination.setCity(city2);
        flightRoute.setDeparture(departure);
        flightRoute.setDestination(destination);
        
        
        return flightRoute;
    }
}
