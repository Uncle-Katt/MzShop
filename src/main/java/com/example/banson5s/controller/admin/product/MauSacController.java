package com.example.banson5s.controller.admin.product;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.sanPham.MauSacDTO;
import com.example.banson5s.service.admin.IMauSacService;
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
@RequestMapping("/admin/mausac")
public class MauSacController {
    @Autowired
    private IMauSacService mauSacService;
    @GetMapping()
    public String hienThi(Model model) {
        model.addAttribute("page", "sanPham/mau_sac/index");
        return "admin/main";
    }
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getMauSac(@RequestParam String search) {
        List<MauSacDTO> lst = mauSacService.findAllMauSac(search);
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }
    @GetMapping("/create")
    public String formCreate(Model model) {
        model.addAttribute("mauSac", new MauSacDTO());
        model.addAttribute("btnText", "Thêm màu sắc");
        model.addAttribute("action", "/admin/mausac/create");
        model.addAttribute("page", "sanPham/mau_sac/form");
        return "admin/main";
    }
    @PostMapping("/create")
    public String create(@Valid @ModelAttribute MauSacDTO req, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "admin/main";
        }
        mauSacService.createMauSac(req);
        redirectAttributes.addFlashAttribute("successMessage", "Thêm màu sắc thành công!");
        return "redirect:/admin/mausac";
    }
    @GetMapping("/update/{id}")
    public String formUpdate(@PathVariable Long id, Model model) {
        MauSacDTO mauSac = mauSacService.detailMauSac(id);
        if (mauSac == null) {
            return "redirect:/admin/mausac";
        }
        model.addAttribute("mauSac", mauSac);
        model.addAttribute("action", "/admin/mausac/update");
        model.addAttribute("page", "sanPham/mau_sac/form");
        return "admin/main";
    }
    @PostMapping("/update")
    public String update(@Valid @ModelAttribute MauSacDTO req, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "admin/main";
        }

        try {
            mauSacService.updateMauSac(req);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật màu sắc thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Cập nhật màu sắc thất bại!");
        }

        return "redirect:/admin/mausac";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        MauSacDTO mauSac = mauSacService.detailMauSac(id);
        if (mauSac == null) {
            return "redirect:/admin/mausac";
        }
        model.addAttribute("mauSac", mauSac);
        return "admin/main";
    }

    @PutMapping("/delete")
    @ResponseBody
    public ResponseEntity<?> delete(@RequestBody Long id) {
        mauSacService.delete(id);
        return new ResponseEntity<>(ResponseObject.builder().data(id).build(), HttpStatus.OK);
    }
}
