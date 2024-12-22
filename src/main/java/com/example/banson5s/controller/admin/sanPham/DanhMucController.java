package com.example.banson5s.controller.admin.sanPham;


import com.example.banson5s.enums.Gender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin/danhmuc")
public class DanhMucController {
//    @Autowired
//    private IDanhMucRepo dmRepo;

    @GetMapping()
    public String hienThi(Model model) {
        Map<String, Gender> gender = new LinkedHashMap<>();
        gender.put(Gender.Male.toString(), Gender.Male);
        gender.put(Gender.Female.toString(), Gender.Female);
        model.addAttribute("gender", gender);
        model.addAttribute("page", "SanPham/danh_muc/index");
        return "admin/main";
    }
}
