package com.example.banson5s.ChucNang.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Random;
@Controller
public class LogInController {
    @Autowired
    private JavaMailSender mailSender;

    private String maXacThuc;

    @GetMapping("/dang-nhap")
    public String dangNhap(Model model) {
        model.addAttribute("message", "");
        return "ChucNang/dangNhap";
    }

    @PostMapping("/dang-ky")
    public String dangKy(@RequestParam("username") String username,
                               @RequestParam("email") String email,
                               @RequestParam("password") String password,
                               Model model) {

        // Tạo mã xác thực
        maXacThuc = String.valueOf(new Random().nextInt(999999));

        // Gửi mã xác thực qua email
        guiEmailXacNhan(email, maXacThuc);

        model.addAttribute("message", "Kiểm tra email để nhận mã xác thực.");
        return "ChucNang/dangNhap";
    }

    @PostMapping("/xac-thuc")
    public String maXacThuc(@RequestParam("code") String code, Model model) {
        if (code.equals(maXacThuc)) {
            model.addAttribute("message", "Đăng ký thành công!");
        } else {
            model.addAttribute("message", "Mã xác thực không đúng!");
        }
        return "ChucNang/dangNhap";
    }

    private void guiEmailXacNhan(String email, String maXacThuc) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Mã xác thực của bạn");
        message.setText("Mã xác thực của bạn là: " + maXacThuc);
        mailSender.send(message);
    }
}
