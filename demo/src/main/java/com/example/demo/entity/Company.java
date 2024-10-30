package com.example.demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Company {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer companytryId;
    private String avatar;
    private String name;
    private String status;
    private String dueDate;
    private Integer targetAchivement;
    public Integer getCompanytryId() {
        return companytryId;
    }
    public void setCompanytryId(Integer companytryId) {
        this.companytryId = companytryId;
    }
    public String getAvatar() {
        return avatar;
    }
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getDueDate() {
        return dueDate;
    }
    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }
    public Integer getTargetAchivement() {
        return targetAchivement;
    }
    public void setTargetAchivement(Integer targetAchivement) {
        this.targetAchivement = targetAchivement;
    }
}