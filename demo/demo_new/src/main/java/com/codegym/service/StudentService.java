package com.codegym.service;

import com.codegym.model.Student;
import com.codegym.repository.ClazzRepository;
import com.codegym.repository.IClazzRepository;
import com.codegym.repository.IStudentRepository;
import com.codegym.repository.StudentRepository;

import java.util.List;

public class StudentService  implements IStudentService{
    private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public boolean add(Student student) {
        return studentRepository.add(student);
    }
}
