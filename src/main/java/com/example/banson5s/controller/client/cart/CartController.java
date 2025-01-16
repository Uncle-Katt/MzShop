package com.example.banson5s.controller.client.cart;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.client.cart.CartRequest;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.service.client.Impl.CartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping()
public class CartController {
    @Autowired
    CartServiceImpl cartService;

    @GetMapping("/cart")
    public String cartIndex(Model model) {
        model.addAttribute("page", "cart/index");
        return "client/main";
    }

    @GetMapping("/check-out")
    public String checkOut(Model model) {
        model.addAttribute("page", "cart/check-out");
        return "client/main";
    }

    @PostMapping("/payment-cart")
    public ResponseEntity<?> paymentCart(@RequestBody CartRequest dto) {
        HoaDon hoaDon = cartService.paymentCart(dto);
        return new ResponseEntity<>(ResponseObject.builder().data(hoaDon).build(), HttpStatus.OK);
    }
}
