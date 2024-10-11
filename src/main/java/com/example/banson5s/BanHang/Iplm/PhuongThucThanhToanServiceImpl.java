package com.example.banson5s.BanHang.Service;

import com.example.banson5s.BanHang.Entity.PhuongThucThanhToan;
import com.example.banson5s.BanHang.Repository.PhuongThucThanhToanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhuongThucThanhToanServiceImpl implements PhuongThucThanhToanService {

    @Autowired
    private PhuongThucThanhToanRepository repository;

    @Override
    public List<PhuongThucThanhToan> findAll() {
        return repository.findAll();
    }

    @Override
    public PhuongThucThanhToan findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public PhuongThucThanhToan save(PhuongThucThanhToan phuongThucThanhToan) {
        return repository.save(phuongThucThanhToan);
    }

    @Override
    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
