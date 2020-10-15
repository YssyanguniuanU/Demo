package com.yssy.model;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Subject implements Serializable{
	private Integer subjectId;
	private String subjectName;
	private List<Course> courseList;
}
