package com.example.banson5s.enums;

public enum CouponStatus {

    SAP_DIEN_RA("SAP_DIEN_RA"),
    DANG_DIEN_RA("DANG_DIEN_RA"),
    DA_KET_THUC("DA_KET_THUC"),
    SAP_KET_THUC("SAP_KET_THUC"),
    DA_HUY("DA_HUY");

    private final String label;

    CouponStatus(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
