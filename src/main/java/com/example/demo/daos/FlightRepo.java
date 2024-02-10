package com.example.demo.daos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.models.Flight;

public interface FlightRepo extends JpaRepository<Flight,Integer> // Inherits CrudRepository<?,id_Type> return List no iterable
{
	@Query("from Flight where flightOpereator = ?1 order by currentFare")
	List<Flight> findByFlightOpereator(String string);
	
	@Query("from Flight")
	List<Flight> findByFlightAll();
	
	@Query("from Flight where deptCity = ?1 and arrvCity = ?2 and deptDate=?3 and arrvDate=?4 order by currentFare")
	List<Flight> findBySearchQuery(String departure,String desination,String d_date,String r_date);
	
	@Query("from Flight where deptCity = ?1 and arrvCity = ?2 and deptDate=?3 order by currentFare")
	List<Flight> findBySearchQuery(String departure,String desination,String d_date);
	
	@Query("from Flight where deptCity = ?1 and arrvCity = ?2 order by currentFare")
	List<Flight> findBySearchQuery(String departure,String desination);
	
	@Query("from Flight where journeyId = ?1")
	Flight findByJourneyId(Integer journeyId);


	@Query("from Flight where arrvCity= ?1")
	List<Flight> findByJourneyToCity(String city);
	
//	@Query("Update Flight set  where arrvCity= ?1")
//	List<Flight> cancelFlightDealForDest(String dest);
}