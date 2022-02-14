package com.trantor.services;

import java.util.List;

import com.trantor.entity.City;

public interface CityService {

	public List<City> findByState(int id);

}