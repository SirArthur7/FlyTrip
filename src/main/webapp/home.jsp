<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.example.demo.models.Trip" %>   
<%@ page import = "com.example.demo.models.SpecialDeal" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlyTrip Home Page</title>

<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  margin: 0;
}

.container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

.header {
  text-align: center;
  margin-bottom: 20px;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 10px;
}

.form-group input[type="text"],
.form-group input[type="date"] {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
  margin-top: 5px;
  margin-bottom: 10px;
}

.form-group input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-bottom: 10px;
}

.form-group input[type="submit"]:hover {
  background-color: #45a049;
}

.card-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin-bottom: 20px;
}

.explore {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  margin-top: 20px;
}

.card {
  display: inline-block;
  margin: 10px;
  width: 300px;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 10px;
  margin-bottom: 20px;
  background-color: white;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  transition: box-shadow 0.3s ease-in-out;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.card img {
  max-width: 100%;
}

.card h2 {
  font-size: 18px;
  margin-top: 10px;
}

.specialdic {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
}

.special-deals {
  margin-bottom: 20px;
}

.special-deals h4 {
  margin-bottom: 10px;
}

.special-deals p {
  margin-bottom: 5px;
}

.special-deals img {
  max-width: 290px;
  max-height: 160px;
}

.special-deals .card {
  width: 300px;
  justify-content: center;
  align-items: center;
  text-align: center;
}

hr {
  border: none;
  border-top: 1px solid #ccc;
  margin: 20px 0;
}

marquee {
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 2px;
}

</style>

</head>

<body>
<div class="container">
  <div class="header">
    <h1>FlyTrip - Your air travel buddy</h1>
    <p>Current User: ${currentUserEmail}</p>
    <h5>${StatusMessage}</h5>
  </div>

  	<h3>Search Flights</h3>
	<form action="search" method="get">
		<label for="departure">Departure:</label>
		<input type="text" id="deptCity" name="deptCity" required>
		<br>

		<label for="destination">Destination:</label>
		<input type="text" id="arrvCity" name="arrvCity" required>
		<br>

		<label for="departure_date">Departure Date:</label>
		<input type="date" id="deptDate" name="deptDate">
		<br>

		<label for="return_date">Return Date:</label>
		<input type="date" id="arrvDate" name="arrvDate">
		<br>
		<input type="submit" value="Search Flights">
	</form>

	<h3>Your Trips</h3>

	<div class="trip-list">
		<%
			List<Trip> tripList = (List<Trip>) request.getAttribute("tripList");
			if (tripList == null || tripList.isEmpty()) {
			    out.println("<p>No Trips</p>");
			} else {
			    for (Trip trip : tripList) {
		%>    	
					<div class="trip-card">
					      <hr>
					      <p>
					      <b>PNR No:</b> <%= trip.pnr %>
					      <b>|   Booked By:</b> <%= trip.userEmail%>
					      <b>|   Booking Amount:</b> Rs. <%= trip.bookingFare%>.00 /-
					      <b>   <a href="/tripdetails?pnr=<%= trip.pnr %>">Click to view journey</a> </b>
					      </p>
					      <hr>
		            </div>
		<%
		        }
		    }
		%>
	</div>

	<div class="explore">
		<hr>
		<marquee><h4>******* Explore The Capitals *******</h4></marquee>
		<hr>

		<div class="card">
		  <a href="/city?city=bom">
		    <img src="https://media.timeout.com/images/105241451/image.jpg" alt="Example Image">
		    <h2>Explore Mumbai</h2>
		  </a>
		</div>

		<div class="card">
		  <a href="/city?city=del">
		    <img src="https://www.travelandleisure.com/thmb/iAIrOVW7yWrDG8pZBpKMOvEGuNQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/new-delhi-india-NEWDELHITG0721-60d592e1603349298a0206d67d08582b.jpg" alt="Example Image">
		    <h2>Explore Delhi</h2>
		  </a>
		</div>

		<div class="card">
		  <a href="/city?city=ccu">
		    <img src="https://images.lifestyleasia.com/wp-content/uploads/sites/7/2023/01/25135425/Untitled-design-13-1-1600x900.jpg" alt="Example Image">
		    <h2>Explore Kolkata</h2>
		  </a>
		</div>
	</div>


</div>

<div class="specialdic">
<hr>
<marquee><h4>******* Special Deals *******</h4></marquee>
<hr>
<%
	List<SpecialDeal> dealList = (List<SpecialDeal>) request.getAttribute("dealList");
	if (dealList == null || dealList.isEmpty()) {
	    out.println("<p>No Special Deals</p>");
	} else {
	    for (SpecialDeal deal : dealList) {
%>    	
			<div class="card">
			  <a href=<%= deal.link %>>
			  	<h4><%=deal.title%></h4>
			  	<h5>25% Off On Base Price</h5>
			    <img src="<%= deal.imgUrl %>" alt="Deal Image">
			    <p>Deal Ends On <%= deal.expiresOn%></p>
			  </a>
			</div>
<%
        }
    }
%>
<hr>
</div>
</body>
</html>