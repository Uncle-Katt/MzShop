package com.example.banson5s.controller.admin.product;


import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.sanPham.SanPhamDTO;
import com.example.banson5s.entity.admin.IProductItem;
import com.example.banson5s.service.admin.ISanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/admin/product")
public class ProductControler {

    @Autowired
    private ISanPhamService sanPhamService;

    @GetMapping()
    public String index(Model model) {
        model.addAttribute("page", "product/product/index");
        return "admin/main";
    }

    @GetMapping("/add")
    public String addSanPhamPage(Model model) {
        model.addAttribute("page", "product/product/add");
        return "admin/main"; // Tên file JSP được trả về
    }

    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getLstProducts(@RequestParam String search) {
        List<IProductItem> lst = sanPhamService.getLstProductGroup(search);
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }
    @PostMapping("/create")
    @ResponseBody
    public ResponseEntity<?> createProducts(@RequestBody SanPhamDTO dto) {
        SanPhamDTO sanPhamDTO = sanPhamService.createSanPham(dto);
        return new ResponseEntity<>(ResponseObject.builder().data(sanPhamDTO).build(), HttpStatus.OK);
    }

    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<?> updateProducts(@RequestBody SanPhamDTO dto) {
        SanPhamDTO sanPhamDTO = sanPhamService.updateSanpham(dto);
        return new ResponseEntity<>(ResponseObject.builder().data(sanPhamDTO).build(), HttpStatus.OK);
    }
}
