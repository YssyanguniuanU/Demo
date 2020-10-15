package com.yssy.model;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable{
	private Integer userId;
	private String email;
	private String phoneNum;
	private String password;
	private String code;
	private String nickname;
	private String sex;
	private String birthday;
	private String address;
	private String imgUrl;
	private Timestamp createTime;
}
