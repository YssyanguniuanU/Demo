package com.yssy.dao;

import java.util.List;

import com.yssy.model.Subject;

public interface SubjectDao {
	
	List<Subject> selectAll(Subject subject);
	
	List<Subject> selectCourseAndVideo(int subjectId);
}
