package com.dollop.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dollop.dao.ContactInterfaceDAO;
import com.dollop.dao.ContactInterfaceDAOImpl;
import com.dollop.dao.UserInterfaceDAO;
import com.dollop.dao.UserInterfaceDAOImpl;
import com.dollop.model.Contact;
import com.dollop.model.User;

/**
 * Servlet implementation class ContactServlet
 */
public class ContactServlet extends HttpServlet {
	RequestDispatcher dispatcher = null;
	ContactInterfaceDAO contactDAO = null;
	UserInterfaceDAO userDAO = null;
	HttpSession session = null;
	User user= null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactServlet() {
		super();
		contactDAO = new ContactInterfaceDAOImpl();
		userDAO = new UserInterfaceDAOImpl();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession(true);
		String action = request.getParameter("action");
		System.out.println(action);
		if (action == null) {
			action = "LIST";
		}

		switch (action) {

		case "ADD":
			createContact(request, response);
			break;

		case "LIST":
			listContact(request, response);
			break;

		case "EDIT":
			getSingleContact(request, response);
			break;

		case "DELETE":
			//deleteContact(request, response);
			deleteMulti(request,response);
			break;

		case "USERADD":
			userAdd(request, response);
			break;

		case "LOGIN":
			userLogin(request, response);
			break;
			
		case "LOGOUT":
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/views/login_form.jsp");
			break;
			
		case "CNGPASS":
			changePass(request,response);
			break;
			
		case "USERUPDATE":
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/views/update_user.jsp");
			break;
			
		case "SEARCH":
			searchContact(request,response);
			break;
			
		case "ORDER":
			sortInOrder(request,response);
			break;
			
		default:
			listContact(request, response);
			break;
		}
	}

