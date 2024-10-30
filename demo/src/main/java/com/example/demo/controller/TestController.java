package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class TestController {

    @RequestMapping("/getData") 
    @CrossOrigin(origins = "*")
    public  HashMap<String,Object> getData(){
        
        HashMap<String,Object>  data = new HashMap<String,Object> ();
        data.put("firstName","waranyu");
        data.put("lastName","thammason"); 
        data.put("id","64143152");
        return data;
    }
}


