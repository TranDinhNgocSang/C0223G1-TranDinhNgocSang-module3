package com.codegym.repository;

import com.codegym.model.Clazz;

import java.util.List;

public interface IClazzRepository  {
    List<Clazz> findAll();
}
