package com.springboot.pureajax.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class AppUserDAOImpl implements AppUserDAO{
    
    private static final List<AppUser> appUsers = new ArrayList<>();
    
    static int id = 4;
    
    static { 
       
        appUsers.add(new AppUser(1, "AppUser1", 14));
        appUsers.add(new AppUser(2, "AppUser2", 24));
        appUsers.add(new AppUser(3, "AppUser3", 34));
        appUsers.add(new AppUser(4, "AppUser4", 45));
    }
    
    @Override
    public  void insert(AppUser p) {
        p.setId(++id);
        appUsers.add(p);
    }
    
    @Override
    public  void remove(int id) {
//        myData.removeIf(p -> p.getId() == id);
            appUsers.stream()
                .filter(p -> p.getId()==id)
                .findFirst()
                .map(p -> appUsers.remove(p));
//                .collect(Collectors.toList());
    }
    
    @Override
    public void update(AppUser person) {
        appUsers.stream()
            .filter(p -> p.getId() == person.getId())
            .findFirst()
            .map(newP -> {
                newP.setName(person.getName());
                newP.setAge(person.getAge());
                return newP;
            });
       
    }
    
    @Override
    public  List<AppUser> getAllAppUser(){
        return appUsers;
    }
}
