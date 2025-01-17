package com.example.banson5s.controller.admin.dashboard;

import com.example.banson5s.dto.ResponseObject;
import com.example.banson5s.service.admin.Impl.ThongKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class DashboardController {
    @Autowired
    ThongKeService thongKeService;
    @GetMapping(value = {"/home", "", "/"})
    public String home(Model model) {
        model.addAttribute("page", "dashboard/index");
        return "admin/main";
    }

    @GetMapping("/doanh-thu")
    public ResponseEntity<?> doanhThu() {
        return new ResponseEntity<>(ResponseObject.builder()
                .data(thongKeService.getDoanhThu())
                .build(), HttpStatus.OK);
    }

    @GetMapping("/doanh-thu-table")
    public ResponseEntity<?> doanhThuTable() {
        return new ResponseEntity<>(ResponseObject.builder()
                .data(thongKeService.getDoanhThuTable())
                .build(), HttpStatus.OK);
    }

    @GetMapping("/doanh-thu-khoang-ngay")
    public ResponseEntity<?>  getDoanhThuTheoKhoangNgay(@RequestParam String startDate, @RequestParam String endDate) {
        return new ResponseEntity<>(ResponseObject.builder()
                .data(thongKeService.getDoanhThuTheoKhoangNgay(startDate, endDate))
                .build(), HttpStatus.OK);
    }
}
