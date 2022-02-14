package com.trantor.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.trantor.entity.Customer;

public interface CustomerRepo extends CrudRepository<Customer, Integer> {

	@Query(value = "select * from customer where name =:name", nativeQuery = true)
	public List<Customer> findByName(String name);

	@Modifying
	@Query(value = "update customer set name =:name,customer_type =:ctype,country =:country,state =:state,city =:city,street =:street,pincode =:pincode,updated_by =:updated_by,updated_on =:updated_on where phone =:phone", nativeQuery = true)
	public void updateByPhone(String name, String ctype, String country, String state, String city, String street,
			Integer pincode,String updated_by,String updated_on,Long phone);

    @Modifying
	@Query(value = "delete from customer where phone =:phone", nativeQuery = true)
	public void deletebyphone(Long phone);

}
