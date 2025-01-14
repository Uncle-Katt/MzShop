package com.example.banson5s.controller.client.cart;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {
    @GetMapping
    public String sanPhamPage(Model model) {
        model.addAttribute("page", "cart/index");
        return "client/main";
    }
}
