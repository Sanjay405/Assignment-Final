package com.trantor.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trantor.dao.CustomerDAO;
import com.trantor.entity.Customer;

@Service
public class CustomerService {

	@Autowired
	private CustomerDAO customerDAO;
		
		public void save(Customer customer ) {
			customerDAO.saveData(customer);	
		}
	
		public void delete(Customer customer ) {
			customerDAO.deleteData(customer);	
		}
		public void update(Customer customer ) {
			customerDAO.updateData(customer);	
		}
		public List<Customer> display(Customer customer){	
			return customerDAO.searchData(customer);
		}
		public List<Customer> displayByName(Customer customer){	
			return customerDAO.searchDataByName(customer);
		}
		
}

