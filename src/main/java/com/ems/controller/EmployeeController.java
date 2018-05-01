package com.ems.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ems.model.Employee;
import com.ems.repository.EmployeeRepository;

@RestController
public class EmployeeController {
	@Autowired
	EmployeeRepository employeeRepository;

	@RequestMapping("/employees")
	public List<Employee> getAllEmployee() {
		return employeeRepository.findAll();
	}

	@RequestMapping(value = "/employees/add", method = RequestMethod.POST)
	public void addEmployee(@RequestBody Employee emp) {

		employeeRepository.save(emp);
	}

	@RequestMapping("/delete/{id}")
	public void deleteEmployee(@PathVariable(value = "id") Long id) {
		Employee employee = new Employee();
		employee.setId(id);
		employeeRepository.delete(employee);
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
