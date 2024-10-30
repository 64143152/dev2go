package com.example.demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Country {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer countryId;
    private String name;
    public Integer getCountryId() {
        return countryId;
    }
    public void setCountryId(Integer countryId) {
        this.countryId = countryId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public double getArea() {
        return area;
    }
    public void setArea(double area) {
        this.area = area;
    }
    public Integer getPopulation() {
        return population;
    }
    public void setPopulation(Integer population) {
        this.population = population;
    }
    private double area;
    private Integer population;
    private String flag;
    public String getFlag() {
        return flag;
    }
    
    public void setFlag(String flag) {
        this.flag = flag;
    }
    
}