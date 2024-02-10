package com.example.demo.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class OneStopFlight {
	@Id
	public Integer oneStopJourneyId;
	public Integer journey1Id;
	public Integer journey2Id;
	public String deptCity;
	public String arrvCity;
	public String stopCity; 
	public String deptDate; 
	public String arrvDate; 	
	
	public Integer getOneStopFlightJourneyId() {
		return oneStopJourneyId;
	}
	public void setOneStopFlightJourneyId(Integer oneStopJourneyId) {
		this.oneStopJourneyId = oneStopJourneyId;
	}
	public String getDeptCity() {
		return deptCity;
	}
	public void setDeptCity(String deptCity) {
		this.deptCity = deptCity;
	}
	public String getArrvCity() {
		return arrvCity;
	}
	public void setArrvCity(String arrvCity) {
		this.arrvCity = arrvCity;
	}
	public String getDeptDate() {
		return deptDate;
	}
	public void setDeptDate(String deptDate) {
		this.deptDate = deptDate;
	}
	public String getArrvDate() {
		return arrvDate;
	}
	public void setArrvDate(String arrvDate) {
		this.arrvDate = arrvDate;
	}
	public Integer getoneStopFlightJourneyId() {
		return oneStopJourneyId;
	}
	public void setoneStopFlightJourneyId(Integer oneStopFlightJourneyId) {
		this.oneStopJourneyId = oneStopFlightJourneyId;
	}
	public Integer getJourney1Id() {
		return journey1Id;
	}
	public void setJourney1Id(Integer journey1Id) {
		this.journey1Id = journey1Id;
	}
	public Integer getJourney2Id() {
		return journey2Id;
	}
	public void setJourney2Id(Integer journey2Id) {
		this.journey2Id = journey2Id;
	}
	public String getStopCity() {
		return stopCity;
	}
	public void setStopCity(String stopCity) {
		this.stopCity = stopCity;
	}
	@Override
	public String toString() {
		return "OneStopFlight [oneStopJourneyId=" + oneStopJourneyId + ", journey1Id=" + journey1Id + ", journey2Id="
				+ journey2Id + ", deptCity=" + deptCity + ", arrvCity=" + arrvCity + ", stopCity=" + stopCity
				+ ", deptDate=" + deptDate + ", arrvDate=" + arrvDate + "]";
	}
}
