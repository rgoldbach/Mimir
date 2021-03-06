package com.mimir.library.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
 
public abstract class AbstractDao {
     
    @Autowired //From HibernateConfiguration
    private SessionFactory sessionFactory;
 
    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }
 
    public void persist(Object entity) {
        getSession().persist(entity);
    }
     
    public void delete(Object entity) {
        getSession().delete(entity);
    }
    
    public void save(Object entity){
    	getSession().save(entity);
    }
    
    public void saveOrUpdate(Object entity){
    	getSession().saveOrUpdate(entity);
    }
    
    public void merge(Object entity){
    	getSession().merge(entity);
    }
}
