package com.trantor.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trantor.entity.Customer;
import com.trantor.services.CustomerService;


@Controller
@RequestMapping(path = "/search")
public class SearchCostomerController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping(method = RequestMethod.GET)
	public String searchForm() {
		return "searchdataform";	
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String searchData(Customer customer,Model model) {
		
		if(customer.getName().isBlank()||customer.getName().isEmpty()) {
		List<Customer> list = customerService.display(customer);
		model.addAttribute("list",list);
		}
		else {
			List<Customer> list = customerService.displayByName(customer);
			model.addAttribute("list",list);
		}	
		return "searchresult";	
	}
}
