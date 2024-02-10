<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ page import = "java.util.List" %>
 <%@ page import = "com.example.demo.models.Flight" %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }
    
    h1 {
        text-align: center;
        color: #008080;
        margin-top: 50px;
    }
    
    h2 {
        color: #008080;
        margin-top: 40px;
    }
    
    form {
        margin-top: 20px;
        margin-bottom: 30px;
    }
    
    label {
        font-weight: bold;
        color: #008080;
    }
    
    input[type=text], input[type=date], input[type=time], input[type=number] {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        width: 50%;
        margin-bottom: 15px;
    }
    
    button[type=submit] {
        background-color: #008080;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    
    button[type=submit]:hover {
        background-color: #006666;
    }
    
    div {
        background-color: #fff;
        padding: 15px;
        margin-top: 20px;
        border-radius: 4px;
    }
    
    hr {
        border: 1px solid #ccc;
        margin-top: 30px;
        margin-bottom: 30px;
    }
    
    p {
        margin-top: 10px;
        margin-bottom: 10px;
    }
</style>

</head>
<body>
<h1>Admin Page (FlyTrip.pvt.ltd)</h1>
<h2>Add/Update Flights</h2>
		<form action="/addflight" method="get">		  
		  <label for="flightId">Flight ID:</label>
		  <input type="text" id="flightId" name="flightId" required><br><br>
		  
		  <label for="flightOpereator">Flight Operator:</label>
		  <input type="text" id="flightOpereator" name="flightOpereator" required><br><br>
		  
		  <label for="flightType">Flight Type:</label>
		  <input type="text" id="flightType" name="flightType" required><br><br>
		  
		  <label for="deptCity">Departure City:</label>
		  <input type="text" id="deptCity" name="deptCity" required><br><br>
		  
		  <label for="arrvCity">Arrival City:</label>
		  <input type="text" id="arrvCity" name="arrvCity" required><br><br>
		  
		  <label for="deptDate">Departure Date:</label>
		  <input type="date" id="deptDate" name="deptDate" required><br><br>
		  
		  <label for="deptTime">Departure Time:</label>
		  <input type="time" id="deptTime" name="deptTime" required><br><br>
		  
		  <label for="arrvDate">Arrival Date:</label>
		  <input type="date" id="arrvDate" name="arrvDate" required><br><br>
		  
		  <label for="arrvTime">Arrival Time:</label>
		  <input type="time" id="arrvTime" name="arrvTime" required><br><br>
		  
		  <label for="seatCapacityCount">Seat Capacity Count:</label>
		  <input type="number" id="seatCapacityCount" name="seatCapacityCount" required><br><br>
		  
		  <label for="seatBookCount">Seat Book Count:</label>
		  <input type="number" id="seatBookCount" name="seatBookCount" required><br><br>
		  
		  <label for="currentFare">Current Fare:</label>
		  <input type="number" id="currentFare" name="currentFare" required><br><br>
		  
		  <label for="maxIncrFare">Max Incremental Fare:</label>
		  <input type="number" id="maxIncrFare" name="maxIncrFare" required><br><br>
		  
		  <button type="submit">Create Flight Route</button>
		</form>
<h2>Merge Two Direct Flight Route</h2>
	<form action="/mergeflight" method="post">	  
	  <label for="flight1Id">First Flight ID:</label>
	  <input type="text" id="flight1Id" name="flight1Id" required><br><br>
	  
	  <label for="flight2Id">Second Flight ID:</label>
	  <input type="text" id="flight2Id" name="flight2Id" required><br><br>
	  
	  <button type="submit">Submit</button>
	</form>
	
<h2>Delete Flights</h2>
		<form action="/delete" method="get">
		  <label for="jid">Journey ID:</label>
		  <input type="text" id="jid" name="jid"><br><br>
		  <button type="submit">Delete Flight</button>
		</form>
<h2>Create Advertisement</h2>

<form action="/createdeal" method="get">
  <label for="title">Title:</label>
  <input type="text" id="title" name="title" required><br><br>
  
  <label for="link">Link:</label>
  <input type="text" id="link" name="link" required><br><br>
  
  <label for="imgUrl">Image URL:</label>
  <input type="text" id="imgUrl" name="imgUrl" required><br><br>
  
  <label for="expiresOn">Expires On:</label>
  <input type="date" id="expiresOn" name="expiresOn" required><br><br>
  
  <label for="dest">Destination:</label>
  <input type="text" id="dest" name="dest" required><br><br>
  
  <button type="submit">Create</button>
</form>

<h2>All Flights</h2>
<%
    List<Flight> flightList = (List<Flight>) request.getAttribute("flightList");
    
    if (flightList == null || flightList.isEmpty()) {
        out.println("<p>No flights found.</p>");
    } else {
        for (Flight flight : flightList) {
%>

            <div>
            	<hr>
            	<p><b>Journey ID: </b> <%= flight.journeyId%></p>
            	<h3><%= flight.deptCity  %> to <%= flight.arrvCity  %></h3>
                <p><b>Flight Number:</b> <%= flight.flightId %></p>
                <p><b>Operator:</b> <%= flight.flightOpereator %></p>
                <p><b>Current Fare:</b> <%= flight.currentFare%></p>
                <p><b>Departure Time:</b> <%= flight.deptTime%> | <%= flight.deptDate%> </p>
                <p><b>Arrival Time:</b> <%= flight.arrvTime%> | <%= flight.arrvDate%></p>
                <p><b>Seats Available:</b> <%= flight.seatCapacityCount-flight.seatBookCount%> / <%= flight.seatCapacityCount%></p>
                <hr>
            </div>

<%
        }
    }
%>
</body>
</html>