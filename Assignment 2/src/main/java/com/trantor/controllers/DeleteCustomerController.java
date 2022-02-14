package com.trantor.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trantor.entity.Customer;
import com.trantor.services.CustomerService;

@Controller
@RequestMapping(path = "/delete")
public class DeleteCustomerController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping(method = RequestMethod.GET)
	public String searchForm() {
		return "deleteForm";	
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String searchData(Customer customerEntity,Model model) {
	customerService.delete(customerEntity);

		return "deleteResult";	
	}
}
