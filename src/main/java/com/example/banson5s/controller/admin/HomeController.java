package com.example.banson5s.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HomeController {
    @GetMapping("/home")
    public String home(Model model) {
        return "home"; // Trả về tên của trang JSP (home.jsp)
    }
}
