package com.example.banson5s.controller.client.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/detailproduct")
public class DetailProductController {
    @GetMapping
    public String DetailProductPage() {
        return "client/SanPham/detailproduct"; // Trả về tên view
    }
}
