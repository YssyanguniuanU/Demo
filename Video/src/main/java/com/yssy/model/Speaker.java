package com.yssy.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Speaker implements Serializable{

	private Integer speakerId;
	private String speakerName;
	private String speakerDesc;
	private String speakerJob;
	private String headImgUrl;
}



