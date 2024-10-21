package com.example.banson5s.BanHang.Controller;

import com.example.banson5s.BanHang.Entity.HoaDon;
import com.example.banson5s.BanHang.Entity.HoaDonRequest;
import com.example.banson5s.BanHang.Entity.PhuongThucThanhToan;
import com.example.banson5s.BanHang.Repository.HoaDonRepo;
import com.example.banson5s.BanHang.Repository.KhachHangRepo;
import com.example.banson5s.BanHang.Repository.NhanVienRepo;
import com.example.banson5s.BanHang.Repository.PhuongThucThanhToanRepo;
import com.example.banson5s.BanHang.Service.HoaDonService;
import com.example.banson5s.ChucNang.Entity.KhachHang;
import com.example.banson5s.ChucNang.Entity.NhanVien;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BHContro {

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private KhachHangRepo khachHangRepo;

    @Autowired
    private NhanVienRepo nhanVienRepo;

    @Autowired
    private PhuongThucThanhToanRepo phuongThucThanhToanRepo;

    @Autowired
    private HoaDonRepo hoaDonRepo;

    @GetMapping("/hien-thi/hoa-don/tao-moi")
    public String showCreateForm(Model model) {

        model.addAttribute("dshd", hoaDonRepo.findByTrangThai(0));
        model.addAttribute("khachHangs", khachHangRepo.findAll());
        model.addAttribute("nhanViens", nhanVienRepo.findAll());
        model.addAttribute("phuongThucThanhToans", phuongThucThanhToanRepo.findAll());
        return "banhan";
    }

    @PostMapping("/hien-thi/add/tao-moi")
    public String createHoaDon(@RequestParam Long khachHangId,
                               @RequestParam Long nhanVienId,
                               @RequestParam Long phuongThucThanhToanId,
                               RedirectAttributes redirectAttributes) {
        HoaDon hoaDon = hoaDonService.createEmptyHoaDon(khachHangId, nhanVienId, phuongThucThanhToanId);
        redirectAttributes.addFlashAttribute("message", "Hóa đơn đã được tạo thành công với mã: " + hoaDon.getMaHD());
        return "redirect:/hien-thi/hoa-don/tao-moi";
    }
}
