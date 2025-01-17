package com.example.banson5s.controller.admin.product;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.sanPham.KhoiLuongDTO;
import com.example.banson5s.service.admin.IKhoiLuongService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/weight")
public class KhoiLuongController {
    @Autowired
    private IKhoiLuongService khoiLuongService;
    @GetMapping()
    public String hienThi(Model model) {
        model.addAttribute("page", "sanPham/khoi_luong/index");
        return "admin/main";
    }
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getKhoiLuong(@RequestParam String search) {
        List<KhoiLuongDTO> lst = khoiLuongService.findAllKhoiLuong(search);
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }
    @GetMapping("/create")
    public String formCreate(Model model) {
        model.addAttribute("khoiLuong", new KhoiLuongDTO());
        model.addAttribute("btnText", "Thêm Khối Lượng");
        model.addAttribute("action", "/admin/weight/create");
        model.addAttribute("page", "sanPham/khoi_luong/form");
        return "admin/main";
    }
    @PostMapping("/create")
    public String create(@ModelAttribute KhoiLuongDTO req) {
        khoiLuongService.createKhoiLuong(req);
        return "redirect:/admin/weight";
    }
    @GetMapping("/update/{id}")
    public String formUpdate(@PathVariable Long id, Model model) {
        KhoiLuongDTO khoiLuong = khoiLuongService.detailKhoiLuong(id);
        if (khoiLuong == null) {
            return "redirect:/admin/weight";
        }
        model.addAttribute("khoiLuong", khoiLuong);
        model.addAttribute("btnText","Cập Nhật");
        model.addAttribute("action", "/admin/weight/update");
        model.addAttribute("page", "sanPham/khoi_luong/form");
        return "admin/main";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute KhoiLuongDTO req) {
        khoiLuongService.updateKhoiLuong(req);
        return "redirect:/admin/weight";
    }
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        KhoiLuongDTO khoiLuong = khoiLuongService.detailKhoiLuong(id);
        if (khoiLuong == null) {
            return "redirect:/admin/weight";
        }
        model.addAttribute("khoiLuong", khoiLuong);
        model.addAttribute("page", "sanPham/khoi_luong/detail");
        return "admin/main";
    }
    @PutMapping("/delete")
    @ResponseBody
    public ResponseEntity<?> delete(@RequestBody Long id) {
        khoiLuongService.delete(id);
        return new ResponseEntity<>(ResponseObject.builder().data(id).build(), HttpStatus.OK);
    }
}
