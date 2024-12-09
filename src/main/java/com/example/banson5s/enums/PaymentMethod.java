package com.example.banson5s.enums;

public enum PaymentMethod {
    TIEN_MAT("TIEN_MAT"),
    CHUYEN_KHOAN("CHUYEN_KHOAN");

    private final String label;

    PaymentMethod(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
