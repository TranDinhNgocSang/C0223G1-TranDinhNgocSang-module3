package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getListProduct();

    void addNewProduct(Product product);

    Product findProductById(int id);

    int findIndexByID(String id);

    void editProduct(int index, Product product);

    void deleteProduct(int index);

    Product getSearch(String name);

    List<Product> getListSearch(String name);
}
