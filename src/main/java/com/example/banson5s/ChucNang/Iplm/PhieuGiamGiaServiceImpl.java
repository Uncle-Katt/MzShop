package com.example.banson5s.ChucNang.Service;

import com.example.banson5s.ChucNang.Entity.PhieuGiamGia;
import com.example.banson5s.BanHang.Repository.PhieuGiamGiaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhieuGiamGiaServiceImpl implements PhieuGiamGiaService {

    @Autowired
    private PhieuGiamGiaRepository repository;

    @Override
    public List<PhieuGiamGia> layTatCa() {
        return repository.findAll();
    }

    @Override
    public PhieuGiamGia layTheoId(Long id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public PhieuGiamGia luu(PhieuGiamGia phieuGiamGia) {
        return repository.save(phieuGiamGia);
    }

    @Override
    public void xoaTheoId(Long id) {
        repository.deleteById(id);
    }
}
