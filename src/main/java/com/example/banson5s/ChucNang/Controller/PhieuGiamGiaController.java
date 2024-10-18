package com.example.banson5s.ChucNang.Controller;

import com.example.banson5s.ChucNang.Entity.PhieuGiamGia;
import com.example.banson5s.ChucNang.Service.PhieuGiamGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/phieu-giam-gia")
public class PhieuGiamGiaController {

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, "ngayBatDau", new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(Date.class, "ngayKetThuc", new CustomDateEditor(dateFormat, true));
    }

    @Autowired
    private PhieuGiamGiaService phieuGiamGiaService;

    @GetMapping("/list")
    public String list(Model model) {
        List<PhieuGiamGia> listPhieuGiamGia = phieuGiamGiaService.layTatCa();
        model.addAttribute("listPhieuGiamGia", listPhieuGiamGia);
        return "ChucNang/PhieuGiamGia/PhieuGiamGia";
    }

    @PostMapping({"/save", "/update"})
    public String saveOrUpdatePhieuGiamGia(@ModelAttribute PhieuGiamGia phieuGiamGia, RedirectAttributes redirectAttributes) {
        // Kiểm tra nếu ngày bắt đầu sau ngày kết thúc
        if (phieuGiamGia.getNgayBatDau().after(phieuGiamGia.getNgayKetThuc())) {
            redirectAttributes.addFlashAttribute("errorMessage", "Ngày bắt đầu không thể sau ngày kết thúc");
            return "redirect:/phieu-giam-gia/list"; // Trở lại danh sách với thông báo lỗi
        }
        SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String ngayBatDauFormatted = dbDateFormat.format(phieuGiamGia.getNgayBatDau());
        String ngayKetThucFormatted = dbDateFormat.format(phieuGiamGia.getNgayKetThuc());
        // Lấy ngày hiện tại
        Date currentDate = new Date();

        // Nếu là thêm mới, thiết lập ngày tạo và ngày sửa
        if (phieuGiamGia.getId() == null || phieuGiamGia.getId() <= 0) {
            phieuGiamGia.setNgayTao(currentDate); // Ngày tạo là ngày hiện tại
            phieuGiamGia.setNgaySua(currentDate); // Ngày cập nhật cũng là ngày hiện tại
            redirectAttributes.addFlashAttribute("message", "Phiếu giảm giá đã được lưu thành công.");
        } else {
            // Nếu là cập nhật, chỉ cập nhật ngày sửa
            phieuGiamGia.setNgaySua(currentDate); // Ngày cập nhật là ngày hiện tại
            redirectAttributes.addFlashAttribute("message", "Phiếu giảm giá đã được cập nhật thành công.");
        }

        // Lưu hoặc cập nhật đối tượng PhieuGiamGia
        if (phieuGiamGia.getId() != null && phieuGiamGia.getId() > 0) {
            phieuGiamGiaService.capNhat(phieuGiamGia); // Gọi phương thức cập nhật
        } else {
            phieuGiamGiaService.luu(phieuGiamGia); // Gọi phương thức lưu mới
        }

        return "redirect:/phieu-giam-gia/list";
    }




    @GetMapping("/edit/{id}")
    public String editPhieuGiamGia(@PathVariable("id") Integer id, Model model) {
        PhieuGiamGia phieuGiamGia = phieuGiamGiaService.layTheoId(id);
        model.addAttribute("phieuGiamGia", phieuGiamGia);
        return "ChucNang/PhieuGiamGia/PhieuGiamGia";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        phieuGiamGiaService.xoaTheoId(id);
        return "redirect:/phieu-giam-gia/list";
    }

    @GetMapping("/layTheoId/{id}")
    public ResponseEntity<PhieuGiamGia> layPhieuGiamGiaTheoId(@PathVariable Integer id) {
        PhieuGiamGia phieuGiamGia = phieuGiamGiaService.layTheoId(id);
        if (phieuGiamGia != null) {
            return ResponseEntity.ok(phieuGiamGia);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @GetMapping("/error")
    public String handleError(Model model) {
        model.addAttribute("errorMessage", "Có lỗi xảy ra trong quá trình xử lý.");
        return "ChucNang/PhieuGiamGia/PhieuGiamGia";
    }

}

