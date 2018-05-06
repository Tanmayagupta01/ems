package com.ems.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ems.model.Employee;
import com.ems.repository.EmployeeRepository;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeRepository employeeRepository;

	@RequestMapping("/employees")
	public String getAllEmployee(Model model) {
//		return employeeRepository.findAll();
	//	System.out.println("yes");
		model.addAttribute("employeeList", employeeRepository.findAll());
		return "Employees";
	}

	
	
	@RequestMapping(value = "/employees/add", method = RequestMethod.POST)
	public ModelAndView addEmployee(@RequestBody Employee emp) {

		employeeRepository.save(emp);
		return new ModelAndView("redirect:/employees");
//		return emp;
	}
	
	@RequestMapping(value = "/employees/add", method = RequestMethod.GET)
	public String viewAddPage() {

		return "Add";
	}

	@RequestMapping("/delete/{id}")
	public ModelAndView deleteEmployee(@PathVariable(value = "id") Long id) {
		Employee employee = new Employee();
		employee.setId(id);
		employeeRepository.delete(employee);
		return new ModelAndView("redirect:/employees");
	}

	@RequestMapping("/employee/{id}")
	public Employee getEmployeeById(@PathVariable(value = "id") Long id) {
		return employeeRepository.findById(id).get();
	}

	@RequestMapping("/update/{id}")
	public void updateEmployee(@PathVariable(value = "id") Long id) {
		Employee employee = new Employee();
		employee.setId(id);
		employee.setName("Honey");
		employee.setAddress("Kota");
		employee.setMobileNo("9413201403");
		employee.setEmail("tanmayagupta01@gmail.com");
		employee.setSalary(20000);
		employeeRepository.save(employee);
	}
}
