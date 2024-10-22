package com.example.banson5s.controller.admin;

import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.service.admin.INhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/nhan-vien")
public class NhanVienController {
    @Autowired
    INhanVienService nhanVienService;
    @GetMapping()
    public String getListNhanVien() {
        nhanVienService.createNew(new NhanVien());
        return "nhanvien";
    }
}
