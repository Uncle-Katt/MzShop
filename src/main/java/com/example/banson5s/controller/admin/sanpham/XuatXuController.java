package com.example.banson5s.controller.admin.sanpham;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.sanPham.ThuongHieuDTO;
import com.example.banson5s.dto.admin.sanPham.XuatXuDTO;
import com.example.banson5s.enums.Gender;
import com.example.banson5s.service.admin.IXuatXuService;
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
@RequestMapping("/admin/xuatxu")
public class XuatXuController {
    @Autowired
    private IXuatXuService xuatXuService;
    @GetMapping()
    public String hienThi(Model model) {

        model.addAttribute("page", "SanPham/xuat_xu/index");
        return "admin/main";
    }
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getXuatXu(@RequestParam String search) {
        List<XuatXuDTO> lst = xuatXuService.findAllXuatXu(search);
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }
    @GetMapping("/create")
    public String formCreate(Model model) {
        model.addAttribute("xuatXu", new XuatXuDTO());
        model.addAttribute("btnText", "Thêm xuất xứ");
        model.addAttribute("action", "/admin/xuatxu/create");
        model.addAttribute("page", "SanPham/xuat_xu/form");
        return "admin/main";
    }
    @PostMapping("/create")
    public String create(@Valid @ModelAttribute XuatXuDTO req, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "admin/main";
        }
        xuatXuService.createXuatXu(req);
        redirectAttributes.addFlashAttribute("successMessage", "Thêm xuất xứ thành công!");
        return "redirect:/admin/xuatxu";
    }
    @GetMapping("/update/{id}")
    public String formUpdate(@PathVariable Long id, Model model) {
        XuatXuDTO xuatXu = xuatXuService.detailXuatXu(id);
        if (xuatXu == null) {
            return "redirect:/admin/xuatxu";
        }
        model.addAttribute("xuatXu", xuatXu);
        model.addAttribute("action", "/admin/xuatxu/update");
        model.addAttribute("page", "SanPham/xuat_xu/form");
        return "admin/main";
    }
    @PostMapping("/update")
    public String update(@Valid @ModelAttribute XuatXuDTO req, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "admin/main";
        }

        try {
            xuatXuService.updateXuatXu(req);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật xuất xứ thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Cập nhật xuất xứ thất bại!");
        }

        return "redirect:/admin/xuatxu";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        XuatXuDTO xuatXu = xuatXuService.detailXuatXu(id);
        if (xuatXu == null) {
            return "redirect:/admin/xuatxu";
        }
        model.addAttribute("xuatXu", xuatXu);
        return "admin/main";
    }

    @PutMapping("/delete")
    @ResponseBody
    public ResponseEntity<?> delete(@RequestBody Long id) {
        xuatXuService.delete(id);
        return new ResponseEntity<>(ResponseObject.builder().data(id).build(), HttpStatus.OK);
    }
}
