package com.example.banson5s.dto.admin.sales;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Setter
@Getter
public class PaymentInvoiceDTO {
    private Long billId;
    private BigDecimal totalMoney;
    private BigDecimal totalAmount;
    private BigDecimal shipMoney;
    private BigDecimal voucherMoney;
}
