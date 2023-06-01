package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product("1","pc",200,"good","US"));
        productList.add(new Product("2","lap",300,"good","US"));
        productList.add(new Product("3","pc",500,"good","US"));
        productList.add(new Product("4","lap",400,"good","US"));
        productList.add(new Product("5","phone",700,"good","US"));
    }


    @Override
    public List<Product> getListProduct() {
        return productList;
    }

    @Override
    public void addNewProduct(Product product) {
        productList.add(product);
    }

    @Override
    public Product findProductById(int id) {
        return productList.get(id);
    }

    @Override
    public int findIndexByID(String id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId().equals(id)){
                return i;
            }
        }
        return -1;
    }

    @Override
    public void editProduct(int index, Product product) {
        productList.set(index, product);
    }

    @Override
    public void deleteProduct(int index) {
        productList.remove(index);
    }

    @Override
    public Product getSearch(String name) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().equals(name)){
                return productList.get(i);
            }
        }
        return null;
    }

    @Override
    public List<Product> getListSearch(String name) {
        List<Product> list = new ArrayList<>();
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().contains(name)){
                list.add(productList.get(i));
            }
        }
        return list;
    }

}