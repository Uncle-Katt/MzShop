package com.example.banson5s.ChucNang.Controller;

import com.example.banson5s.ChucNang.Entity.PhieuGiamGia;
import com.example.banson5s.ChucNang.Service.PhieuGiamGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/phieu-giam-gia")
public class PhieuGiamGiaController {

    @Autowired
    private PhieuGiamGiaService phieuGiamGiaService;
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, "ngayBatDau", new CustomDateEditor(new SimpleDateFormat("dd-MM-yyyy"), true));
        binder.registerCustomEditor(Date.class, "ngayKetThuc", new CustomDateEditor(new SimpleDateFormat("dd-MM-yyyy"), true));
    }
    @GetMapping("/list")
    public String list(Model model) {
        List<PhieuGiamGia> listPhieuGiamGia = phieuGiamGiaService.layTatCa();
        model.addAttribute("listPhieuGiamGia", listPhieuGiamGia);
        return "ChucNang/PhieuGiamGia";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute PhieuGiamGia phieuGiamGia) {
        phieuGiamGiaService.luu(phieuGiamGia);
        return "redirect:/phieu-giam-gia/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        PhieuGiamGia phieuGiamGia = phieuGiamGiaService.layTheoId(id);
        model.addAttribute("phieuGiamGia", phieuGiamGia);
        return "ChucNang/PhieuGiamGia";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute PhieuGiamGia phieuGiamGia) {
        phieuGiamGiaService.luu(phieuGiamGia);
        return "redirect:/phieu-giam-gia/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        phieuGiamGiaService.xoaTheoId(id);
        return "redirect:/phieu-giam-gia/list";
    }
}
