package com.example.banson5s.controller.admin.customer;

import com.example.banson5s.service.admin.IKhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/customer")
public class CustomerController {

    @Autowired
    private IKhachHangService customerService;

    @GetMapping()
    public String index(Model model) {
        model.addAttribute("page", "customer/index");
        return "admin/main";
    }
}
