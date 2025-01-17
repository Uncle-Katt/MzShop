package com.example.banson5s.controller.admin.voucher;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.nhanVien.NhanVienDTO;
import com.example.banson5s.dto.admin.sanPham.ThuongHieuDTO;
import com.example.banson5s.dto.admin.voucher.VoucherDTO;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.enums.CouponStatus;
import com.example.banson5s.enums.Gender;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.service.admin.IPhieuGiamGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/voucher")
public class VoucherController {
    @Autowired
    IPhieuGiamGiaService phieuGiamGiaService;

    @GetMapping()
    public String index(Model model) {
        model.addAttribute("page", "voucher/index");
        return "admin/main";
    }

    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getVoucher(@RequestParam String search) {
        List<VoucherDTO> lst = phieuGiamGiaService.findAllVoucher(search);
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }

    @PutMapping("/delete")
    @ResponseBody
    public ResponseEntity<?> delete(@RequestBody Long id) {
        PhieuGiamGia entity = phieuGiamGiaService.findById(id).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        entity.setTrangThai(CouponStatus.DA_HUY.getLabel());
        phieuGiamGiaService.update(entity);
        return new ResponseEntity<>(ResponseObject.builder().data(id).build(), HttpStatus.OK);
    }

    @GetMapping("/create")
    public String formCreate(Model model) {
        model.addAttribute("voucher", new VoucherDTO());
        model.addAttribute("btnText", "Thêm Giảm Giá");
        model.addAttribute("action", "/admin/voucher/create");
        model.addAttribute("page", "voucher/form");
        return "admin/main";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute VoucherDTO dto) {
        phieuGiamGiaService.createVoucher(dto);
        return "redirect:/admin/voucher";
    }

    // Hiển thị form cập nhật thương hiệu
    @GetMapping("/update/{id}")
    public String formUpdate(@PathVariable Long id, Model model) {
        VoucherDTO voucherDTO = phieuGiamGiaService.detailVoucher(id);
        if (voucherDTO == null) {
            return "redirect:/admin/voucher";
        }
        model.addAttribute("voucher", voucherDTO);
        model.addAttribute("action", "/admin/voucher/update");
        model.addAttribute("btnText","Cập Nhật");
        model.addAttribute("page", "voucher/form");
        return "admin/main";
    }

    // Xử lý cập nhật thương hiệu
    @PostMapping("/update")
    public String update(@ModelAttribute VoucherDTO req) {
        phieuGiamGiaService.updateVoucher(req);
        return "redirect:/admin/voucher"; // Điều hướng lại trang danh sách
    }

    // Chi tiết thương hiệu
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        VoucherDTO voucher = phieuGiamGiaService.detailVoucher(id);
        if (voucher == null) {
            return "redirect:/admin/voucher";
        }
        model.addAttribute("voucher", voucher);
        model.addAttribute("page", "voucher/detail");
        return "admin/main";
    }



}
