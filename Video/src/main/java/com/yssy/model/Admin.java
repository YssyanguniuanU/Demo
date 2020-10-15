package com.yssy.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin implements Serializable{
	private Integer adminId;
	private String username;
	private String password;
	private String roles;
}
