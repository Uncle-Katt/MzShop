package com.example.banson5s.repository.common;

import com.example.banson5s.entity.common.BaseEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

@NoRepositoryBean
public interface IBaseRepository<T extends BaseEntity, ID extends Serializable>
        extends JpaRepository<T, ID>, JpaSpecificationExecutor<T> {
    @Query("select e from #{#entityName} e where e.id = ?1 and e.xoaMem = false")
    Optional<T> findByIdAndDeletedFalse(ID id);

    @Query("select e from #{#entityName} e where e.xoaMem = false ORDER BY e.ngayTao DESC")
    List<T> findAllByDeletedIsFalse();
}

