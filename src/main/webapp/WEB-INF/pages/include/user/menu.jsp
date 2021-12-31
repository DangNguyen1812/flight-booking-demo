<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="wrapper">
        <h1><a href="index.html" id="logo">AirLines</a></h1>
        <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
        <nav id="top_nav">
            <ul>
                <li><a href="index.html" class="nav1">Home</a></li>
                <li><a href="#" class="nav2">Sitemap</a></li>
                <li><a href="contacts.html" class="nav3">Contact</a></li>
            </ul>
        </nav>
    </div>
    <nav>
        <ul id="menu">
            <li id="menu_active"><a href="<c:url value="/home"/>"><span><span>Home</span></span></a></li>
            <li><a href="<c:url value="/offer"/>"><span><span>Offers</span></span></a></li>
            <li><a href="<c:url value="/book1"/>"><span><span>Book</span></span></a></li>
            <li><a href="<c:url value="/service"/>"><span><span>Services</span></span></a></li>
            <li><a href="<c:url value="/safety"/>"><span><span>Safety</span></span></a></li>
            <li class="end"><a href="<c:url value="/contact"/>"><span><span>Contacts</span></span></a></li>
        </ul>
    </nav>
</header>