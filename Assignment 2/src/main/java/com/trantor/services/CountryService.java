package com.trantor.services;

import com.trantor.entity.Country;

public interface CountryService {

	public Iterable<Country> findAll();

	public Country findCountry(long id);

}