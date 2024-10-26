package com.example.banson5s.entity.admin;

import java.math.BigDecimal;

public interface IInvoiceItem {
    String getId();
    String getTenSanPham();
    Integer getSoLuong();
    BigDecimal getGiaBan();
    BigDecimal getTongTien();

}
