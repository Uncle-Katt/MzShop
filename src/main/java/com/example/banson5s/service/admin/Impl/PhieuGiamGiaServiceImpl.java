package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.nhanVien.NhanVienDTO;
import com.example.banson5s.dto.admin.sanPham.MauSacDTO;
import com.example.banson5s.dto.admin.voucher.VoucherDTO;
import com.example.banson5s.entity.admin.MauSac;
import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.enums.CouponStatus;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.repository.admin.IPhieuGiamGiaRepository;
import com.example.banson5s.service.admin.IPhieuGiamGiaService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class PhieuGiamGiaServiceImpl extends BaseServiceImpl<PhieuGiamGia, Long, IPhieuGiamGiaRepository>
        implements IPhieuGiamGiaService {

    @Autowired
    ModelMapper modelMapper;

    @Override
    public List<VoucherDTO> findAllVoucherSales(String sts,String search) {
        // Định dạng chuỗi đầu ra
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        // Lấy danh sách các phiếu giảm giá từ repository
        List<VoucherDTO> list = repository.findAllVoucherSales(sts,search).stream().map(item -> {

            VoucherDTO dto = modelMapper.map(item, VoucherDTO.class);
            // Nếu item.getNgayBatDau() là LocalDateTime, bạn chỉ cần định dạng lại nó
            String formattedDate = item.getNgayBatDau().format(outputFormatter);
            String formattedDateEnd = item.getNgayKetThuc().format(outputFormatter);

            // Set giá trị đã định dạng vào item nếu cần thiết
            dto.setNgayBatDau(formattedDate);
            dto.setNgayKetThuc(formattedDateEnd);
            return dto; // Trả về item đã được cập nhật
        }).toList();

        return list; // Trả về danh sách đã xử lý
    }

    @Override
    public List<VoucherDTO> findAllVoucher(String search) {
        // Định dạng chuỗi đầu ra
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        // Lấy danh sách các phiếu giảm giá từ repository
        List<VoucherDTO> list = repository.findAllVoucher(search).stream().map(item -> {

            VoucherDTO dto = modelMapper.map(item, VoucherDTO.class);
            // Nếu item.getNgayBatDau() là LocalDateTime, bạn chỉ cần định dạng lại nó
            String formattedDate = item.getNgayBatDau().format(outputFormatter);
            String formattedDateEnd = item.getNgayKetThuc().format(outputFormatter);

            // Set giá trị đã định dạng vào item nếu cần thiết
            dto.setNgayBatDau(formattedDate);
            dto.setNgayKetThuc(formattedDateEnd);
            return dto; // Trả về item đã được cập nhật
        }).toList();

        return list; // Trả về danh sách đã xử lý
    }

    @Override
    public VoucherDTO createVoucher(VoucherDTO voucherDTO) {
        PhieuGiamGia entity = modelMapper.map(voucherDTO, PhieuGiamGia.class);
        LocalDateTime strDate = LocalDateTime.parse(voucherDTO.getNgayBatDau());
        LocalDateTime endDate = LocalDateTime.parse(voucherDTO.getNgayKetThuc());
        entity.setNgayBatDau(strDate);
        entity.setNgayKetThuc(endDate);
        entity.setTrangThai(CouponStatus.SAP_DIEN_RA.getLabel());

        createNew(entity);
        return modelMapper.map(entity, VoucherDTO.class);
    }

    @Override
    public VoucherDTO updateVoucher(VoucherDTO dto) {
        PhieuGiamGia entity = findById(dto.getId()).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        modelMapper.map(dto, entity);
        LocalDateTime strDate = LocalDateTime.parse(dto.getNgayBatDau());
        LocalDateTime endDate = LocalDateTime.parse(dto.getNgayKetThuc());
        entity.setNgayBatDau(strDate);
        entity.setNgayKetThuc(endDate);
        update(entity);
        return dto;
    }

    @Override
    public VoucherDTO detailVoucher(Long id) {
        PhieuGiamGia entity = findById(id).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        VoucherDTO data = modelMapper.map(entity, VoucherDTO.class);
        return data;
    }
}
