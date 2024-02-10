package com.example.demo.controlers;

import java.util.List;
import java.util.Map;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;

import java.util.*;
import java.text.*; 

import org.apache.catalina.User;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.daos.FlightRepo;
import com.example.demo.daos.OneStopFlightRepo;
import com.example.demo.daos.SpecialDealRepo;
import com.example.demo.daos.TripRepo;
import com.example.demo.models.Flight;
import com.example.demo.models.OneStopFlight;
import com.example.demo.models.SpecialDeal;
import com.example.demo.models.Trip;

@Controller
public class MyController {
	
	@Autowired
	FlightRepo flightRepo;
	
	@Autowired
	TripRepo tripRepo;
	
	@Autowired
	SpecialDealRepo dealRepo;
	
	@Autowired
	OneStopFlightRepo oneStopFlightRepo;
	
	OAuth2User mUser;
	
	
	public ModelAndView adminPage() {
		ModelAndView mv=new ModelAndView("adminhome.jsp");
		List<Flight> flightList = flightRepo.findAll();
		mv.addObject("flightList",flightList);
		return mv;
	}
	
	@GetMapping("/addflight")
	@ResponseBody
	public String addFlight(Flight flight) {
		System.out.println(flight);
		if(mUser.getAttribute("email").toString().equals("abishrantobrishti@gmail.com")) {
			flight.journeyId=(int)System.currentTimeMillis();
			flightRepo.save(flight);
			return "Successfully Inserted/Updated";
		}else
			return "Permission Denied";
	}
	
