package com.example.banson5s.controller.admin;

import com.example.banson5s.service.admin.INhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NhanVienController {
    @Autowired
    INhanVienService nhanVienService;
    @GetMapping()
    public String getListNhanVien() {
        return "nhanvien";
    }
}
