package com.trantor.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trantor.entity.Country;
import com.trantor.repo.CountryRepo;

@Service
public class CountryServiceImpl implements CountryService {

	@Autowired
	private CountryRepo countryRepo;

	@Override
	public Iterable<Country> findAll() {
		return countryRepo.findAll();
	}

	@Override
	public Country findCountry(long id) {
		return countryRepo.findById(id).get();
	}

}
