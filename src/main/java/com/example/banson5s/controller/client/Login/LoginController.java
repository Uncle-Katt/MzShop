package com.example.banson5s.controller.client.Login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
    @GetMapping
    public String sanPhamPage() {
        return "client/Login/index"; // Trả về tên view
    }
}
