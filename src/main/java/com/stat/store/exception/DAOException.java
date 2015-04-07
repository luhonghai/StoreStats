package com.stat.store.exception;

/**
 * Created by longnguyen on 2/3/15.
 */
public class DAOException extends Exception {

    public DAOException(){
        this(null);
    }

    public DAOException(String message){
        this(message, null);
    }

    public DAOException(String message, Throwable cause){
        super(message, cause);
    }
}
