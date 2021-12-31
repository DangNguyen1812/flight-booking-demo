
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="trip-info">
    <c:if test="${trip == 'one-way'}">
        <div class="trip-info__passenger">One way trip |<span class="passenger-amount"> ${passenger} Passenger</span></div>
    </c:if>
    <c:if test="${trip == 'round'}">
        <div class="trip-info__passenger">Round trip |<span class="passenger-amount"> ${passenger} Passenger</span></div>
    </c:if>

    <div class="trip-infor__from-to">
        Departure :<span class="airport-info"> ${departure.cityEntity.name} (${departure.name})</span> ----> 
        Destination :<span class="airport-info"> ${destination.cityEntity.name} (${destination.name})</span>
    </div>
</div>