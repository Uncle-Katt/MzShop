package com.example.banson5s.service.admin;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface IHoaDonService extends IBaseService<HoaDon,Long> {

    List<HoaDon> findAllLstHoaDonSts(String sts);

    HoaDon findHoaDonByCode(String code);

    List<HoaDon> findAllLstHoaDonByCodeAndStsAndType( String value, String type, String sts);
}
