package com.ems.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ems.model.Department;
import com.ems.repository.DepartmentRepository;
import com.ems.repository.EmployeeRepository;

@Controller
public class DepartmentController {
	@Autowired
	DepartmentRepository deptRepository; 
	
	@RequestMapping("/department")
	public String getAllDepartment(Model model)
	{
		model.addAttribute("departmentList", deptRepository.findAll());
		return "Department";
	}
	
	@RequestMapping(value="/department/add",method=RequestMethod.POST)
	public void addDepartment(@RequestBody Department dept)
	{
		deptRepository.save(dept);
	}
	
	@RequestMapping("/department/{id}")
	public Department getDepartmentById(@PathVariable(value="id") Long id)
	{
		Department dept = deptRepository.findById(id).get();
		return dept;
	}
	
	@RequestMapping("/department/delete/{id}")
	public void deleteEmployee(@PathVariable(value="id") Long id)
	{		
		deptRepository.delete(getDepartmentById(id));
	}
	
	@RequestMapping("department/update/{id}")
	public void updateDepartment(@PathVariable(value="id") Long id)
	{
		Department dept = getDepartmentById(id);
		
	}
}
