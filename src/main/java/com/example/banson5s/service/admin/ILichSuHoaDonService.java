package com.example.banson5s.service.admin;

import com.example.banson5s.entity.admin.LichSuHoaDon;
import com.example.banson5s.service.common.IBaseService;


public interface ILichSuHoaDonService extends IBaseService<LichSuHoaDon,Long> {
    boolean deleteLichSuHoaDonByHoaDon(Long id);
}
