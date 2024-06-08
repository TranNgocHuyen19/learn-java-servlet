/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Trần Ngọc Huyền
 */
@WebServlet(name = "EX03ConvertMoneyServlet", urlPatterns = {"/ex03"})
public class EX03ConvertMoneyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet EX03ConvertMoneyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EX03ConvertMoneyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("ex03convertvndtousdandyen.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String money_raw = request.getParameter("money");
//        String change = request.getParameter("convert");
//        String[] changes = request.getParameterValues("convert");
        String change = request.getParameter("convert");

        String usds = getServletContext().getInitParameter("usd");
        String yens = getServletContext().getInitParameter("yen");

//        PrintWriter out = response.getWriter();
        double money, usd, yen;
        try {
            money = Double.parseDouble(money_raw);
            usd = Double.parseDouble(usds);
            yen = Double.parseDouble(yens);
//            double moneyChange;
            String result;
//            if (changes == null) {
//                result = "Bạn vui lòng chọn định giá tiền muốn đổi";
//            } else if (changes.length == 1) {
//                if (changes[0].equals("0")) {
//                    result = "Đổi sang USD: " + (money / usd);
//                } else {
//                    result = "Đổi sang Yên: " + (money / yen);
//                }
//            } else {
//                result = "Đổi sang USD: " + (money / usd) + "Đổi sang Yên: " + (money / yen);
//            }

            if (change.equals("0")) {
                result = "Đổi sang USD: " + (money / usd);
            } else {
                result = "Đổi sang Yên: " + (money / yen);
            }

//            out.println("Tien: " + moneyChange);
//            request.setAttribute("money", moneyChange);
            request.setAttribute("result", result);
            request.getRequestDispatcher("ex03convertvndtousdandyen.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Vui lòng nhập số");
            request.getRequestDispatcher("ex03convertvndtousdandyen.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

<<<<<<< HEAD
}
=======
}
>>>>>>> lesson3
