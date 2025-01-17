package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.ChucVu;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IChucVuRepository extends JpaRepository<ChucVu,Long> {
    Optional<ChucVu> findChucVuByTenChucVu(String tenChucVu);
}
