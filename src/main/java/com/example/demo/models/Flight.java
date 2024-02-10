package com.example.demo.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Flight {
	@Id
	public Integer journeyId;
	public String flightId;
	public String flightOpereator;
	public String flightType;
	public String deptCity;
	public String arrvCity;
	public String deptDate; 
	public String deptTime; 
	public String arrvDate;
	public String arrvTime; 
	
	public Integer seatCapacityCount;
	public Integer seatBookCount;
	public Integer currentFare;
	public Integer maxIncrFare;
	
	
	public Integer getJourneyId() {
		return journeyId;
	}
	public void setJourneyId(Integer journeyId) {
		this.journeyId = journeyId;
	}
	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}
	public String getFlightOpereator() {
		return flightOpereator;
	}
	public void setFlightOpereator(String flightOpereator) {
		this.flightOpereator = flightOpereator;
	}
	public String getFlightType() {
		return flightType;
	}
	public void setFlightType(String flightType) {
		this.flightType = flightType;
	}
	public Integer getSeatCapacityCount() {
		return seatCapacityCount;
	}
	public void setSeatCapacityCount(Integer seatCapacityCount) {
		this.seatCapacityCount = seatCapacityCount;
	}
	public Integer getSeatBookCount() {
		return seatBookCount;
	}
	public void setSeatBookCount(Integer seatBookCount) {
		this.seatBookCount = seatBookCount;
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
	public String getDeptTime() {
		return deptTime;
	}
	public void setDeptTime(String deptTime) {
		this.deptTime = deptTime;
	}
	public String getArrvDate() {
		return arrvDate;
	}
	public void setArrvDate(String arrvDate) {
		this.arrvDate = arrvDate;
	}
	public String getArrvTime() {
		return arrvTime;
	}
	public void setArrvTime(String arrvTime) {
		this.arrvTime = arrvTime;
	}
	
	public Integer getCurrentFare() {
		return currentFare;
	}
	public void setCurrentFare(Integer currentFare) {
		this.currentFare = currentFare;
	}
	public Integer getMaxIncrFare() {
		return maxIncrFare;
	}
	public void setMaxIncrFare(Integer maxIncrFare) {
		this.maxIncrFare = maxIncrFare;
	}
	
	public void updateFare(){
		this.currentFare += (this.maxIncrFare/this.seatCapacityCount*this.seatBookCount);
	}
	@Override
	public String toString() {
		return "Flight [journeyId=" + journeyId + ", flightId=" + flightId + ", flightOpereator=" + flightOpereator
				+ ", flightType=" + flightType + ", deptCity=" + deptCity + ", arrvCity=" + arrvCity + ", deptDate="
				+ deptDate + ", deptTime=" + deptTime + ", arrvDate=" + arrvDate + ", arrvTime=" + arrvTime
				+ ", seatCapacityCount=" + seatCapacityCount + ", seatBookCount=" + seatBookCount + ", currentFare="
				+ currentFare + ", maxIncrFare=" + maxIncrFare + "]";
	}
}
