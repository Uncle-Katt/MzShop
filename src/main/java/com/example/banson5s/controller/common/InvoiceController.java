package com.example.banson5s.controller.common;

import com.example.banson5s.service.common.impl.ExportBillPdfService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/invoice")
public class InvoiceController {

    @Autowired
    ExportBillPdfService exportBillPdfService;

    @GetMapping("/print/{maHd}")
    public ResponseEntity<?> printInvoice(@PathVariable("maHd") String maHd) {
        try {
            // Gọi service để tạo file hóa đơn
            byte[] invoiceData = exportBillPdfService.generateInvoice(maHd);

            // Tạo response trả về file
            ByteArrayResource resource = new ByteArrayResource(invoiceData);

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=invoice_" + maHd + ".pdf")
                    .contentType(MediaType.APPLICATION_PDF)
                    .contentLength(invoiceData.length)
                    .body(resource);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(null);
        }
    }
}