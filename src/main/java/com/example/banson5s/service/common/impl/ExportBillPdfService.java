package com.example.banson5s.service.common.impl;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.service.admin.IHoaDonService;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Service
public class ExportBillPdfService {
    @Autowired
    IHoaDonService hoaDonService;

    public byte[] generateInvoice(String maHd) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        HoaDon hoaDon = hoaDonService.findHoaDonByCode(maHd);
        if (hoaDon == null) {
            throw new Exception("Hóa đơn không tồn tại");
        }
        List<HoaDonChiTiet> items = hoaDon.getLstHoaDonChiTiet().stream().toList();

        try (ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            PdfFont vietnameseFont = PdfFontFactory.createFont("src/main/resources/Roboto/Roboto-Bold.ttf", "Identity-H");
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            // Thêm tiêu đề hóa đơn
            document.add(new Paragraph("Hóa Đơn")
                    .setFont(vietnameseFont)
                    .setFontSize(20)
                    .setBold()
                    .setTextAlignment(TextAlignment.CENTER)
                    .setMarginBottom(10));

            // Thêm thông tin khách hàng và ngày hóa đơn
            addParagraph(document, "Mã Hóa Đơn: " + maHd, vietnameseFont);
            if (hoaDon.getTenNguoiNhan() != null) {
                addParagraph(document, "Khách Hàng: " + hoaDon.getTenNguoiNhan(), vietnameseFont);
            }
            if (hoaDon.getSoDienThoaiNguoiNhan() != null) {
                addParagraph(document, "Số Điện Thoại: " + hoaDon.getSoDienThoaiNguoiNhan(), vietnameseFont);
            }
            if (hoaDon.getDiaChiNguoiNhan() != null) {
                addParagraph(document, "Địa Chỉ: " + hoaDon.getDiaChiNguoiNhan(), vietnameseFont);
            }
            if (hoaDon.getNgayDat() != null) {
                // Define the desired format
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                // Format the LocalDateTime
                addParagraph(document, "Ngày Đặt: " + hoaDon.getNgayDat().format(formatter), vietnameseFont);
            }
            document.add(new Paragraph("\n\n"));

            // Tạo bảng cho danh sách sản phẩm
            Table table = new Table(new float[]{1, 5, 2, 2, 2});
            // Set the table width to 100%
            table.setWidth(UnitValue.createPercentValue(100));
            table.addHeaderCell(new Cell().add(new Paragraph("STT").setBold().setFont(vietnameseFont)
                    .setBold()
                    .setTextAlignment(TextAlignment.CENTER)));
            table.addHeaderCell(new Cell().add(new Paragraph("Sản Phẩm").setBold().setFont(vietnameseFont)
                    .setTextAlignment(TextAlignment.CENTER)));
            table.addHeaderCell(new Cell().add(new Paragraph("Đơn Giá").setBold().setFont(vietnameseFont)
                    .setTextAlignment(TextAlignment.CENTER)));
            table.addHeaderCell(new Cell().add(new Paragraph("Số Lượng").setBold().setFont(vietnameseFont)
                    .setTextAlignment(TextAlignment.CENTER)));
            table.addHeaderCell(new Cell().add(new Paragraph("Tổng Tiền").setBold().setFont(vietnameseFont)
                    .setTextAlignment(TextAlignment.CENTER)));

            int index = 1;
            for (HoaDonChiTiet item : items) {
                table.addCell(String.valueOf(index++)).setFont(vietnameseFont)
                        .setTextAlignment(TextAlignment.CENTER);
                String sanPham = item.getSanPhamChiTiet().getSanPham().getTenSanPham() +
                        " (" + item.getSanPhamChiTiet().getMauSac().getTenMauSac() + " - " +
                        item.getSanPhamChiTiet().getKhoiLuong().getTenKhoiLuong() + ")";
                table.addCell(sanPham).setFont(vietnameseFont)
                        .setTextAlignment(TextAlignment.CENTER);
                table.addCell(formatCurrency(item.getGiaBan())).setFont(vietnameseFont)
                        .setTextAlignment(TextAlignment.CENTER);
                table.addCell(String.valueOf(item.getSoLuong())).setFont(vietnameseFont)
                        .setTextAlignment(TextAlignment.CENTER);
                BigDecimal total = item.getGiaBan().multiply(BigDecimal.valueOf(item.getSoLuong()));
                table.addCell(formatCurrency(total)).setFont(vietnameseFont)
                        .setTextAlignment(TextAlignment.CENTER);
            }

            document.add(table);
            document.add(new Paragraph("\n"));

            // Thêm tổng tiền
            addTotalSection(document, hoaDon, vietnameseFont);

            // Đóng tài liệu
            document.close();
            return out.toByteArray();
        }
    }

    private void addParagraph(Document document, String text, PdfFont font) {
        document.add(new Paragraph(text).setFontSize(12).setFont(font));
    }

    private String formatCurrency(BigDecimal amount) {
        // Set the locale to Vietnam
        NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return formatter.format(amount);
    }

    private void addTotalSection(Document document, HoaDon hoaDon, PdfFont font) {
        document.add(new Paragraph("Tổng Tiền: " + formatCurrency(hoaDon.getTongTien()))
                .setBold().setTextAlignment(TextAlignment.RIGHT).setFont(font));
        document.add(new Paragraph("Tiền Giảm: " + formatCurrency(hoaDon.getTienGiam()))
                .setBold().setTextAlignment(TextAlignment.RIGHT).setFont(font));
        document.add(new Paragraph("Phí Ship: " + formatCurrency(hoaDon.getPhiVanChuyen()))
                .setBold().setTextAlignment(TextAlignment.RIGHT).setFont(font));
        document.add(new Paragraph("Thành Tiền: " + formatCurrency(hoaDon.getThanhTien()))
                .setBold().setTextAlignment(TextAlignment.RIGHT).setFont(font));
    }
}