package com.example.banson5s.controller.admin.sanpham;

import com.example.banson5s.enums.Gender;
//import com.example.banson5s.repository.admin.IXuatXuRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.LinkedHashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin/xuatxu")
public class XuatXuController {
//    @Autowired
//    private IXuatXuRepo xxRepo;
    @GetMapping()
    public String hienThi(Model model) {
        Map<String, Gender> gender = new LinkedHashMap<>();
        gender.put(Gender.Male.toString(), Gender.Male);
        gender.put(Gender.Female.toString(), Gender.Female);
        model.addAttribute("gender", gender);
        model.addAttribute("page", "SanPham/xuat_xu/index");
        return "admin/main";
    }
}
