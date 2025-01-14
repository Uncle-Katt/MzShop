package com.example.banson5s.controller.client.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
    @GetMapping
    public String sanPhamPage(Model model) {
        model.addAttribute("page", "product/index");
        return "client/main";
    }

    @GetMapping("/detail")
    public String detailProductPage(Model model) {
        model.addAttribute("page", "product/productDetail");
        return "client/main";
    }
}