	private void sortInOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String order = request.getParameter("ordername");
		String sortBy = request.getParameter("by");
		System.out.println(order+" "+sortBy);
		List<Contact> list = contactDAO.sortByOrder(order,sortBy,user.getUid());
		System.out.println(list);
		request.setAttribute("list", list);
//		response.sendRedirect(request.getContextPath()+"/views/contact_list.jsp");
		dispatcher = request.getRequestDispatcher("/views/contact_list.jsp");
		dispatcher.forward(request, response);
	}

	private void searchContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pattern = request.getParameter("search");
		System.out.println(pattern+" "+user.getUid());
		if(user!=null)
		{
			List<Contact> theList = contactDAO.searchContactByPattern(pattern , user.getUid());
			System.out.println(theList);
			request.setAttribute("list", theList);
//			response.sendRedirect(request.getContextPath()+"/views/contact_list.jsp");
			dispatcher = request.getRequestDispatcher("/views/contact_list.jsp");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("NOTIFICATION", "Please Login....");
			dispatcher = request.getRequestDispatcher("/views/login_form.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void deleteMulti(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String subject[] = request.getParameterValues("check");
		if(subject!=null)
		{
			int[] ids = new int[subject.length];
			if (subject != null) {
				for (int i = 0; i < subject.length; i++) {
				ids[i] = Integer.parseInt(subject[i]);
				}
			}
			if(contactDAO.deleteMultiple(ids))
			{
				request.setAttribute("NOTIFICATION", "Contact Deleted Successfully!");
//				response.sendRedirect(request.getContextPath()+"/views/contact_list.jsp");
				dispatcher = request.getRequestDispatcher("/views/contact_list.jsp");
				listContact(request, response);
			}
		}else {
			request.setAttribute("NOTIFICATION", "Something went wrong!!!");
//			response.sendRedirect(request.getContextPath()+"/views/contact_list.jsp");
			dispatcher = request.getRequestDispatcher("/views/contact_list.jsp");
			listContact(request, response);
		}
	}

	private void changePass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String pass1 = request.getParameter("password1");
		String pass2 = request.getParameter("password2");
		if(pass1.equals(pass2))
		{
			if(userDAO.changePassword(id, pass2)) {
				request.setAttribute("NOTIFICATION", "Password changed successfully!!!!");
				session.invalidate();
				response.sendRedirect(request.getContextPath()+"/views/login_form.jsp");
			}
			
		}else {
			request.setAttribute("NOTIFICATION", "Password Does'nt Match....Please try again!!!!");
			dispatcher = request.getRequestDispatcher("/views/password.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void userLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		user = new User(request.getParameter("username"), request.getParameter("password"));
		
		user = userDAO.loginUser(user);
		session.setAttribute("user",user);
		if(user!=null)
		{		
				request.setAttribute("NOTIFICATION", "User Login Success....");
				dispatcher = request.getRequestDispatcher("/views/Profile.jsp");
//				session.setAttribute("successMsg", "User Login Success....");
//				response.sendRedirect(request.getContextPath()+"/views/profile_page.jsp");
		}else {
			request.setAttribute("NOTIFICATION", "Username And Password Invalid!!!!!");
			dispatcher = request.getRequestDispatcher("/views/login_form.jsp");
		}
		dispatcher.forward(request, response);
	}

	private void userAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		User user = new User();
		user.setName(request.getParameter("username"));
		user.setEmail(request.getParameter("useremail"));
		user.setAddress(request.getParameter("useraddress"));
		user.setPassword(request.getParameter("password"));
		if(id.isEmpty()||id==null)
		{
			user.setImage("user1.jpg");
			if(userDAO.createUser(user))
			{
				request.setAttribute("NOTIFICATION", "User Saved Successfully!");
				dispatcher = request.getRequestDispatcher("/views/login_form.jsp");
//				response.sendRedirect(request.getContextPath()+"/views/signup_form.jsp");
				dispatcher.forward(request, response);
			}else {
				request.setAttribute("NOTIFICATION", "Something went wrong!!!");
//				response.sendRedirect(request.getContextPath()+"/views/signup_form.jsp");
				dispatcher = request.getRequestDispatcher("/views/signup_form.jsp");
				dispatcher.forward(request, response);
			}
		}else {
			user.setUid(Integer.parseInt(id));
			user.setImage(request.getParameter("image"));
			if(userDAO.updateUser(user))
			{
				request.setAttribute("NOTIFICATION", "User Update Successfully!");
				dispatcher = request.getRequestDispatcher("/views/Profile.jsp");
//				response.sendRedirect(request.getContextPath()+"/views/signup_form.jsp");
				dispatcher.forward(request, response);
			}else {
				request.setAttribute("NOTIFICATION", "Something went wrong!!!!");
				dispatcher = request.getRequestDispatcher("/views/update_user.jsp");
//				response.sendRedirect(request.getContextPath()+"/views/signup_form.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	private void deleteContact(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if (contactDAO.deleteContact(Integer.parseInt(id))) {
			request.setAttribute("NOTIFICATION", "Contact Deleted Successfully!");
//			response.sendRedirect(request.getContextPath()+"/views/contact_list.jsp");
			dispatcher = request.getRequestDispatcher("/views/contact_list.jsp");
			listContact(request, response);
		}
	}

	private void getSingleContact(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		Contact theContact = contactDAO.viewContactById(id);
		System.out.println(theContact);
		request.setAttribute("contact", theContact);
//		response.sendRedirect(request.getContextPath()+"/views/contact_form.jsp");
		dispatcher = request.getRequestDispatcher("/views/contact_form.jsp");
		dispatcher.forward(request, response);
	}

	private void listContact(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(user!=null)
		{
			List<Contact> theList = contactDAO.viewAllContact(user.getUid());
			System.out.println(theList);
			request.setAttribute("list", theList);
//			response.sendRedirect(request.getContextPath()+"/views/contact_list.jsp");
			dispatcher = request.getRequestDispatcher("/views/contact_list.jsp");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("NOTIFICATION", "Please Login....");
			dispatcher = request.getRequestDispatcher("/views/login_form.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void createContact(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId = user.getUid();
		String id = request.getParameter("id");
		Contact contact = new Contact();
		contact.setName(request.getParameter("name"));
		contact.setEmail(request.getParameter("email"));
		contact.setPhone(new BigInteger(request.getParameter("phone")));
		contact.setuId(userId);
		System.out.println(contact);
		if(id.isEmpty()||id==null)
		{
			if(contactDAO.createContact(contact))
			{
				request.setAttribute("NOTIFICATION", "Contact Saved Successfully!");
	//			response.sendRedirect(request.getContextPath()+"/views/contact_list.jsp");
				dispatcher = request.getRequestDispatcher("/views/contact_list.jsp");
				listContact(request, response);
			}else {
				request.setAttribute("NOTIFICATION", "Contact Already Saved!!!!");
	//			response.sendRedirect(request.getContextPath()+"/views/contact_form.jsp");
				dispatcher = request.getRequestDispatcher("/views/contact_form.jsp");
				dispatcher.forward(request, response);
			}
		}
		else {
			contact.setId(Integer.parseInt(id));
			if(contactDAO.updateContact(contact))
			{
				request.setAttribute("NOTIFICATION", "Contact update Successfully!");
				//			response.sendRedirect(request.getContextPath()+"/views/contact_list.jsp");
				dispatcher = request.getRequestDispatcher("/views/contact_list.jsp");
				listContact(request, response);
			}else {
				request.setAttribute("NOTIFICATION", "Something went wrong!!!");
				System.out.println("error");
	//			response.sendRedirect(request.getContextPath()+"/views/contact_form.jsp");
				dispatcher = request.getRequestDispatcher("/views/contact_form.jsp");
				dispatcher.forward(request, response);
			}
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
