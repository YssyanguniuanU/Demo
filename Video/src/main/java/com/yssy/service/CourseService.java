package com.yssy.service;

import java.util.List;

import com.yssy.model.Course;
import com.yssy.model.Subject;

public interface CourseService {
	void add(Course course);
	void update(Course course);
	int deleteAll(String[] ids);
	List<Course> selectLikeAll(String key,String value);
	Course selectById(int id);
	
	List<Course> selectCourseAndVideo(Integer videooId);
}
