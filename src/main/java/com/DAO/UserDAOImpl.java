package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		boolean f = false;
		try {
			String sql = "insert into user(firstName,email,phno,password,photo,lastName) values(?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getFirstName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			ps.setString(5, us.getPhoto());
			ps.setString(6, us.getLastName());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public User login(String email, String password) {
		User us = null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setFirstName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setPhoto(rs.getString(6));
				us.setLastName(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean CheckPassword(String pass, int id) {
		boolean f = false;
		try {
			String sql = " select * from user where password=? and id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pass);
			ps.setInt(2, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User us) {
		boolean f = false;

		try {
			String sql = "update user set firstName=?, email=?, phno=?,lastName=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getFirstName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getLastName());
			ps.setInt(5, us.getId());
			

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkUser(String email) {
		boolean f = true;

		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = false;
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updatePassword(User us) {
		boolean f = false;

		try {
			String sql = "update user set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getPassword());
			ps.setInt(2, us.getId());
			int i = ps.executeUpdate();
			if (i == 1) {

				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean forgotPassword(String email, String phno) {
		boolean f = false;

		try {
			String sql = "select * from user where email=? and phno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, phno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deactivateAccount(int id) {
		boolean f = false;

		try {
			String sql = "delete from user where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
