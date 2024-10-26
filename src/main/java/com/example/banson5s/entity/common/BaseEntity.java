package com.example.banson5s.entity.common;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@JsonIgnoreProperties(value = {"xoaMem"}, allowGetters = true)
@MappedSuperclass
public class BaseEntity extends AbstractAuditingEntity {


    @Column(name = "xoa_mem")
    private boolean xoaMem;
}
