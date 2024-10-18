package com.example.banson5s.ChucNang.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuanLyViewController {

    @GetMapping("/quan-ly-view")
    public String quanLyView(Model model) {

        return "quanLy";
    }

    @GetMapping("/role-switch")
    public String roleSwitch(Model model) {

        return "RoleSwitch";
    }
}
