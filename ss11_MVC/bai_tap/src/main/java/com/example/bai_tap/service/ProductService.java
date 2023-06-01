package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;
import com.example.bai_tap.repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getListProduct() {
        return productRepository.getListProduct();
    }

    @Override
    public void addNewProduct(Product product) {
        productRepository.addNewProduct(product);
    }

    @Override
    public Product findProductById(int id) {
        return productRepository.findProductById(id);
    }

    @Override
    public int findIndexByID(String id) {
        return productRepository.findIndexByID(id);
    }

    @Override
    public void editProduct(int index, Product product) {
        productRepository.editProduct(index,product);
    }

    @Override
    public void deleteProduct(int index) {
        productRepository.deleteProduct(index);
    }

    @Override
    public Product getSearch(String name) {
        return productRepository.getSearch(name);
    }

    @Override
    public List<Product> getListSearch(String name) {
        return  productRepository.getListSearch(name);

    }
}
