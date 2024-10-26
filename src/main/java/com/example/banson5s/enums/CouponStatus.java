package com.example.banson5s.enums;

public enum CouponStatus {

    DANG_DIEN_RA("DANG_DIEN_RA");

    private final String label;

    CouponStatus(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
