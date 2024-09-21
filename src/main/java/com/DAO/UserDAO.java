package com.DAO;

import com.entity.User;

public interface UserDAO {

	public boolean userRegister(User us);

//	for checking the user is correct or not
	public User login(String email, String password);

	public boolean CheckPassword(String pass, int id);

	public boolean updateProfile(User us);

	public boolean checkUser(String email);
	
	public boolean updatePassword(User us);
	
	public boolean forgotPassword(String email, String phno);
	
	public boolean deactivateAccount(int id);
}
