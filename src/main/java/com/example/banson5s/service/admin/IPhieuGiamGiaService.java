package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.nhanVien.NhanVienDTO;
import com.example.banson5s.dto.admin.voucher.VoucherDTO;
import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.service.common.IBaseService;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IPhieuGiamGiaService extends IBaseService<PhieuGiamGia,Long> {

    List<VoucherDTO> findAllVoucherSales(String sts, String search);

    List<VoucherDTO> findAllVoucher(String search);

    VoucherDTO createVoucher(VoucherDTO dto);

    VoucherDTO updateVoucher(VoucherDTO dto);

    VoucherDTO detailVoucher(Long id);
}
