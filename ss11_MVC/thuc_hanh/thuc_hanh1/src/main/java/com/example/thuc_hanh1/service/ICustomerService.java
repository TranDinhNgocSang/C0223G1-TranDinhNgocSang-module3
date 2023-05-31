package com.example.thuc_hanh1.service;

import com.example.thuc_hanh1.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();

    void save (Customer customer);

    Customer findById (int id);

    void update (int id, Customer customer);

    void remove (int id);
}
