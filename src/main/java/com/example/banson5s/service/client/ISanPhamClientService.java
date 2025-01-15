package com.example.banson5s.service.client;

import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.entity.client.IProductItemClient;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface ISanPhamClientService  extends IBaseService<SanPham,Long> {
    List<IProductItemClient> lstSanPham();
}
