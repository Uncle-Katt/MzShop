package com.example.banson5s.config.jpa;

import com.example.banson5s.entity.common.AbstractAuditingEntity;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

import java.time.LocalDateTime;

public class CustomAuditingEntityListener {
    @PrePersist
    public void setCreatedDate(AbstractAuditingEntity entity) {
        entity.setNgayTao(LocalDateTime.now());
        entity.setNgayTao(LocalDateTime.now());
    }

    @PreUpdate
    public void setModifiedDate(AbstractAuditingEntity entity) {
        entity.setNgayTao(LocalDateTime.now());
    }
}
