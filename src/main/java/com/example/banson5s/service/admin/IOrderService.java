package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.order.OrderBillDTO;
import com.example.banson5s.dto.admin.order.OrderBillListDTO;
import com.example.banson5s.dto.admin.order.OrderChangeStatusDTO;
import com.example.banson5s.dto.admin.order.OrderConfirmPaymentDTO;

import java.util.List;

public interface IOrderService {
    OrderBillDTO getHoaDonByCode(String code);

    List<OrderBillListDTO> findAllLstHoaDonByCodeAndStsAndType(String value, String type, String sts);

    void changeStatusOrder(OrderChangeStatusDTO dto);

    void confirmPaymentOrder(OrderConfirmPaymentDTO dto);
}
