/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Trần Ngọc Huyền
 */
public class RadioServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RadioServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RadioServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       request.getRequestDispatcher("radio.html").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String num1_raw = request.getParameter("num1");
        String num2_raw = request.getParameter("num2");
        double a, b;
        String op = request.getParameter("op");
        PrintWriter out = response.getWriter();
        try {
            a = Double.parseDouble(num1_raw);
            b = Double.parseDouble(num2_raw);
            if(op != null) {
                out.println("<h1>" + cal(a, b, op) + "</h1>");
            } else {
                out.println("<h1>" + "Vui long chon phep tinh" + "</h1>");
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    private String cal(double a, double b, String op) {
        String msg = "";
        switch (op) {
            case "+":
                msg = "Tong: " + (a + b);
                break;
            case "-":
                msg = "Hieu: " + (a - b);
                break;
            case "*":
                msg = "Tich: " + (a * b);
                break;
            case "/":
                if(b == 0) {
                    msg = "Khong chia cho 0";
                    break;
                }
                msg = "Thuong: " + (a / b);
                break;
        }
        return msg;
    }
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
