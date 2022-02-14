package com.trantor.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.trantor.entity.City;


@Repository("cityRepository")
public interface CityRepo extends CrudRepository<City, Long> {

	@Query("select new City(id, name) from City where state.id = :id")
	public List<City> findByState(@Param("id") long id);
	
	@Query(value="select city.name from city where id= :id",nativeQuery = true)
	public String findCitybyid(Long id);

}
