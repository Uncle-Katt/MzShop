package com.example.banson5s.controller.admin.order;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.order.OrderBillDTO;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.service.admin.IOrderService;
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

@Controller
@RequestMapping("/admin/order")
public class OrderController {

    @Autowired
    private IOrderService orderService;

    @GetMapping()
    public String index(Model model) {
        model.addAttribute("page", "order/index");
        return "admin/main";
    }

    @GetMapping("/{maHd}")
    public String detail(@PathVariable String maHd, Model model) {
        model.addAttribute("codeBill", maHd);
        model.addAttribute("page", "order/detail");
        return "admin/main";
    }
    @PostMapping()
    @ResponseBody
    public ResponseEntity<?> getBill(@RequestBody String code) {
        OrderBillDTO bill =  orderService.getHoaDonByCode(code);
        return new ResponseEntity<>(ResponseObject.builder().data(bill).build(), HttpStatus.OK);
    }

}
