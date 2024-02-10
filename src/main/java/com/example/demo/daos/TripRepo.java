package com.example.demo.daos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.models.Trip;

public interface TripRepo extends JpaRepository<Trip,Integer>{
	@Query("from Trip where userEmail = ?1")
	List<Trip> findByEmail(String email);
	@Query("from Trip where pnr = ?1")
	Trip findByPnr(Integer pnr);
}
