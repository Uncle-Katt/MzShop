package com.example.banson5s.controller.client.cart;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping()
public class CartController {
    @GetMapping("/cart")
    public String cartIndex(Model model) {
        model.addAttribute("page", "cart/index");
        return "client/main";
    }

    @GetMapping("/check-out")
    public String checkOut(Model model) {
        model.addAttribute("page", "cart/check-out");
        return "client/main";
    }
}
