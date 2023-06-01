package com.example.bai_tap.controller;

import com.example.bai_tap.model.Product;
import com.example.bai_tap.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Product")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                showViewProduct(request,response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                showSearch(request,response);
                break;
            default:
                break;
        }
    }

    private void showSearch (HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
//        Product Product = productService.getSearch(name);
        List<Product> products =productService.getListSearch(name);
        request.setAttribute("list",products);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/product/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> list = productService.getListProduct();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("/product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("/product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String note = request.getParameter("note");
        String producer = request.getParameter("producer");
        productService.addNewProduct(new Product(id, name, price, note, producer));
        try {
            response.sendRedirect("/Product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Product product = new Product();
        int index = productService.findIndexByID(id);
        product = productService.findProductById(index);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/product/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String note = request.getParameter("note");
        String producer = request.getParameter("producer");
        int index = productService.findIndexByID(id);
        Product product = productService.findProductById(index);
        product.setName(name);
        product.setPrice(price);
        product.setNote(note);
        product.setProducer(producer);
//        Product product = new Product(id,name,price,note,producer);
//       productService.editProduct(index,product);
        try {
            response.sendRedirect("/Product");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Product product = productService.findProductById(productService.findIndexByID(id));
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/product/delete.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        productService.deleteProduct(productService.findIndexByID(id));
        try {
            response.sendRedirect("/Product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showViewProduct(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
        Product product = productService.findProductById(productService.findIndexByID(id));
        request.setAttribute("product",product);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/product/view.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
