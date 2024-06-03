package com.dollop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dollop.model.Contact;
import com.dollop.util.DBConnection;

public class ContactInterfaceDAOImpl implements ContactInterfaceDAO {
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public boolean createContact(Contact contact) {
		con = DBConnection.getConnection();
		if(isPrsent(contact)){
			return false;
		}else {
			if (con != null) {
				String Insert_Qury = "INSERT INTO contact(name, email, phone , uid)VALUES"
						+ "('"+contact.getName()+"', '"+contact.getEmail()+"', '"+contact.getPhone()+"','"+contact.getuId()+"')";
				try {
					pst = con.prepareStatement(Insert_Qury);
					if (pst.executeUpdate() > 0)
						return true;
					return false;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}
		return false;	
	}

	private boolean isPrsent(Contact contact) {
		// TODO Auto-generated method stub
		List<Contact> list = viewAllContact(contact.getuId());
		for (Contact contact2 : list) {
			if((contact.getEmail()).equals(contact2.getEmail())||(contact.getPhone()).equals(contact2.getPhone())) {
				return true;
			}
		}
		return false;
	}

	public List<Contact> viewAllContact(Integer uid) {
		List<Contact> list = new ArrayList<>();
		Contact contact = null;
		con = DBConnection.getConnection();
		if (con != null) {
			String List_Qury = "select * from contact where uid="+uid;
			try {
				pst = con.prepareStatement(List_Qury);
				rs = pst.executeQuery();
				while (rs.next()) {
					contact = new Contact();
					contact.setId(rs.getInt("id"));
					contact.setName(rs.getString("name"));
					contact.setEmail(rs.getString("email"));
					contact.setPhone(rs.getBigDecimal("phone").toBigInteger());
					contact.setuId(rs.getInt("uid"));
					list.add(contact);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public Contact viewContactById(Integer id) {
		Contact contact = null;
		con = DBConnection.getConnection();
		if (con != null) {
			String List_Qury = "select * from contact where id="+id;
			try {
				pst = con.prepareStatement(List_Qury);
				rs = pst.executeQuery();
				if (rs.next()) {
					contact = new Contact();
					contact.setId(rs.getInt("id"));
					contact.setName(rs.getString("name"));
					contact.setEmail(rs.getString("email"));
					contact.setPhone(rs.getBigDecimal("phone").toBigInteger());
					contact.setuId(rs.getInt("uid"));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return contact;
	}

	public boolean deleteContact(Integer id) {
		con = DBConnection.getConnection();
		if (con != null) {
			String Delete_Qury = "delete from contact where id="+id;
			try {
				pst = con.prepareStatement(Delete_Qury);
				if (pst.executeUpdate() > 0)
					return true;
				return false;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean updateContact(Contact contact) {
		boolean flag = false;
		try {
			String Update_Qury = "UPDATE contact SET name = '"+contact.getName()+"', "+ "email = '"+contact.getEmail()+"', phone = '"+contact.getPhone()+"',"+" uid = '"+contact.getuId()+"' where id="+contact.getId();
			con = DBConnection.getConnection();
			pst = con.prepareStatement(Update_Qury);
			pst.executeUpdate();
			flag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteMultiple(int[] ids) {
		// TODO Auto-generated method stub
		con = DBConnection.getConnection();
		int num = 0;
		for(int i=0 ; i<ids.length ; i++)
		{
			if (con != null) {
				String Delete_Qury = "delete from contact where id="+ids[i];
				try {
					pst = con.prepareStatement(Delete_Qury);
					if (pst.executeUpdate() > 0)
						num++;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		if(num == 0)
			return false;
		return true;
	}

	@Override
	public List<Contact> searchContactByPattern(String pattern, Integer integer) {
		// TODO Auto-generated method stub
		Contact contact ;
		List<Contact> list = new ArrayList<>();
		con = DBConnection.getConnection();
		if(con!=null)
		{
			String searchQuery = "select * from contact where uid="+integer+" and name like '%"+pattern+"%' or id like '%"+pattern+"%' or email like '%"+pattern+"%' or phone like '%"+pattern+"%'";
			System.out.println(searchQuery);
			try {
				pst = con.prepareStatement(searchQuery);
				rs = pst.executeQuery();
				while(rs.next()) {
						if(integer.equals(rs.getInt("uid"))) {
							contact = new Contact();
							contact.setId(rs.getInt("id"));
							contact.setName(rs.getString("name"));
							contact.setEmail(rs.getString("email"));
							contact.setPhone(rs.getBigDecimal("phone").toBigInteger());
							contact.setuId(rs.getInt("uid"));
							list.add(contact);
						}
				}
				return list;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return null;
		
	}

	@Override
	public List<Contact> sortByOrder(String order, String sortBy, Integer uid) {
		// TODO Auto-generated method stub
		Contact contact ;
		List<Contact> list = new ArrayList<>();
		con = DBConnection.getConnection();
		
		if(con!=null)
		{
			
			try {
				
				String orderQuery  = "select * from contact where uid="+uid+" order by "+sortBy+" "+order;
					//System.out.println("hello");
				
				pst = con.prepareStatement(orderQuery);
				rs = pst.executeQuery();
				while(rs.next()) {
					contact = new Contact();
					contact.setId(rs.getInt("id"));
					contact.setName(rs.getString("name"));
					contact.setEmail(rs.getString("email"));
					contact.setPhone(rs.getBigDecimal("phone").toBigInteger());
					contact.setuId(rs.getInt("uid"));
					list.add(contact);
				}
				return list;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
