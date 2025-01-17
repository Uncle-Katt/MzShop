package com.example.banson5s.dto.admin.thongKe;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Builder
public class DoanhThuDTO {
    private Integer day;
    private Integer month;
    private Integer year;
    private Integer soLuongTon;
}
