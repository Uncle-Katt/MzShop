package com.example.banson5s.enums;

public enum Gender {
    Female("female","Nữ"),
    Male("male", "Nam"),
    Others("","Khác");
    private final String label;
    private final String value;

    Gender( String value, String label) {
        this.label = label;
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public String getValue() {
        return value;
    }
}
