package com.migration.processor.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MigrationData {
    @JsonProperty("from_country")
    private String fromCountry;
    
    @JsonProperty("to_country")
    private String toCountry;
    
    @JsonProperty("year")
    private int year;
    
    @JsonProperty("count")
    private int count;
    
    @JsonProperty("reason")
    private String reason;
    
    @JsonProperty("age_group")
    private String ageGroup;
    
    @JsonProperty("gender")
    private String gender;

    // Getters and Setters
    public String getFromCountry() {
        return fromCountry;
    }

    public void setFromCountry(String fromCountry) {
        this.fromCountry = fromCountry;
    }

    public String getToCountry() {
        return toCountry;
    }

    public void setToCountry(String toCountry) {
        this.toCountry = toCountry;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getAgeGroup() {
        return ageGroup;
    }

    public void setAgeGroup(String ageGroup) {
        this.ageGroup = ageGroup;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
} 