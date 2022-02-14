package com.trantor.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trantor.entity.City;
import com.trantor.repo.CityRepo;

@Service
public class CityServiceImpl implements CityService {

	@Autowired
	private CityRepo cityRepo;

	@Override
	public List<City> findByState(int id) {
		return cityRepo.findByState(id);
	}

}