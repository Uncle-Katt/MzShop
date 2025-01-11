package com.example.banson5s.controller.admin.sanPham;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.sanPham.ThuongHieuDTO;
import com.example.banson5s.service.admin.IThuongHieuService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;


@Controller
@RequestMapping("/admin/thuonghieu")
public class ThuongHieuController {

    @Autowired
    private IThuongHieuService thuongHieuService;

    // Hiển thị trang chính
    @GetMapping()
    public String hienThi(Model model) {
        model.addAttribute("page", "sanPham/thuong_hieu/index");
        return "admin/main";
    }
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getThuongHieu(@RequestParam String search) {
        List<ThuongHieuDTO> lst = thuongHieuService.findAllThuongHieu(search);
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }

    // Hiển thị form thêm thương hiệu
    @GetMapping("/create")
    public String formCreate(Model model) {
        model.addAttribute("thuongHieu", new ThuongHieuDTO());
        model.addAttribute("btnText", "Thêm thương hiệu");
        model.addAttribute("action", "/admin/thuonghieu/create");
        model.addAttribute("page", "sanPham/thuong_hieu/form");
        return "admin/main";
    }

    // Xử lý thêm thương hiệu
    @PostMapping("/create")
    public String create(@Valid @ModelAttribute ThuongHieuDTO req, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "admin/main";
        }
        thuongHieuService.createThuongHieu(req);
        redirectAttributes.addFlashAttribute("successMessage", "Thêm thương hiệu thành công!");
        return "redirect:/admin/thuonghieu";
    }

    // Hiển thị form cập nhật thương hiệu
    @GetMapping("/update/{id}")
    public String formUpdate(@PathVariable Long id, Model model) {
        ThuongHieuDTO thuongHieu = thuongHieuService.detailThuongHieu(id);
        if (thuongHieu == null) {
            return "redirect:/admin/thuonghieu";
        }
        model.addAttribute("thuongHieu", thuongHieu);
        model.addAttribute("action", "/admin/thuonghieu/update");
        model.addAttribute("page", "sanPham/thuong_hieu/form");
        return "admin/main";
    }

    // Xử lý cập nhật thương hiệu
    @PostMapping("/update")
    public String update(@Valid @ModelAttribute ThuongHieuDTO req, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "admin/main"; // Trả lại form khi có lỗi
        }

        try {
            thuongHieuService.updateThuongHieu(req);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thương hiệu thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Cập nhật thương hiệu thất bại!");
        }

        return "redirect:/admin/thuonghieu"; // Điều hướng lại trang danh sách
    }

    // Chi tiết thương hiệu
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        ThuongHieuDTO thuongHieu = thuongHieuService.detailThuongHieu(id);
        if (thuongHieu == null) {
            return "redirect:/admin/thuonghieu";
        }
        model.addAttribute("thuongHieu", thuongHieu);
        return "admin/main";
    }

    @PutMapping("/delete")
    @ResponseBody
    public ResponseEntity<?> delete(@RequestBody Long id) {
        thuongHieuService.delete(id);
        return new ResponseEntity<>(ResponseObject.builder().data(id).build(), HttpStatus.OK);
    }
}
