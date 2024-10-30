package com.example.demo.service;  

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Company;
import com.example.demo.repository.CompanyRepository;
 
@Service
public class CompanyService {

      @Autowired
      CompanyRepository companyRepository;

    public Company save(Company company){
            return companyRepository.save(company);
        }

    public List<Company> findAll(){
        return companyRepository.findAll();
    }
    public void delete(Integer companyId){
         companyRepository.deleteById(companyId);
   }

   public List<Company> saveAll(List<Company> company){
    return companyRepository.saveAll(company);
  }

}