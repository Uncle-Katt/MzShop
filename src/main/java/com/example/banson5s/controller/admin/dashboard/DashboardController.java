package com.example.banson5s.controller.admin.dashboard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class DashboardController {
    @GetMapping(value = {"/home", "", "/"})
    public String home(Model model) {
        model.addAttribute("page", "dashboard/index");
        return "admin/main";
    }
}
