package com.example.banson5s.enums;

public enum Status {
    HOAT_DONG("HOAT_DONG"),
    NGUNG_HOAT_DONG("NGUNG_HOAT_DONG");

    private final String label;

    Status(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
