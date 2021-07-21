package com.pharma.core.model.physician;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import static javax.persistence.GenerationType.IDENTITY;
/**
 * This class is a JPA entity class
 */
@Entity
@Table(name= "physician_assistant_old_password")
public class PhysicianAssistantOldPassword {
	
	

	private int rowId;
    private int physicianAssistantId;
    private String password;
    private Date dateMoved;
    
 // Constructors

 	/** default constructor */
 	
 	public PhysicianAssistantOldPassword(){
 	}

	//Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "row_id", unique = true, nullable = false)
	public int getRowId() {
		return rowId;
	}

	public void setRowId(int rowId) {
		this.rowId = rowId;
	}

	@Column(name="physician_assistant_id", nullable = false)
	public int getPhysicianAssistantId() {
		return physicianAssistantId;
	}

	public void setPhysicianAssistantId(int physicianAssistantId) {
		this.physicianAssistantId = physicianAssistantId;
	}

	@Column(name = "password", nullable = false, length = 100)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "date_moved", nullable = false)
	public Date getDateMoved() {
		return dateMoved;
	}

	public void setDateMoved(Date dateMoved) {
		this.dateMoved = dateMoved;
	}
    
 
 		
 		
 		


}