	@GetMapping("/createdeal")
	@ResponseBody
	public String addAd(SpecialDeal deal) {
		System.out.println(deal);
		if(mUser.getAttribute("email").toString().equals("abishrantobrishti@gmail.com")) {
			deal.dealId=(int)System.currentTimeMillis();
			dealRepo.save(deal);
			
			List<Flight> flights = flightRepo.findByJourneyToCity(deal.dest);
			
			for(Flight f:flights){
				f.currentFare = (f.currentFare*75)/100;
				flightRepo.save(f);
			}
			
			return "Successfully Created Deal";
		}else
			return "Permission Denied";
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public String deleteFlight(String jid) {
		if(mUser.getAttribute("email").toString().equals("abishrantobrishti@gmail.com")) {
			flightRepo.deleteById(Integer.parseInt(jid));
			return "Successfully Deleted";
		}else
			return "Permission Denied";
	}
	
	@GetMapping("/")
	public ModelAndView home(@AuthenticationPrincipal OAuth2User principal)
	{
		mUser = principal;
		System.out.println("--------------------->"+mUser.getAttribute("name"));
		System.out.println("--------------------->"+mUser.getAttribute("email"));
		System.out.println("--------------------->"+mUser.getAttribute("picture"));
		ModelAndView mv=new ModelAndView("home.jsp");
		mv.addObject("currentUserEmail",mUser.getAttribute("email"));
		
		
		if(mUser.getAttribute("email").toString().equals("abishrantobrishti@gmail.com")) {
			return adminPage();
		}
		
		List<Trip> tripList = tripRepo.findByEmail(mUser.getAttribute("email").toString());
		mv.addObject("tripList",tripList);
		
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String cur_date = formatter.format(new Date(System.currentTimeMillis()));
		DateFormat formatter1 = new SimpleDateFormat("HH:mm:ss");
		String cur_time = formatter1.format(new Date(System.currentTimeMillis()));
		
		List<SpecialDeal> expList = dealRepo.findExpired(cur_date,cur_time);
		
		for(SpecialDeal d:expList) {
			String dest = d.dest;
			System.out.println("Exipred Destination "+dest);
			dealRepo.deleteById(d.dealId);
			
			List<Flight> flights = flightRepo.findByJourneyToCity(dest);
			
			for(Flight f:flights){
				f.currentFare = (f.currentFare*125)/100;
				flightRepo.save(f);
			}
		}
		
		List<SpecialDeal> dealList = dealRepo.findAll();
		System.out.println("Deals-------->>>>>>>>> "+dealList);
		
		mv.addObject("dealList",dealList);
		
		return mv;
	}
	
	
	@GetMapping("/flights/{oper}") 
	@ResponseBody // REST
	public List<Flight> getFlight(@PathVariable("oper")String oper)
	{
		System.out.println("--------------------->"+mUser.getAttribute("name"));
		System.out.println("--------------------->"+mUser.getAttribute("email"));
		System.out.println("--------------------->"+mUser.getAttribute("picture"));
		System.out.println("----> Req:   "+oper);
		return flightRepo.findByFlightOpereator(oper);
	}
	
	@GetMapping("/flights/all") 
	@ResponseBody // REST
	public List<Flight> getFlightAll()
	{
		System.out.println("--------------------->"+mUser.getAttribute("name"));
		System.out.println("--------------------->"+mUser.getAttribute("email"));
		System.out.println("--------------------->"+mUser.getAttribute("picture"));
		System.out.println("----> Req:   "+"all");
		return flightRepo.findByFlightAll();
	}
	
	
	@GetMapping("/search") 
	public ModelAndView getSearchResult(Flight qflight)
	{
		System.out.println("--------------------->"+mUser.getAttribute("name"));
		System.out.println("--------------------->"+mUser.getAttribute("email"));
		System.out.println("--------------------->"+mUser.getAttribute("picture"));
		
		List<Flight> flights=null;
		List<OneStopFlight> onestopflights=null;
		
		System.out.println("----> Req:   "+qflight);
		if(qflight.getDeptDate().length()==0 && qflight.getArrvDate().length()==0) {
			flights = flightRepo.findBySearchQuery(qflight.getDeptCity(),qflight.getArrvCity());
			onestopflights = oneStopFlightRepo.findBySearchQuery(qflight.getDeptCity(),qflight.getArrvCity());
		}
		else if(qflight.getArrvDate().length()==0) {
			flights = flightRepo.findBySearchQuery(qflight.getDeptCity(),qflight.getArrvCity(), qflight.getDeptDate());
		}else {
			flights = flightRepo.findBySearchQuery(qflight.getDeptCity(),qflight.getArrvCity(), qflight.getDeptDate(), qflight.getArrvDate());
			onestopflights = oneStopFlightRepo.findBySearchQuery(qflight.getDeptCity(),qflight.getArrvCity(), qflight.getDeptDate(), qflight.getArrvDate());
		}
		
		
		System.out.println(onestopflights);
		ModelAndView mv=new ModelAndView("searchResult.jsp");
		mv.addObject("flightList",flights);
		mv.addObject("oneStopflightList",onestopflights);
		mv.addObject("currentUserEmail",mUser.getAttribute("email"));
		return mv;
	}
	
	
	@GetMapping(path="/book/{jid}")
	@ResponseBody
	public String bookRequest(@PathVariable("jid")Integer jid) {
		System.out.println("Booking Request> "+jid.toString()+"  done by "+mUser.getAttribute("email"));
		ModelAndView mv=new ModelAndView("home.jsp");
		
		Flight f = flightRepo.findByJourneyId(jid);
		
		if(f.seatBookCount<f.seatCapacityCount) {
			f.seatBookCount++;
			flightRepo.save(f);
			
			Trip t = new Trip();
			t.pnr =  (int)System.currentTimeMillis();
			t.journeyId = jid;
			t.userEmail = mUser.getAttribute("email");
			t.bookingFare = f.currentFare;
			
			f.updateFare();
			tripRepo.save(t);
			System.out.println("All Trips:  \n"+tripRepo.findAll());
			
			mv.addObject("StatusMessage","Booking Successful");
			return "Booking succesful";
		}else {
			mv.addObject("StatusMessage","Booking Unsuccessful");
		}
				
		return "Booking unsuccesful";
	}
	
	
	@GetMapping(path="/tripdetails")
	public ModelAndView showTripJourney(@RequestParam("pnr")int pnr){
        ModelAndView mv=new ModelAndView("bookedTicket.jsp");
		Trip trip = tripRepo.findByPnr(pnr);
		Flight flight = flightRepo.findByJourneyId(trip.journeyId);
		mv.addObject("flight",flight);
		mv.addObject("trip",trip);
		System.out.println(pnr);
		System.out.println(trip);
		System.out.println(flight);
		return mv;
	}
	
	@GetMapping(path="/city")
    public ModelAndView showTripByCity(String city){
        ModelAndView mv=new ModelAndView("searchResult.jsp");
        List<Flight>flights = flightRepo.findByJourneyToCity(city);
        List<OneStopFlight>oneStopflightList = oneStopFlightRepo.findByJourneyToCity(city);
        mv.addObject("flightList",flights);
        mv.addObject("oneStopflightList",oneStopflightList);
        mv.addObject("currentUserEmail",mUser.getAttribute("email"));
        return mv; 
    }
}




