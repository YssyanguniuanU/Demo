package com.yssy.service;

import java.util.List;

import com.yssy.model.Speaker;

public interface SpeakerService {
	void add(Speaker speaker);
	void update(Speaker speaker);
	void deleteAll(String[] ids);
	List<Speaker> selectLikeAll(String key,String value);
	Speaker selectById(int id);
}
