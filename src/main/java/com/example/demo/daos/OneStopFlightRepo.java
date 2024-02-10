package com.example.demo.daos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.models.OneStopFlight;

public interface OneStopFlightRepo extends JpaRepository<OneStopFlight,Integer> {
	@Query("from OneStopFlight where deptCity = ?1 and arrvCity = ?2 and deptDate=?3 and arrvDate=?4")
	List<OneStopFlight> findBySearchQuery(String departure,String desination,String d_date,String r_date);
	
	@Query("from OneStopFlight where deptCity = ?1 and arrvCity = ?2")
	List<OneStopFlight> findBySearchQuery(String departure,String desination);
	
	@Query("from OneStopFlight where arrvCity= ?1")
    List<OneStopFlight> findByJourneyToCity(String city);
}