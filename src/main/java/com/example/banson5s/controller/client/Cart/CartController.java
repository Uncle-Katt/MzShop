package com.example.banson5s.controller.client.Cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Cart")
public class CartController {
    @GetMapping
    public String sanPhamPage() {
        return "client/Cart/index"; // Trả về tên view
    }
}
