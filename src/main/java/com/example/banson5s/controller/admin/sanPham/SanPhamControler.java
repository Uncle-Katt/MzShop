package com.example.banson5s.controller.admin.sanPham;

//import com.example.banson5s.repository.admin.IDanhMucRepo;
//import com.example.banson5s.repository.admin.ISanPhamRepository;
//import com.example.banson5s.repository.admin.IThuongHieuRepo;
//import com.example.banson5s.repository.admin.IXuatXuRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/sanpham")
public class SanPhamControler {
//    @Autowired
//    private ISanPhamRepository spRepo;

//    @Autowired
//    private IDanhMucRepo dmRepo;
//
//    @Autowired
//    private IXuatXuRepo xxRepo;
//
//    @Autowired
//    private IThuongHieuRepo thRepo;

    @GetMapping()
    public String hienThi(Model model) {
        model.addAttribute("page", "sanPham/san_pham/index");
//        model.addAttribute("dsSanPham", spRepo.findAll());
//        model.addAttribute("dsDanhMuc", dmRepo.findAll());
//        model.addAttribute("dsXuatXu", xxRepo.findAll());
//        model.addAttribute("dsThuongHieu", thRepo.findAll());
        return "admin/main";
    }

    @GetMapping("/create")
    public String createSanPhamPage(Model model) {
        // Add necessary data to the model if needed
        return "admin/main"; // Tên file JSP được trả về
    }


//    @PostMapping("/create")
//    public String create(@ModelAttribute KhachHangDTO req) {
////        customerService.createCustomer(req);
//        return "redirect:/admin/sanpham";
//    }
//    @PostMapping("/add")
//    public String add(SanPham sp) {
//        spRepo.save(sp);
//         // Chuyển hướng sau khi thêm thành công
//    }


}
