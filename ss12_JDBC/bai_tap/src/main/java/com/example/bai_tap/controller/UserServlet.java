package com.example.bai_tap.controller;

import com.example.bai_tap.model.User;
import com.example.bai_tap.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                showUserById(request,response);
                break;
            default:
                showList(request, response);
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
                createNewUser(request,response);
                break;
            case "delete":
                deleteUser(request,response);
                break;
            case "edit":
                editUser(request,response);
                break;
            case "search":
                searchUserByName(request,response);
                break;
            default:
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> list = new ArrayList<>();
        list = userService.getListUser();
        request.setAttribute("list", list);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/User/List.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            request.getRequestDispatcher("/User/create.jsp").forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        try {
            response.sendRedirect("/User/create.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name,email,country);
        userService.createNewUser(user);
        try {
            response.sendRedirect("/UserServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response){
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        userService.deleteUser(idDelete);
        try {
            response.sendRedirect("/UserServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUserById (HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.getUserById(id);
        request.setAttribute("user",user);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/User/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int id = Integer.parseInt(request.getParameter("id"));
        User user = new User(name,email,country);
        userService.updateUser(user,id);
        try {
            response.sendRedirect("/UserServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchUserByName (HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("search");
        List<User> list = userService.searchUserByName(name);
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/User/List.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}