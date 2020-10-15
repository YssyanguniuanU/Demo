package com.yssy.dao;

import java.util.List;

import com.yssy.model.Speaker;

public interface SpeakerDao {
	void add(Speaker speaker);
	void deleteAll(String[] ids);
	void update(Speaker speaker);
	List<Speaker> selectAll(Speaker speaker);
	List<Speaker> selectLikeAll(Speaker speaker);
}
