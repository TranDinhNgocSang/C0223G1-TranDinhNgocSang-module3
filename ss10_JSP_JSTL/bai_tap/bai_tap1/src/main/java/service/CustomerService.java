package service;

import model.Customer;
import repository.CustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements  IcustomerService{
    private CustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> getListCustomer() {
        List<Customer> list = new ArrayList<>();
        return list = customerRepository.getListCustomer();
    }
}
