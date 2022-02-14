package com.trantor.services;

import java.util.List;

import com.trantor.entity.State;

public interface StateService {

	public List<State> findByCountry(int id);

}