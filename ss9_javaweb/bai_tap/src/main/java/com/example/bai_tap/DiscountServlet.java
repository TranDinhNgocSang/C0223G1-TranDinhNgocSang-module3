package com.example.bai_tap;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/DiscountServlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String description = request.getParameter("description");
double price = Double.parseDouble(request.getParameter("price"));
double percent = Double.parseDouble(request.getParameter("percent"));
double discountAmount = price*percent*0.01;
double discountPrice = price - discountAmount;
request.setAttribute("description",description);
request.setAttribute("price",price);
request.setAttribute("percent",percent);
request.setAttribute("discountAmount",discountAmount);
request.setAttribute("discountPrice",discountPrice);
request.getRequestDispatcher("display-discount.jsp").forward(request,response);
}
}
