package com.example.banson5s.BanHang.Controller;

import com.example.banson5s.BanHang.Entity.PhuongThucThanhToan;
import com.example.banson5s.BanHang.Service.PhuongThucThanhToanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/phuong-thuc-thanh-toan")
public class PhuongThucThanhToanController {

    @Autowired
    private PhuongThucThanhToanService phuongThucThanhToanService;

    @GetMapping("/list")
    public String list(Model model) {
        List<PhuongThucThanhToan> listPhuongThuc = phuongThucThanhToanService.findAll();
        model.addAttribute("listPhuongThuc", listPhuongThuc);
        return "BanHang/PhuongThucTT";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute PhuongThucThanhToan phuongThuc) {
        phuongThucThanhToanService.save(phuongThuc);
        return "redirect:/phuong-thuc-thanh-toan";
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute PhuongThucThanhToan phuongThuc) {
        phuongThucThanhToanService.save(phuongThuc);
        return "redirect:/phuong-thuc-thanh-toan";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        phuongThucThanhToanService.deleteById(id);
        return "redirect:/phuong-thuc-thanh-toan";
    }
}
