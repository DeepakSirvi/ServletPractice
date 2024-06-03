 package com.dollop.adda.controller;

import java.io.IOException;
import java.util.List;

import com.dollop.adda.bean.Student;
import com.dollop.adda.dao.StudentDAOInterface;
import com.dollop.adda.dao.impl.StudentDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentControler
 */

public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDAOInterface sdo = new StudentDaoImpl();
	List<Student> viewAllStudents=null;
	Student student=null;
	RequestDispatcher rd=null;
	/**
	 * Default constructor.
	 */
	public StudentController() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String action=request.getParameter("action");
		switch(action) {
		case "ADDSTUDENT":
			student=new Student();
			//if(!request.getParameter("check").equals("ADD"))
			if(request.getParameter("id")!=null)
			{
				student.setSid(Integer.parseInt(request.getParameter("id")));
			}
			student.setSname(request.getParameter("sname"));
			student.setSemail(request.getParameter("semail"));
			student.setSmobile(request.getParameter("smobile"));
			student.setSaddress(request.getParameter("saddress"));
			if(sdo.save(student))
			{
				System.out.println("ADD 1");
			}
			else
			{
				System.out.println("Cann't help it out");
			}
			viewAllStudents = sdo.viewAllStudents();
			request.setAttribute("viewAllStudent", viewAllStudents);
			rd=request.getRequestDispatcher("./viewstudent.jsp");
			rd.forward(request, response);
			break;
		case "VIEWSTUDENTS":
			viewAllStudents = sdo.viewAllStudents();
			request.setAttribute("viewAllStudent", viewAllStudents);
			rd=request.getRequestDispatcher("./viewstudent.jsp");
			rd.forward(request, response);
			break;
		case "DELETESTUDENT":
			sdo.deleteById(Integer.parseInt(request.getParameter("id")));
			viewAllStudents = sdo.viewAllStudents();
			request.setAttribute("viewAllStudent", viewAllStudents);
			rd=request.getRequestDispatcher("./viewstudent.jsp");
			rd.forward(request, response);
			break;
		case "EDITSTUDENT":
			System.out.println(Integer.parseInt(request.getParameter("id")));
			Student studentById = sdo.studentById(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("studentById", studentById);
			rd=request.getRequestDispatcher("./edit.jsp");
			rd.forward(request, response);
			
//			sstudent.setSid(Integer.parseInt(request.getParameter("id")));
//			student.setSname(request.getParameter("sname"));
//			student.setSemail(request.getParameter("semail"));
//			student.setSmobile(request.getParameter("smobile"));
//			student.setSaddress(request.getParameter("saddress"));
//			if(sdo.save(student))
//			{
//				System.out.println("Updated");
//			}
//			else
//			{
//				System.out.println("Cann't help it out");
//			}
//			viewAllStudents = sdo.viewAllStudents();
//			request.setAttribute("viewAllStudent", viewAllStudents);
//			rd=request.getRequestDispatcher("./viewstudent.jsp");
//			rd.forward(request, response);
//			break;
		default :
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
