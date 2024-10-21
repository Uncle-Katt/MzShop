package com.example.banson5s.BanHang.Controller;

import com.example.banson5s.BanHang.Entity.HoaDon;
import com.example.banson5s.BanHang.Repository.HoaDonRepo;
import com.example.banson5s.BanHang.Repository.KhachHangRepo;
import com.example.banson5s.BanHang.Repository.NhanVienRepo;
import com.example.banson5s.BanHang.Repository.PhuongThucThanhToanRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class HoaDonController {


    @Autowired
    HoaDonRepo hoaDonRepo;

    @Autowired
    KhachHangRepo khachHangRepo;

    @Autowired
    NhanVienRepo nhanVienRepo;

    @Autowired
    PhuongThucThanhToanRepo ptttRepo;





    @GetMapping("/hien-thi/hoa-don")
    private String hienThiHoaDon(Model model){
        model.addAttribute("dshd", hoaDonRepo.findAll());
        model.addAttribute("dskh", khachHangRepo.findAll());
        model.addAttribute("dsnv", nhanVienRepo.findAll());
        model.addAttribute("dspttt", ptttRepo.findAll());
        return "/HoaDon/hoadon";
    }

    @PostMapping("/hien-thi/hoa-don/add")
    private String add(HoaDon hd){
        hoaDonRepo.save(hd);
        return "redirect:/hien-thi/hoa-don";
    }

    @GetMapping("/hien-thi/hoa-don/detail/{id}")
    private String detail(@PathVariable("id") long id, Model model){
        model.addAttribute("hd", hoaDonRepo.findById(id).get());
        model.addAttribute("dskh", khachHangRepo.findAll());
        model.addAttribute("dsnv", nhanVienRepo.findAll());
        model.addAttribute("dspttt", ptttRepo.findAll());
        return "hoaDonDetail";
    }

    @PostMapping("/hien-thi/hoa-don/update")
    private String update(HoaDon nsx){
        hoaDonRepo.save(nsx);
        return "redirect:/hien-thi/hoa-don";
    }

    @GetMapping("/hien-thi/hoa-don/remove/{id}")
    private String remove(@PathVariable("id") Long id){
        hoaDonRepo.deleteById(id);
        return "redirect:/hien-thi/hoa-don";
    }

/////////////////////////








    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, "ngayTao", new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(Date.class, "ngaySua", new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(Date.class, "ngayThanhToan", new CustomDateEditor(dateFormat, true));
    }
}
