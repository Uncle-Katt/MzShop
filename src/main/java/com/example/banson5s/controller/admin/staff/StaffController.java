package com.example.banson5s.controller.admin.staff;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.diaChi.DiaChiDTO;
import com.example.banson5s.dto.admin.khachHang.KhachHangDTO;
import com.example.banson5s.dto.admin.nhanVien.NhanVienDTO;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.enums.Gender;
import com.example.banson5s.service.admin.IDiaChiService;
import com.example.banson5s.service.admin.IKhachHangService;
import com.example.banson5s.service.admin.INhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/admin/staff")
public class StaffController {

    @Autowired
    private INhanVienService nhanVienService;

    @GetMapping()
    public String index(Model model) {
        Map<String, Gender> gender = new LinkedHashMap<>();
        gender.put(Gender.Male.toString(), Gender.Male);
        gender.put(Gender.Female.toString(), Gender.Female);
        model.addAttribute("gender", gender);
        model.addAttribute("page", "staff/index");
        return "admin/main";
    }

    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getCustomer(@RequestParam String search) {
        List<NhanVienDTO> lst = nhanVienService.findAllNhanVien(search);
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }
    @GetMapping("/create")
    public String formCreate(Model model) {
        Map<String, String> gender = new LinkedHashMap<>();
        gender.put(Gender.Male.toString(), Gender.Male.getLabel());
        gender.put(Gender.Female.toString(), Gender.Female.getLabel());
        model.addAttribute("gender", gender);
        NhanVien s = NhanVien.builder().gioiTinh(Gender.Male.toString()).build();
        model.addAttribute("staff",s);
        model.addAttribute("btnText","Thêm nhân viên");
        model.addAttribute("action", "/admin/staff/create");
        model.addAttribute("page", "staff/form");
        return "admin/main";
    }

    @GetMapping("/update/{id}")
    public String formUpdate(@PathVariable Long id, Model model) {
        Optional<NhanVien> otp = nhanVienService.findById(id);
        if (otp.isEmpty()){
            return "redirect:/admin/staff";
        }
        Map<String, String> gender = new LinkedHashMap<>();
        gender.put(Gender.Male.toString(), Gender.Male.getLabel());
        gender.put(Gender.Female.toString(), Gender.Female.getLabel());
        model.addAttribute("gender", gender);
        model.addAttribute("staff", otp.get());
        model.addAttribute("btnText","Cập Nhật");
        model.addAttribute("action", "/admin/staff/update");
        model.addAttribute("page", "staff/form");
        return "admin/main";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        model.addAttribute("staffId", id);
        model.addAttribute("page", "staff/detail");
        return "admin/main";
    }
    @PostMapping("/detail")
    @ResponseBody
    public ResponseEntity<?> detailApi(@RequestBody Long id) {
        NhanVienDTO nhanVien = nhanVienService.detailNhanVien(id);
        return new ResponseEntity<>(ResponseObject.builder()
                .data(nhanVien).build(), HttpStatus.OK);
    }
    @PostMapping("/create")
    public String create(@ModelAttribute NhanVienDTO req) {
        nhanVienService.createNhanVien(req);
        return "redirect:/admin/staff";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute NhanVienDTO req) {
        nhanVienService.updateNhanVien(req);
        return "redirect:/admin/staff";
    }

    @PutMapping("/delete")
    @ResponseBody
    public ResponseEntity<?> delete(@RequestBody Long id) {
        nhanVienService.delete(id);
        return new ResponseEntity<>(ResponseObject.builder().data(id).build(), HttpStatus.OK);
    }

}
