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

import com.example.demo.entity.Company;
import com.example.demo.service.CompanyService;

@RestController
@RequestMapping("/api/company/")
public class CompanyController {
     
    @Autowired
    CompanyService companyService;

    @RequestMapping("/findAll") 
    @CrossOrigin(origins = "*")
    public  List<Company> findAll(){ 
        return companyService.findAll();
    }
 
    @PostMapping("/save") 
    @CrossOrigin(origins = "*")
    public  Company save(@RequestBody Company company){ 
        return companyService.save(company);
    }

    @GetMapping("/delete") 
    @CrossOrigin(origins = "*")
    public  void delete(Integer companytryId){ 
         companyService.delete(companytryId);
    }

    @RequestMapping("/init") 
    @CrossOrigin(origins = "*")
    public  void initData(){ 
        List<Company> companyList = new ArrayList<Company>();

        Company company  = new Company();
        company.setName("BokBok Company");
        company.setAvatar("*");
        company.setCompanytryId(001);
        company.setDueDate("01/08/2002");
        company.setTargetAchivement(5000000);
        company.setStatus("Close");

        companyList.add(company);

        Company company2  = new Company();
        company2.setName("Chikk Company");
        company2.setAvatar("*");
        company2.setCompanytryId(002);
        company2.setDueDate("03/10/2005");
        company2.setTargetAchivement(90000000);
        company2.setStatus("Open");

        companyList.add(company2);

        companyService.saveAll(companyList);
    }
}