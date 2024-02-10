<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%@ page import = "java.util.List" %>
 <%@ page import = "com.example.demo.models.Flight" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Capital Search Home Page</title>
</head>
<body>
<h1>Search Results</h1>


<%
    List<Flight> flightList = (List<Flight>) request.getAttribute("cityFlightList");
    
    if (flightList == null || flightList.isEmpty()) {
        out.println("<p>No flights found.</p>");
    } else {
        for (Flight flight : flightList) {
%>

            <div>
            	<hr>
            	<h3><%= flight.deptCity  %> to <%= flight.arrvCity  %></h3>
                <p><b>Flight Number:</b> <%= flight.flightId %></p>
                <p><b>Operator:</b> <%= flight.flightOpereator %></p>
                <p><b>Current Fare:</b> <%= flight.currentFare%></p>
                <p><b>Departure Time:</b> <%= flight.deptTime%> | <%= flight.deptDate%> </p>
                <p><b>Arrival Time:</b> <%= flight.arrvTime%> | <%= flight.arrvDate%></p>
                <p><b>Seats Available:</b> <%= flight.seatCapacityCount-flight.seatBookCount%> / <%= flight.seatCapacityCount%></p>
                
				<a href="/book/<%=String.valueOf(flight.journeyId)%>">
			  	<button>Book your flight</button>
				</a>
				
                <hr>
            </div>

<%
        }
    }
%>

<hr>
<hr>
<hr>

<h3>One Stop Flight </h3>

<%
    List<OneStopFlight> oflightList = (List<OneStopFlight>) request.getAttribute("oneStopflightList");
    
    if (oflightList == null || oflightList.isEmpty()) {
        out.println("<p>No One Stop flights found.</p>");
    } else {
        for (OneStopFlight oflight : oflightList) {
%>

            <div>
                <hr>
                <h3><%= oflight.deptCity  %> to <%= oflight.arrvCity  %></h3>
                <p><b>Flight Journey ID 1:</b> <%= oflight.journey1Id %></p>
                <p><b>Flight Journey ID 2:</b> <%= oflight.journey2Id %></p>
                <p><b>Departure :</b> <%= oflight.deptDate%> </p>
                <p><b>Arrival :</b> <%= oflight.arrvDate%></p>
                <p><b>Layover At :</b> <%= oflight.stopCity%></p>
                  <button>Book your flight</button>
                <hr>
            </div>

<%
        }
    }
%>

</body>
</html>