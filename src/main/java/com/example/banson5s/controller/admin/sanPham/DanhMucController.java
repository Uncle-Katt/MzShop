package com.example.banson5s.controller.admin.sanPham;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.sanPham.DanhMucDTO;
import com.example.banson5s.enums.Gender;
import com.example.banson5s.service.admin.IDanhMucService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/danhmuc")
public class DanhMucController {
    @Autowired
    private IDanhMucService danhMucService;

    @GetMapping()
    public String hienThi(Model model) {
        model.addAttribute("page", "sanPham/danh_muc/index");
        return "admin/main";
    }
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getDanhMuc(@RequestParam String search) {
        List<DanhMucDTO> lst = danhMucService.findAllDanhMuc(search);
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }
    @GetMapping("/create")
    public String formCreate(Model model) {
        model.addAttribute("danhMuc", new DanhMucDTO());
        model.addAttribute("btnText", "Thêm danh mục");
        model.addAttribute("action", "/admin/danhmuc/create");
        model.addAttribute("page", "sanPham/danh_muc/form");
        return "admin/main";
    }
    @PostMapping("/create")
    public String create(@Valid @ModelAttribute DanhMucDTO req, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "admin/main";
        }
        danhMucService.createDanhMuc(req);
        redirectAttributes.addFlashAttribute("successMessage", "Thêm danh mục thành công!");
        return "redirect:/admin/danhmuc";
    }
    @GetMapping("/update/{id}")
    public String formUpdate(@PathVariable Long id, Model model) {
        DanhMucDTO danhMuc = danhMucService.detailDanhMuc(id);
        if (danhMuc == null) {
            return "redirect:/admin/danhmuc";
        }
        model.addAttribute("danhmuc", danhMuc);
        model.addAttribute("action", "/admin/danhmuc/update");
        model.addAttribute("page", "sanPham/danh_muc/form");
        return "admin/main";
    }
    @PostMapping("/update")
    public String update(@Valid @ModelAttribute DanhMucDTO req, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "admin/main";
        }
        try {
            danhMucService.updateDanhMuc(req);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật danh mục thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Cập nhật danh mục thất bại!");
        }
        return "redirect:/admin/danhmuc";
    }
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        DanhMucDTO danhMuc = danhMucService.detailDanhMuc(id);
        if (danhMuc == null) {
            return "redirect:/admin/danhmuc";
        }
        model.addAttribute("danhMuc", danhMuc);
        return "admin/main";
    }
    @PutMapping("/delete")
    @ResponseBody
    public ResponseEntity<?> delete(@RequestBody Long id) {
        danhMucService.delete(id);
        return new ResponseEntity<>(ResponseObject.builder().data(id).build(), HttpStatus.OK);
    }
}
