package org.migration;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MigrationData {
    @JsonProperty("first_name")
    private String first_name;
    
    @JsonProperty("last_name")
    private String last_name;
    
    @JsonProperty("age")
    private int age;
    
    @JsonProperty("from_country")
    private String from_country;
    
    @JsonProperty("from_region")
    private String from_region;
    
    @JsonProperty("from_city")
    private String from_city;
    
    @JsonProperty("to_country")
    private String to_country;
    
    @JsonProperty("to_region")
    private String to_region;
    
    @JsonProperty("to_city")
    private String to_city;
    
    @JsonProperty("date")
    private String date;
    
    @JsonProperty("reason")
    private String reason;
    
    @JsonProperty("gender")
    private String gender;
    
    @JsonProperty("education")
    private String education;
    
    @JsonProperty("profession")
    private String profession;
    
    @JsonProperty("family_status")
    private String family_status;
    
    @JsonProperty("duration")
    private Integer duration;
    
    @JsonProperty("migration_type")
    private String migration_type;

    public String getFirstName() {
        return first_name;
    }

    public String getLastName() {
        return last_name;
    }

    public int getAge() {
        return age;
    }

    public String getFromCountry() {
        return from_country;
    }

    public String getFromRegion() {
        return from_region;
    }

    public String getFromCity() {
        return from_city;
    }

    public String getToCountry() {
        return to_country;
    }

    public String getToRegion() {
        return to_region;
    }

    public String getToCity() {
        return to_city;
    }

    public String getDate() {
        return date;
    }

    public String getReason() {
        return reason;
    }

    public String getGender() {
        return gender;
    }

    public String getEducation() {
        return education;
    }

    public String getProfession() {
        return profession;
    }

    public String getFamilyStatus() {
        return family_status;
    }

    public Integer getDuration() {
        return duration;
    }

    public String getMigrationType() {
        return migration_type;
    }
} 