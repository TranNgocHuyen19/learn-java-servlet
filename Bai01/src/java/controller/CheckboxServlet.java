/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Trần Ngọc Huyền
 */
@WebServlet(name = "CheckboxServlet", urlPatterns = {"/checkbox"})
public class CheckboxServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dai_raw = request.getParameter("dai");
        String rong_raw = request.getParameter("rong");
//        String cv = request.getParameter("cv");
//        String dt = request.getParameter("dt");
        String[] d = request.getParameterValues("d");
        double a, b;
        String msg = "";
        PrintWriter out = response.getWriter();
        try {
            a = Double.parseDouble(dai_raw);
            b = Double.parseDouble(rong_raw);
            //cách 1: 2 check box khác name
//            if(cv == null && dt == null) {
//                msg = "Vui long chon 1 trong 2 chuc nang";
//            } else if (cv != null && dt == null) {
//                msg = "Chu vi: " + (a + b) * 2;
//            } else if (cv == null && dt != null) {
//                msg = "Dien tich: " + (a * b);
//            } else {
//                msg = "Chu vi: " + (a + b) * 2 + " Dien tich: " + (a * b);
//            }
            //cách 2: 2 check box trùng name
            if(d == null) {
                msg = "Vui long chon 1 trong 2 chuc nang";
            } else if(d.length == 2) {
                 msg = "Chu vi: " + (a + b) * 2 + " Dien tich: " + (a * b);
            } else if (d[0].equals("0")) {
                msg = "Chu vi: " + (a + b) * 2;
            } else {
                 msg = "Dien tich: " + (a * b);
            }
            out.println("<h1>" + msg + "</h1>");
        } catch (NumberFormatException e) {
            System.out.println("Vui long nhap so");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("checkbox.html").forward(request, response);
    }

}
