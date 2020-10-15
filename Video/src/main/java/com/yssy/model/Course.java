package com.yssy.model;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Course implements Serializable{
	
	private Integer courseId;
	private String courseTitle;
	private String courseDesc;
	private String subjectId;
	private Subject subject;
	private List<Videoo> videooList;
}
