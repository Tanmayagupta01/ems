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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

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
	public ModelAndView addDepartment(@RequestBody Department dept)
	{
		deptRepository.save(dept);
		return new ModelAndView("redirect:/department");
	}
	@RequestMapping(value="/department/add",method=RequestMethod.GET)
	public String viewAddDepartment()
	{
		return "AddDepartment";
	}
	
	@RequestMapping("/department/{id}")
	public Department getDepartmentById(@PathVariable(value="id") Long id)
	{
		Department dept = deptRepository.findById(id).get();
		return dept;
	}
	
	@RequestMapping("/department/delete/{id}")
	public ModelAndView deleteEmployee(@PathVariable(value="id") Long id)
	{		
		deptRepository.delete(getDepartmentById(id));
		return new ModelAndView("redirect:/department");
	}
	
	@RequestMapping("/department/update/{id}")
	public String viewUpdateDepartment(@PathVariable(value="id") Long id,Model model)
	{
		Department dept = getDepartmentById(id);
		model.addAttribute("dept",dept);
		return "UpdateDepartment";
	}
	
	@RequestMapping(value="/department/update", method=RequestMethod.POST)
	public ModelAndView updateDepartment(@RequestBody Department dept)
	{
		deptRepository.save(dept);
		//ModelAndView mv = new ModelAndView(new RedirectView("/department"));
		return new ModelAndView("redirect:/department");
	//	return mv;
	}
}
