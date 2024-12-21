package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.order.OrderBillDTO;

public interface IOrderService {
    OrderBillDTO getHoaDonByCode(String code);
}
