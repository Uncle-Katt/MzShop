package com.example.banson5s.entity.common;

import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.io.Serializable;
import java.time.LocalDateTime;

@Getter
@Setter
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class AbstractAuditingEntity  implements Serializable {
    @CreatedBy
    @Column(name = "nguoi_tao", updatable = false)
    private String nguoiTao;

    @CreatedDate
    @Column(name = "ngay_tao", updatable = false)
    private LocalDateTime ngayTao;

    @LastModifiedBy
    @Column(name = "nguoi_sua", updatable = false)
    private String nguoiSua;

    @LastModifiedDate
    @Column(name = "ngay_sua", updatable = false)
    private LocalDateTime ngaySua;
}
