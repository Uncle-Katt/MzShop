package com.example.banson5s.controller.admin.sales;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.dto.admin.sales.ProductInvoicesDTO;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.service.admin.ISalesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/sales")
public class SalesController {

    @Autowired
    private ISalesService salesService;

    @GetMapping()
    public String index(Model model) {
        model.addAttribute("page", "sales/index");
        return "admin/main";
    }

    @GetMapping("/products")
    @ResponseBody
    public ResponseEntity<?> getLstProducts(Model model) {
        List<SanPhamChiTiet> lst =  salesService.lstSanPhamChiTiet();
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }

    @GetMapping("/invoices")
    @ResponseBody
    public ResponseEntity<?> getLstBill() {
        List<HoaDon> lst =  salesService.lstHoaDon();
        return new ResponseEntity<>(ResponseObject.builder().data(lst).build(), HttpStatus.OK);
    }

    @GetMapping("/create-invoices")
    @ResponseBody
    public ResponseEntity<?> createBill() {
        HoaDon hoaDon =  salesService.createHoaDon();
        return new ResponseEntity<>(ResponseObject.builder().data(hoaDon).build(), HttpStatus.OK);
    }

    @PostMapping("/invoices-show")
    @ResponseBody
    public ResponseEntity<?> getShowBillItem(@RequestBody Long idHoaDon) {
        return new ResponseEntity<>(ResponseObject.builder().data(salesService.lstHoaDonChiTiet(idHoaDon)).build(), HttpStatus.OK);
    }

    @PostMapping("/product-to-invoices")
    @ResponseBody
    public ResponseEntity<?> getProductInvoices(@RequestBody ProductInvoicesDTO request) {
        salesService.addSanPhamToHoaDon(request);
        return new ResponseEntity<>(ResponseObject.builder().data(true).build(), HttpStatus.OK);
    }

    @PostMapping("/delete-product")
    @ResponseBody
    public ResponseEntity<?> deleteProductInvoices(@RequestBody Long productId) {
        salesService.deleteProduct(productId);
        return new ResponseEntity<>(ResponseObject.builder().data(productId).build(), HttpStatus.OK);
    }
    @PostMapping("/delete-all-product")
    @ResponseBody
    public ResponseEntity<?> deleteAllProductInvoices(@RequestBody Long billId) {
        salesService.deleteAllProduct(billId);
        return new ResponseEntity<>(ResponseObject.builder().data(billId).build(), HttpStatus.OK);
    }

    @PostMapping("/delete-invoices")
    @ResponseBody
    public ResponseEntity<?> deleteInvoices(@RequestBody Long billId) {
        salesService.deleteHoaDon(billId);
        return new ResponseEntity<>(ResponseObject.builder().data(billId).build(), HttpStatus.OK);
    }
}
