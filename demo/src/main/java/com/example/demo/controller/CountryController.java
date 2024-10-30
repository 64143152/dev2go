package com.example.demo.controller;
 
import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Country;
import com.example.demo.service.CountryService;


@RestController
@RequestMapping("/api/country/")
public class CountryController {
     
    @Autowired
    CountryService countryService;

    

    @RequestMapping("/findAll") 
    @CrossOrigin(origins = "*")
    public  List<Country> findAll(){ 
        return countryService.findAll();
    }
 
    @PostMapping("/save") 
    @CrossOrigin(origins = "*")
    public  Country save(@RequestBody Country country){ 
        return countryService.save(country);
    }

    @GetMapping("/delete") 
    @CrossOrigin(origins = "*")
    public  void delete(Integer countryId){ 
         countryService.delete(countryId);
    }

    @RequestMapping("/init") 
    @CrossOrigin(origins = "*")
    public  void initData(){ 
        List<Country> countryList = new ArrayList<Country>();

        Country country  = new Country();
        country.setName("Russia");
        country.setArea(17075200);
        country.setPopulation(146989754);
        country.setFlag("https://upload.wikimedia.org/wikipedia/commons/f/f3/Flag_of_Russia.svg");

        countryList.add(country);

        Country country2  = new Country();
        country2.setName("Canada");
        country2.setArea(9976140);
        country2.setPopulation(36624199);
        country2.setFlag("https://upload.wikimedia.org/wikipedia/commons/c/cf/Flag_of_Canada.svg");

        countryList.add(country2);

        countryService.saveAll(countryList);

        
    }

    

    


}
    

    
