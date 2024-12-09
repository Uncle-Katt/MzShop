package com.example.banson5s.enums;

public enum InvoiceStatus {

    NEW("NEW"),
    TAO_DON_HANG("TAO_DON_HANG"),
    TAT_CA(""),
    CHO_XAC_NHAN("CHO_XAC_NHAN"),
    DA_XAC_NHAN("DA_XAC_NHAN"),
    CHO_GIA0("CHO_GIA0"),
    DANG_GIAO("DANG_GIAO"),
    HOAN_THANH("HOAN_THANH"),
    HUY("HUY"),
    DA_THANH_TOAN("DA_THANH_TOAN"),
    CHO_THANH_TOAN("CHO_THANH_TOAN"),
    HOAN_TIEN("HOAN_TIEN"),
    TRA_HANG("TRA_HANG"),
    DANG_BAN("DANG_BAN");

    private final String label;

    InvoiceStatus(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
