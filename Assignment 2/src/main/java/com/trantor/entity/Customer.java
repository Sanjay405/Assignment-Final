package com.trantor.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.Data;

@Entity
@Table(name = "customer",uniqueConstraints = {@UniqueConstraint(columnNames={"cid","phone"})})
@Data
public class Customer {
@Id
@Column(name = "cid")
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer cid;

@Column(name = "name")
private String name;

@Column(name = "customer_type")
private String customer_type;

@Column(name = "phone")
private Long phone;

@Column(name = "country")
private String country;

@Column(name = "state")
private String state;

@Column(name = "city")
private String city;

@Column(name = "street")
private String street;

@Column(name = "pincode")
private Integer pincode;

@Column(name = "created_by")
private String created_by;

@Column(name = "created_on")
private String created_on;

@Column(name = "updated_by")
private String updated_by;

@Column(name = "updated_on")
private String updated_on;
}
