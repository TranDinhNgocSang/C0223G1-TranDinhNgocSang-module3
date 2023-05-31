package com.example.thuc_hanh1.service;

import com.example.thuc_hanh1.model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService{
    private static Map<Integer,Customer> customerMap = new HashMap<>();
    static {
        customerMap.put(1,new Customer(1,"Sang","sang@gmail.com","da nang"));
        customerMap.put(2,new Customer(2,"Trang","trang@gmail.com","da nang"));
        customerMap.put(3,new Customer(3,"Duyên","duyen@gmail.com","hue"));
        customerMap.put(4,new Customer(4,"Quốc","quoc@gmail.com","da nang"));
        customerMap.put(5,new Customer(5,"Tài","tai@gmail.com","hue"));
        customerMap.put(6,new Customer(6,"Quý","quy@gmail.com","quang nam"));
    }

    @Override
    public List<Customer> findAll() {
        List<Customer> list = new ArrayList<>();
        list.addAll(customerMap.values());
        return list;
    }

    @Override
    public void save(Customer customer) {
        customerMap.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customerMap.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customerMap.put(id, customer);
    }

    @Override
    public void remove(int id) {
        customerMap.remove(id);
    }
}
