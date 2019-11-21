/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springboot.pureajax.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.pureajax.model.AppUser;
import com.springboot.pureajax.model.AppUserDAOImpl;

@Controller
public class CRUDController {
    
    public static final String AppTitle = "Manage Users";
    
    @Autowired 
    AppUserDAOImpl dAOImpl;
    
    @RequestMapping(value = "/" , method = RequestMethod.GET)
    public String index(ModelMap map) {
        map.put("appusers", dAOImpl.getAllAppUser());
        map.put("AppTitle", AppTitle);
        return "index";
    }
   
//    ,headers = {"Accept=*"}
    @RequestMapping(value = "/addAppUser" , method = RequestMethod.POST)
    @ResponseBody
    public AppUser addAppUser(@RequestBody AppUser appuser) {
        if (appuser.getName().equals("")) {
            return null;
        }
        dAOImpl.insert(appuser);
        
        return appuser;
    }
//    ,produces = MediaType.APPLICATION_JSON_VALUE,consumes= MediaType.APPLICATION_JSON_VALUE
    @RequestMapping(value = "/updateAppUser" , method = RequestMethod.PUT)
    @ResponseBody
    public String updateAppUser(@RequestBody AppUser appuser) {
        dAOImpl.update(appuser);
        return "{\"status\":\"Success\"}";
    }
    
    @RequestMapping(value = "/deleteAppUser" , method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteAppUser(@RequestBody Map<String, String> id) {
        dAOImpl.remove(Integer.parseInt(id.get("id")));
    }
    
}
