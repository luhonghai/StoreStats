package com.stat.store.dao;


import com.stat.store.exception.DAOException;

import java.util.Collection;

/**
 * Created by longnguyen on 2/3/15.
 */
public interface IDAO<T, V> {

    public Collection<T> findAll();

    public T findOne(V keyValue);

    public T save(T object) throws DAOException;

    public T update(T object) throws DAOException;

    public void delete(T object) throws DAOException;

    public void deleteById(V objectId) throws DAOException;

}
