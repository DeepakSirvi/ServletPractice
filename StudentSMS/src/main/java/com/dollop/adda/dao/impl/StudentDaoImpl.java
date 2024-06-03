package com.dollop.adda.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dollop.adda.bean.Student;
import com.dollop.adda.dao.StudentDAOInterface;
import com.dollop.adda.util.DbConnection;

public class StudentDaoImpl implements StudentDAOInterface {
	private final static String ADD_SQL="INSERT INTO STUDENT (sName,sEmail,sMobile,sAddress) values(?,?,?,?)";
	private final static String UPDATE_SQL="Update student set sName=?,sEmail=?,sMobile=?,sAddress=? where sID=?";
	private final static String VIEW_SQL="select * from student";
	private final static String DELETE_SQL="delete from student where sId=?";
	private final static String STUDENT_SQL="select * from student where sId=?";
	private Connection con = null;
	private PreparedStatement pstmt = null;

	public Boolean save(Student student) {
		con=DbConnection.getConnection();
		try {
			if(student.getSid()!=null)
			{

				pstmt=con.prepareStatement(UPDATE_SQL);
				pstmt.setInt(5, student.getSid());
				System.out.println("Update");
			
			}
			else
			{
				pstmt=con.prepareStatement(ADD_SQL);
			}
			pstmt.setString(1, student.getSname());
			pstmt.setString(2, student.getSemail());
			pstmt.setString(3, student.getSmobile());
			pstmt.setString(4, student.getSaddress());
			if(pstmt.executeUpdate()>0)
			{
				return true;
			}
			else
			{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	public List<Student> viewAllStudents() {
		List<Student> list = new ArrayList<Student>();
		con=DbConnection.getConnection();
		try {
			pstmt=con.prepareStatement(VIEW_SQL);
			ResultSet rs= pstmt.executeQuery();
			while(rs.next())
			{
				Student student = new Student();
				student.setSid(rs.getInt("sId"));
				student.setSname(rs.getString(2));
				student.setSemail(rs.getString(3));
				student.setSmobile(rs.getString(4));
				student.setSaddress(rs.getString(5));
				list.add(student);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public Boolean deleteById(Integer sid) {
		con=DbConnection.getConnection();
		try {
			pstmt=con.prepareStatement(DELETE_SQL);
			pstmt.setInt(1, sid);
			if(pstmt.executeUpdate()>0)
			return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	
	}

	@Override
	public Student studentById(Integer sid) {
		con=DbConnection.getConnection();
		Student student = new Student();
		try {
			pstmt=con.prepareStatement(STUDENT_SQL);
			pstmt.setInt(1, sid);
			ResultSet rs= pstmt.executeQuery();
			
			rs.next();
				student.setSid(rs.getInt("sId"));
				student.setSname(rs.getString(2));
				student.setSemail(rs.getString(3));
				student.setSmobile(rs.getString(4));
				student.setSaddress(rs.getString(5));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return student;
	}
			
}