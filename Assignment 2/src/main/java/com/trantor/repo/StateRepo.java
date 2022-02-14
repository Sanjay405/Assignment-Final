package com.trantor.repo;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.trantor.entity.State;

@Repository("stateRepository")
public interface StateRepo extends CrudRepository<State, Long> {

	@Query("select new State(id, name) from State where country.id = :id")
	public List<State> findByCountry(@Param("id") long id);
	
	@Query(value="select state.name from state where id= :id",nativeQuery = true)
	public String findStatebyid(Long id);


}