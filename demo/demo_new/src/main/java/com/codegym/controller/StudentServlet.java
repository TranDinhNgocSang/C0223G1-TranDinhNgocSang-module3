package com.codegym.controller;

import com.codegym.model.Clazz;
import com.codegym.model.Student;
import com.codegym.service.ClazzService;
import com.codegym.service.IClazzService;
import com.codegym.service.IStudentService;
import com.codegym.service.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private IStudentService studentService = new StudentService();
    private IClazzService clazzService = new ClazzService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "create":
                showCreateForm(request,response);
                break;
            case "delete":
                break;
            default:
                showList(request,response);

        }

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Clazz> clazzList = clazzService.findAll();
        request.setAttribute("classList", clazzList);
        try {
            request.getRequestDispatcher("view/student/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> studentList = studentService.findAll();
        request.setAttribute("studentList",studentList);
        request.getRequestDispatcher("view/student/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "create":
                break;
            case "delete":
                break;
            default:

        }
    }
}
