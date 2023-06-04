package com.codegym.repository;

import com.codegym.model.Student;

import java.util.List;

public interface IStudentRepository  {
    List<Student> findAll();
    boolean add(Student student);
}
