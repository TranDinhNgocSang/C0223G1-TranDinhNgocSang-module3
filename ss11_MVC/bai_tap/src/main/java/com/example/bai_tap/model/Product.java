package com.example.bai_tap.model;

public class Product {
    private String id;
    private String name;
    private double price;
    private String note;
    private String producer;

    public Product() {
    }

    public Product(String id, String name, double price, String note, String producer) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.note = note;
        this.producer = producer;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

}
