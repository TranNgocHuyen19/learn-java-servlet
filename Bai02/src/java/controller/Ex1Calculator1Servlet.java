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
import java.text.DecimalFormat;

/**
 *
 * @author Trần Ngọc Huyền
 */
@WebServlet(name = "Calculator1Servlet", urlPatterns = {"/calculator1"})
public class Ex1Calculator1Servlet extends HttpServlet {

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
            out.println("<title>Servlet Calculator1Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Bài 1: FE: JSP, BE:Servlet</h1>\n"
                    + "        <form action=\"cal\" method=\"post\">\n"
                    + "            Enter radius: <input type=\"text\" name=\"r\"><br/>\n"
                    + "            <input type=\"submit\" value=\"SUBMIT\">\n"
                    + "        </form>");
            if (request.getAttribute("dt") != null) {
                //nó gửi về là 1 object phải đổi sang kiểu double
                String s = (String) request.getAttribute("dt");
                out.println("<h2>Diện tích: " + s + "</h2>");
            }
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
        processRequest(request, response);
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
        if (request.getParameter("r") != null) {
            String r_raw = request.getParameter("r");
            double r;
            try {
                r = Double.parseDouble(r_raw);
                double s = r * r * Math.PI;
                DecimalFormat f = new DecimalFormat("##.##");
                String ss = f.format(s);
                //gửi đối tượng
                request.setAttribute("dt", ss);
                request.getRequestDispatcher("calculator1").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
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

}
