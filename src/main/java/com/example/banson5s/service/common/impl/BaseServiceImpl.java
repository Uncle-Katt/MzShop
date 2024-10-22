package com.example.banson5s.service.common.impl;

import com.example.banson5s.entity.common.BaseEntity;
import com.example.banson5s.repository.common.IBaseRepository;
import com.example.banson5s.service.common.IBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

public class BaseServiceImpl<E extends BaseEntity, ID extends Serializable, R extends IBaseRepository<E, ID>>
        implements IBaseService<E, ID> {

    protected R repository;

    @Autowired
    public void setRepository(R repository) {
        this.repository = repository;
    }

    @Override
    public E createNew(E entity) {
        entity.setXoaMem(false);
        return repository.save(entity);
    }

    @Override
    public E update(E entity) {
        return repository.save(entity);
    }

    @Override
    public void physicalDelete(ID id) {
        repository.deleteById(id);
    }

    @Override
    public void delete(ID id) {
        E entity = repository.findById(id).orElseThrow(IllegalArgumentException::new);
        delete(entity);
    }

    @Override
    public void delete(E entity) {
        entity.setXoaMem(true);
        repository.save(entity);
    }

    @Override
    public Optional<E> findById(ID id) {
        return repository.findByIdAndDeletedFalse(id);
    }

    @Override
    public List<E> findAllLst() {
        return repository.findAllByDeletedIsFalse();
    }

    @Override
    public Boolean existsById(ID id) {
        return existsById(id);
    }

    @Override
    public Page<E> findAll(Specification<E> spec, Pageable page) {
        return repository.findAll(spec, page);
    }

    @Override
    public Page<E> findAllDeletedFalse(Pageable page) {
        return null;
    }
}
