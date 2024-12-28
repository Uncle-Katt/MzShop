package com.example.banson5s.controller.admin.order;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.order.OrderBillDTO;
import com.example.banson5s.dto.admin.order.OrderChangeStatusDTO;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.enums.BillType;
import com.example.banson5s.enums.InvoiceStatus;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/order")
public class OrderController {

    @Autowired
    private IOrderService orderService;

    @GetMapping()
    public String index(Model model) {

        model.addAttribute("CHO_XAC_NHAN", InvoiceStatus.CHO_XAC_NHAN);
        model.addAttribute("DA_XAC_NHAN", InvoiceStatus.DA_XAC_NHAN);
        model.addAttribute("CHO_GIA0", InvoiceStatus.CHO_GIA0);
        model.addAttribute("DANG_GIAO", InvoiceStatus.DANG_GIAO);
        model.addAttribute("HOAN_THANH", InvoiceStatus.HOAN_THANH);
        model.addAttribute("CHO_THANH_TOAN", InvoiceStatus.CHO_THANH_TOAN);
        model.addAttribute("HUY", InvoiceStatus.HUY);

        model.addAttribute("ONLINE", BillType.ONLINE);
        model.addAttribute("OFFLINE", BillType.OFFLINE);
        model.addAttribute("page", "order/index");
        return "admin/main";
    }

    @GetMapping("/{maHd}")
    public String detail(@PathVariable String maHd, Model model) {
        model.addAttribute("codeBill", maHd);
        model.addAttribute("page", "order/detail");
        return "admin/main";
    }

    @PostMapping("/detail")
    @ResponseBody
    public ResponseEntity<?> getBill(@RequestBody String code) {
        OrderBillDTO bill = orderService.getHoaDonByCode(code);
        return new ResponseEntity<>(ResponseObject.builder().data(bill).build(), HttpStatus.OK);
    }

    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<?> getListBill(@RequestParam(value = "value", defaultValue = "") String value,
                                         @RequestParam(value = "type", defaultValue = "") String type,
                                         @RequestParam(value = "sts", defaultValue = "") String sts) {

        return new ResponseEntity<>(ResponseObject.builder()
                .data(orderService.findAllLstHoaDonByCodeAndStsAndType(value, type, sts))
                .build(), HttpStatus.OK);
    }

    @PostMapping("/change-status")
    @ResponseBody
    public ResponseEntity<?> changeStatus(@RequestBody OrderChangeStatusDTO dto) {
       orderService.changeStatusOrder(dto);
        return new ResponseEntity<>(ResponseObject.builder().data(dto).build(), HttpStatus.OK);
    }
}
