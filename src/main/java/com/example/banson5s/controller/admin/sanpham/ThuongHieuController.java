package com.example.banson5s.controller.admin.sanpham;

//import com.example.banson5s.repository.admin.IThuongHieuRepo;
//import org.springframework.beans.factory.annotation.Autowired;
import com.example.banson5s.enums.Gender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.LinkedHashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin/thuonghieu")
public class ThuongHieuController {
//    @Autowired
//    private IThuongHieuRepo thRepo;
    @GetMapping()
    public String hienThi(Model model) {
        Map<String, Gender> gender = new LinkedHashMap<>();
        gender.put(Gender.Male.toString(), Gender.Male);
        gender.put(Gender.Female.toString(), Gender.Female);
        model.addAttribute("gender", gender);
        model.addAttribute("page", "SanPham/thuong_hieu/index");
        return "admin/main";
    }
}
