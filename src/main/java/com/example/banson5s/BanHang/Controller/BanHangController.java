package com.example.banson5s.BanHang.Controller;

import com.example.banson5s.SanPham.Repositorty.SanPhamRepositorty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BanHangController {
    @Autowired
    private SanPhamRepositorty spRepo;
    @GetMapping("/ban-hang")
    private String banHangView(Model model ){
        model.addAttribute("sp",spRepo.findAll());
        return "BanHang/banHangView";
    }
}
