package com.yssy.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Videoo implements Serializable{
	private Integer videooId;
	private String title;
	private String detail;
	private Integer time;
	private Integer speakerId;
	private Integer courseId;
	private String videoUrl;
	private String imageUrl;
	private Integer playNum;
	private Speaker speaker;
	private Course course;
}
