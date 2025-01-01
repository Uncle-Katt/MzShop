package com.example.banson5s.controller.admin.product;


import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class ProductControler {

    @GetMapping()
    public String index(Model model) {
        model.addAttribute("page", "product/product/index");
        return "admin/main";
    }

    @GetMapping("/create")
    public String createSanPhamPage(Model model) {
        return "admin/main"; // Tên file JSP được trả về
    }

    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getLstProducts(@RequestParam String search) {
//        List<SanPhamChiTiet> lst =
//        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }
}
