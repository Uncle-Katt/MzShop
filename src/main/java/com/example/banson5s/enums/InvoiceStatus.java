package com.example.banson5s.enums;

public enum InvoiceStatus {

    NEW("NEW"),
    DA_XAC_NHAN("1");

    private final String label;

    InvoiceStatus(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
