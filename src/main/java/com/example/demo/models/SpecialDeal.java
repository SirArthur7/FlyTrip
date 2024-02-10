package com.example.demo.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class SpecialDeal {
	
	@Id
	public Integer dealId;
	public String title;
	public String link;
	public String imgUrl;
	public String expiresOn;
	public String expiresOnTime;
	public String dest;
	
	
	public Integer getDealId() {
		return dealId;
	}
	public void setDealId(Integer dealId) {
		this.dealId = dealId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getExpiresOn() {
		return expiresOn;
	}
	public void setExpiresOn(String expiresOn) {
		this.expiresOn = expiresOn;
	}
	
	public String getExpiresOnTime() {
		return expiresOnTime;
	}
	public void setExpiresOnTime(String expiresOnTime) {
		this.expiresOnTime = expiresOnTime;
	}
	public String getDest() {
		return dest;
	}
	public void setDest(String dest) {
		this.dest = dest;
	}
	@Override
	public String toString() {
		return "SpecialDeal [dealId=" + dealId + ", title=" + title + ", link=" + link + ", imgUrl=" + imgUrl
				+ ", expiresOn=" + expiresOn + "]";
	}
}
