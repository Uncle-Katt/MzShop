package com.example.banson5s.service.client.Impl;

import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.entity.client.IProductItemClient;

import com.example.banson5s.repository.admin.ISanPhamRepository;
import com.example.banson5s.service.client.ISanPhamClientService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamClientServiceImpl extends BaseServiceImpl<SanPham, Long, ISanPhamRepository>
        implements ISanPhamClientService {

    @Override
    public List<IProductItemClient> lstSanPham() {
        return repository.getLstProcutSiteClient();
    }
}
