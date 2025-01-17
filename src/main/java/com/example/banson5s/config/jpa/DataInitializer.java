package com.example.banson5s.config.jpa;

import com.example.banson5s.entity.admin.ChucVu;
import com.example.banson5s.repository.admin.IChucVuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    IChucVuRepository chucVuRepository;

    @Override
    public void run(String... args) throws Exception {
        Optional<ChucVu> chucVu = chucVuRepository.findChucVuByTenChucVu("NHAN_VIEN");
        if (chucVu.isEmpty()) {
            ChucVu cv = ChucVu.builder()
                   .tenChucVu("NHAN_VIEN")
                   .build();
            chucVuRepository.save(cv);
            System.out.println("Chuc vu 'NHAN_VIEN' created");
        }
        Optional<ChucVu> admin = chucVuRepository.findChucVuByTenChucVu("ADMIN");
        if (admin.isEmpty()) {
            ChucVu cv = ChucVu.builder()
                    .tenChucVu("ADMIN")
                    .build();
            chucVuRepository.save(cv);
            System.out.println("Chuc vu 'ADMIN' created");
        }
    }
}
