package com.yssy.dao;

import java.util.List;

import com.yssy.model.Videoo;

public interface VideooDao {
	void add(Videoo videoo);
	void deleteAll(String[] ids);
	void update (Videoo videoo);
	List<Videoo> selectAll(Videoo videoo);
	List<Videoo> selectLikeAll(Videoo videoo);
}
