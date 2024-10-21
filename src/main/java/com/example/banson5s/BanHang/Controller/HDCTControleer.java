package com.example.banson5s.BanHang.Controller;

import com.example.banson5s.BanHang.Entity.HoaDon;
import com.example.banson5s.BanHang.Entity.HoaDonChiTiet;
import com.example.banson5s.BanHang.Repository.HDCTRepo;
import com.example.banson5s.BanHang.Repository.HoaDonRepo;
import com.example.banson5s.BanHang.Repository.SanPhamChiTietRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HDCTControleer {
    @Autowired
    HDCTRepo hdctRepo;

    @Autowired
    HoaDonRepo hoaDonRepo;

    @Autowired
    SanPhamChiTietRepo spctRepo;

    @GetMapping("/hien-thi/hdct")
    private String hienThiHDCT(Model model){
        model.addAttribute("dshdct", hdctRepo.findAll());
        model.addAttribute("dshd", hoaDonRepo.findAll());
        model.addAttribute("dsspct", spctRepo.findAll());
        return "/HoaDon/hdct";
    }

    @PostMapping("/hien-thi/hoa-don-ct/add")
    private String add(HoaDonChiTiet hdct){
        hdctRepo.save(hdct);
        return "redirect:/hien-thi/hdct";
    }

    @GetMapping("/hien-thi/hoa-don-ct/detail/{id}")
    private String detail(@PathVariable("id") long id, Model model){
        model.addAttribute("hdct", hdctRepo.findById(id).get());
        model.addAttribute("dshd", hoaDonRepo.findAll());
        model.addAttribute("dsspct", spctRepo.findAll());
        return "hdctDetail";
    }

    @PostMapping("/hien-thi/hoa-don-ct/update")
    private String update(HoaDonChiTiet nsx){
        hdctRepo.save(nsx);
        return "redirect:/hien-thi/hdct";
    }

    @GetMapping("/hien-thi/hoa-don-ct/remove/{id}")
    private String remove(@PathVariable("id") Long id){
        hdctRepo.deleteById(id);
        return "redirect:/hien-thi/hdct";
    }
}
