package com.supinfo.supmessaging.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
//import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="message")

public class message implements Serializable{
	

	/**
	 * 
	 */

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String time;
	private String content;
	private String sender;
	private String recipient;
	private String ifread;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String now) {
		this.time = now;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String ruser) {
		this.recipient = ruser;
	}
	public String getIfread() {
		return ifread;
	}
	public void setIfread(String b) {
		this.ifread = b;
	}
	
	
	
	
	
	
	

	
	
	
}

