package com.example.demo.daos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.models.SpecialDeal;

public interface SpecialDealRepo extends JpaRepository<SpecialDeal,Integer>{
	@Query("from SpecialDeal where dealId = ?1")
	List<SpecialDeal> findByDeal(Integer dealid);
	
	@Query("from SpecialDeal")
	List<SpecialDeal> findAllDeal();
	
	@Query("from SpecialDeal where expiresOn < ?1 and expiresOnTime < ?2")
	List<SpecialDeal> findExpired(String d, String t);
}
