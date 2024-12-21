package com.example.banson5s.service.admin.Impl;


import com.example.banson5s.dto.admin.order.OrderBillDTO;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.service.admin.IHoaDonService;
import com.example.banson5s.service.admin.IOrderService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private IHoaDonService hoaDonService;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public OrderBillDTO getHoaDonByCode(String code) {
        HoaDon hoaDon = hoaDonService.findHoaDonByCode(code);
        OrderBillDTO result =  modelMapper.map(hoaDon, OrderBillDTO.class);
        return result;
    }
}
