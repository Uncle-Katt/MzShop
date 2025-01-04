package com.example.banson5s.controller.client.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sanpham")
public class ProductController {
    @GetMapping
    public String sanPhamPage() {
        return "client/SanPham/sanpham"; // Trả về tên view
    }
}

