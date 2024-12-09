package com.example.banson5s.enums;

public enum BillType {

    ONLINE("ONLINE"),
    OFFLINE("OFFLINE"),
    DELIVERY("DELIVERY");

    private final String label;

    BillType(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
