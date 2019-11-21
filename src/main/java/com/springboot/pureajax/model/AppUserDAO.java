package com.springboot.pureajax.model;

import java.util.List;


public interface AppUserDAO {
    public  void insert(AppUser p);
    public  List<AppUser> getAllAppUser();
    public  void update(AppUser appuser);
    public  void remove(int id);   
}
