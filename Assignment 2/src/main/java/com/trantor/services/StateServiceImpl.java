package com.trantor.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trantor.entity.State;
import com.trantor.repo.StateRepo;

@Service
public class StateServiceImpl implements StateService {

	@Autowired
	private StateRepo stateRepo;

	@Override
	public List<State> findByCountry(int id) {
		return stateRepo.findByCountry(id);
	}

}
