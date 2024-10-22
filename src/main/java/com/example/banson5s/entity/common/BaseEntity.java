package com.example.banson5s.entity.common;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
public class BaseEntity extends AbstractAuditingEntity {


    @Column(name = "xoa_mem")
    private boolean xoaMem;
}
