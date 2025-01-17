package com.example.banson5s.controller.admin.auth;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.common.AuthRequest;
import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.repository.admin.INhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Optional;

@Controller
@RequestMapping("/admin/login")
public class AuthController {
    @Autowired
    INhanVienRepository nhanVienRepository;

    @GetMapping()
    public String home(Model model) {
        model.addAttribute("page", "dashboard/index");
        return "admin/auth/login";
    }

    @PostMapping()
    @ResponseBody
    public ResponseEntity<?> login(@RequestBody AuthRequest dto) {
        Optional<NhanVien> opt = nhanVienRepository.findNhanVienByEmail(dto.getUsername());
        if (opt.isEmpty()) {
            throw new AppException(ErrorCode.UNAUTHORIZED);
        }
        NhanVien nhanVien = opt.get();
        if (!nhanVien.getMatKhau().equals(dto.getPassword())) {
            throw new AppException(ErrorCode.UNAUTHORIZED);
        }

        return new ResponseEntity<>(ResponseObject.builder()
                .data(nhanVien).build(), HttpStatus.OK);
    }
}
