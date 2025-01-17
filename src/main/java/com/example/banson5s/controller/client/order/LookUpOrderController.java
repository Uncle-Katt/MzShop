package com.example.banson5s.controller.client.order;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.order.OrderBillDTO;
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
@RequestMapping()
public class LookUpOrderController {

    @Autowired
    private IOrderService orderService;

    @GetMapping("/order")
    public String order(Model model) {
        model.addAttribute("page", "home/index");
        return "client/main";
    }

    @GetMapping("/look-up-order")
    public String lookUpOrder(Model model) {
        model.addAttribute("page", "cart/look-up-order");
        return "client/main";
    }

    @GetMapping("/show-bill/{maHd}")
    public String lookUpOrder(@PathVariable("maHd") String maHd, Model model) {
        model.addAttribute("codeBill", maHd);
        model.addAttribute("page", "cart/order-success");
        return "client/main";
    }

    @PostMapping("/look-up-order")
    @ResponseBody
    public ResponseEntity<?> getBill(@RequestBody String code) {
        OrderBillDTO bill = orderService.getHoaDonByCode(code);
        return new ResponseEntity<>(ResponseObject.builder().data(bill).build(), HttpStatus.OK);
    }
}
