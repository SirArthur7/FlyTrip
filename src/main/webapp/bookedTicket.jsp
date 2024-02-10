<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.models.Flight"%>
<%@ page import="com.example.demo.models.Trip"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Booked Ticket Page</title>
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
			color: #444444;
			text-align: center;
		}
		h1 {
			color: #4285f4;
			margin-top: 50px;
		}
		h3 {
			color: #ea4335;
			margin-top: 30px;
			margin-bottom: 10px;
		}
		p {
			margin-top: 10px;
			margin-bottom: 10px;
		}
		b {
			color: #555555;
		}
	</style>
</head>
<body>

	<h1>Ticket Information</h1>

	<%
		Flight flight = (Flight) request.getAttribute("flight");
		Trip trip = (Trip) request.getAttribute("trip");
	%>  

	<p><b>PNR No:</b> <%= trip.pnr%></p>
	<p><b>Booked By:</b> <%= trip.userEmail%></p>
	<h3><%= flight.deptCity %> to <%= flight.arrvCity %></h3>
	<p><b>Flight Number:</b> <%= flight.flightId %></p>
	<p><b>Operator:</b> <%= flight.flightOpereator %></p>
	<p><b>Departure Time:</b> <%= flight.deptTime %> | <%= flight.deptDate %></p>
	<p><b>Arrival Time:</b> <%= flight.arrvTime %> | <%= flight.arrvDate %></p>
	<p><b>Booking Amount:</b> Rs. <%= trip.bookingFare %>.00 /-</p>

</body>
</html>
