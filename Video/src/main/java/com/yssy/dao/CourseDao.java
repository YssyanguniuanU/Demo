package com.yssy.dao;

import java.util.List;

import com.yssy.model.Course;
import com.yssy.model.Subject;

public interface CourseDao {
	void add(Course course);
	int deleteAll(String[] ids);
	void update(Course course);
	List<Course> selectAll(Course course);
	List<Course> selectLikeAll(Course course);
	
	List<Course> selectCourseAndVideoo(Integer videooId);
}
