package com.example.banson5s.service.admin.Impl;


import com.example.banson5s.dto.admin.order.OrderBillDTO;
import com.example.banson5s.dto.admin.order.OrderBillListDTO;
import com.example.banson5s.dto.admin.order.OrderChangeStatusDTO;
import com.example.banson5s.dto.admin.order.OrderConfirmPaymentDTO;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.LichSuHoaDon;
import com.example.banson5s.entity.admin.LichSuThanhToan;
import com.example.banson5s.enums.InvoiceStatus;
import com.example.banson5s.service.admin.IHoaDonService;
import com.example.banson5s.service.admin.ILichSuHoaDonService;
import com.example.banson5s.service.admin.ILichSuThanhToanService;
import com.example.banson5s.service.admin.IOrderService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private IHoaDonService hoaDonService;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private ILichSuHoaDonService lichSuHoaDonService;

    @Autowired
    private ILichSuThanhToanService lichSuThanhToanService;

    @Override
    public OrderBillDTO getHoaDonByCode(String code) {
        HoaDon hoaDon = hoaDonService.findHoaDonByCode(code);
        OrderBillDTO result = modelMapper.map(hoaDon, OrderBillDTO.class);
        return result;
    }

    @Override
    public List<OrderBillListDTO> findAllLstHoaDonByCodeAndStsAndType(String value, String type, String sts) {
        List<HoaDon> lst = hoaDonService.findAllLstHoaDonByCodeAndStsAndType(value, type, sts);
        List<OrderBillListDTO> result = lst.stream().map(item -> modelMapper.map(item, OrderBillListDTO.class) ).toList();
        return result;
    }

    @Override
    public void changeStatusOrder(OrderChangeStatusDTO dto){
        HoaDon hoaDon = hoaDonService.findHoaDonByCode(dto.getCodeBill());
        hoaDon.setTrangThai(dto.getStatus());
        LichSuHoaDon lichSuHoaDon = LichSuHoaDon.builder().hoaDon(hoaDon).loai(dto.getStatus()).moTa(dto.getMessenger()).build();
        hoaDonService.update(hoaDon);
        lichSuHoaDonService.createNew(lichSuHoaDon);
    }

    @Override
    public void confirmPaymentOrder(OrderConfirmPaymentDTO dto) {
        HoaDon hoaDon = hoaDonService.findHoaDonByCode(dto.getCodeBill());
        LichSuThanhToan lichSuThanhToan = LichSuThanhToan.builder()
                .hoaDon(hoaDon).loaiThanhToan(dto.getType())
                .moTa(dto.getDescription())
                .soTienThanhToan(hoaDon.getThanhTien())
                .build();
        LichSuHoaDon lichSuHoaDon = LichSuHoaDon.builder().hoaDon(hoaDon).loai(InvoiceStatus.DA_THANH_TOAN.getLabel()).build();
        lichSuHoaDonService.createNew(lichSuHoaDon);
        lichSuThanhToanService.createNew(lichSuThanhToan);
    }
}
