package com.example.banson5s.enums;

public enum DiscountType {

    GIAM_TRUC_TIEP("GIAM_TRUC_TIEP"),
    GIAM_PHAN_TRAM("GIAM_PHAN_TRAM");

    private final String label;

    DiscountType(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
