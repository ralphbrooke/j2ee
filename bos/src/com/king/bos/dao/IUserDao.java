package com.king.bos.dao;

import com.king.bos.dao.base.IBaseDao;
import com.king.bos.domain.User;

public interface IUserDao extends IBaseDao<User>{
	
	public User findByUsernameAndPassword(String username, String password);
	
}
