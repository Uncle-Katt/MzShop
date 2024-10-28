package com.example.banson5s.enums;

public enum Gender {
    Female("Nữ"),
    Male("Nam"),
    Others("Khác");
    private final String label;

    Gender(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
