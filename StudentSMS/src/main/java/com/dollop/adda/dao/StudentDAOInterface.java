package com.dollop.adda.dao;

import java.util.List;

import com.dollop.adda.bean.Student;

public interface StudentDAOInterface {
	
	public Boolean save(Student student);
	public List<Student> viewAllStudents();
	public Boolean deleteById(Integer sid);
	public Student studentById(Integer sid);

}
