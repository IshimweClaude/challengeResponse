/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Bienvenue
 */
public class GenericDao<C>{
    private Class<C> type;

    public GenericDao(Class<C> type) {
        this.type = type;
    }
    Session ss = null;
    public void save(C obj){
       ss = HibernateUtil.getSessionFactory().openSession();
       ss.beginTransaction();
       ss.saveOrUpdate(obj);
       ss.getTransaction().commit();
       ss.close();
    }
      public void update(C obj){
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.beginTransaction();
        ss.update(obj);
        ss.getTransaction().commit();
        ss.close();
    }
    public void delete(C obj){
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.beginTransaction();
        ss.delete(obj);
        ss.getTransaction().commit();
        ss.close();
    }
    public C findById(String id){
        ss = HibernateUtil.getSessionFactory().openSession();
        C obj = (C) ss.get(type, id);
        ss.close();
        return obj;
    }
    public List<C> findAll(){
        ss = HibernateUtil.getSessionFactory().openSession();
        List<C> obj = ss.createCriteria(type.getName()).list();
        ss.close();
        return obj;
    }
    
    
}

    
    
    

