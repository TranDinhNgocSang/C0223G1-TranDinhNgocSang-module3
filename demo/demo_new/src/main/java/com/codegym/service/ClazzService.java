package com.codegym.service;

import com.codegym.model.Clazz;
import com.codegym.repository.ClazzRepository;
import com.codegym.repository.IClazzRepository;

import java.util.List;

public class ClazzService implements IClazzService {
    private IClazzRepository clazzRepository = new ClazzRepository();
    @Override
    public List<Clazz> findAll() {
        return clazzRepository.findAll();
    }
}
