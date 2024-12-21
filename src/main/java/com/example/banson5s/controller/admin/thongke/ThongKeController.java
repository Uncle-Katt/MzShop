package com.example.banson5s.controller.admin.thongke;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/thongke")
public class ThongKeController {

    @GetMapping()
    public String hienThi(Model model) {
        model.addAttribute("page", "thongke/index");  // Thêm thuộc tính 'page' với giá trị là đường dẫn tới view
        return "admin/main";  // Trả về view chính (main)
    }
}
