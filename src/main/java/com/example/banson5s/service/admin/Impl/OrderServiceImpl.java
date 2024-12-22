package com.example.banson5s.service.admin.Impl;


import com.example.banson5s.dto.admin.order.OrderBillDTO;
import com.example.banson5s.dto.admin.order.OrderBillListDTO;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.service.admin.IHoaDonService;
import com.example.banson5s.service.admin.IOrderService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<OrderBillListDTO> findAllLstHoaDonByCodeAndStsAndType(String value, String type, String sts) {
        List<HoaDon> lst = hoaDonService.findAllLstHoaDonByCodeAndStsAndType(value, type, sts);
        List<OrderBillListDTO> result = lst.stream().map(item -> modelMapper.map(item, OrderBillListDTO.class) ).toList();
        return result;
    }
}
