package com.example.banson5s.ChucNang.Iplm;

import com.example.banson5s.ChucNang.Entity.PhieuGiamGia;
import com.example.banson5s.ChucNang.Repositorty.PhieuGiamGiaRepository;
import com.example.banson5s.ChucNang.Service.PhieuGiamGiaService;
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
    public PhieuGiamGia layTheoId(Integer id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public PhieuGiamGia luu(PhieuGiamGia phieuGiamGia) {
        return repository.save(phieuGiamGia);
    }

    @Override
    public PhieuGiamGia capNhat(PhieuGiamGia phieuGiamGia) {
        return repository.save(phieuGiamGia);
    }

    @Override
    public void xoaTheoId(Integer id) {
        repository.deleteById(id);
    }


}
