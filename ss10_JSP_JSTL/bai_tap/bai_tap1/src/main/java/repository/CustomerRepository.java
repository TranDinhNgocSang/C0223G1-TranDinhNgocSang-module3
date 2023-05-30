package repository;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements IcustomerRepository{
    private static List<Customer> list = new ArrayList<>();
    static {
        list.add(new Customer("Sang","1998-01-20","Đà Nẵng","https://smilemedia.vn/wp-content/uploads/2022/09/cach-chup-hinh-the-dep.jpeg"));
        list.add(new Customer("Quốc","1995-01-20","Đà Nẵng","https://smilemedia.vn/wp-content/uploads/2022/09/cach-chup-hinh-the-dep.jpeg"));
        list.add(new Customer("Tài","2002-01-20","Huế","https://smilemedia.vn/wp-content/uploads/2022/09/cach-chup-hinh-the-dep.jpeg"));
        list.add(new Customer("Cao","1988-01-20","Quảng Nam","https://smilemedia.vn/wp-content/uploads/2022/09/cach-chup-hinh-the-dep.jpeg"));
        list.add(new Customer("Thành","2000-01-20","Đà Nẵng","https://smilemedia.vn/wp-content/uploads/2022/09/cach-chup-hinh-the-dep.jpeg"));
    }

    @Override
    public List<Customer> getListCustomer() {
        return list;
    }
}
