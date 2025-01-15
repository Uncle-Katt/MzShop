package com.example.banson5s.controller.client.product;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.sanPham.reponse.SanPhamDTO;
import com.example.banson5s.dto.admin.sanPham.reponse.SanPhamDetailDTO;
import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.entity.client.IProductItemClient;
import com.example.banson5s.service.client.ISanPhamClientService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ISanPhamClientService sanPhamClientService;
    @Autowired
    private ModelMapper modelMapper;

    @GetMapping
    public String sanPhamPage(Model model) {
        model.addAttribute("page", "product/index");
        return "client/main";
    }

    @GetMapping("/{id}")
    public String detailProductPage(@PathVariable Long id, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("page", "product/productDetail");
        return "client/main";
    }

    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getLstProduct() {
        List<IProductItemClient> data = sanPhamClientService.lstSanPham();
        return new ResponseEntity<>(ResponseObject.builder()
                .data(data).build(), HttpStatus.OK);
    }
    @PostMapping("/detail")
    @ResponseBody
    public ResponseEntity<?> detailProduct(@RequestBody Long id){
        SanPham sanPham = sanPhamClientService.findById(id).orElseThrow();
        Set<SanPhamChiTiet> lstSanPhamChiTiet = sanPham.getLstChiTietSanPham().stream().filter(item -> !item.isXoaMem()).collect(Collectors.toSet());
        sanPham.setLstChiTietSanPham(lstSanPhamChiTiet);
        SanPhamDetailDTO data = modelMapper.map( sanPham, SanPhamDetailDTO.class);
        return new ResponseEntity<>(ResponseObject.builder()
                .data(data).build(), HttpStatus.OK);
    }
}

