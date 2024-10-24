package com.example.banson5s.controller.admin.sales;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/sales")
public class SalesController {

    @GetMapping()
    public String index(Model model) {
        model.addAttribute("page", "sales/index");
        return "admin/main";
    }
}
