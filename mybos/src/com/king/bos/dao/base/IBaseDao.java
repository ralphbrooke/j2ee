package com.king.bos.dao.base;

import java.io.Serializable;
import java.util.List;

public interface IBaseDao<T> {
	/**
	 * @author lambert
	 * @param <T>
	 */
	public void save(T entity);
	public void delete(T entity);
	public void update(T entity);
	public T findById(Serializable id);
	public List<T> findAll();
	//提供通用修改方法
	public void executeUpdate(String queryName,Object ...objects);
}
