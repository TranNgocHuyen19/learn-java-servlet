/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Trần Ngọc Huyền
 */
@WebServlet(name="SearchProductServlet", urlPatterns={"/searchproduct"})
public class SearchProductServlet extends HttpServlet {
   
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
            out.println("<title>Servlet SearchProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchProductServlet at " + request.getContextPath () + "</h1>");
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
        CategoryDAO cdb = new CategoryDAO();
        ProductDAO pdb = new ProductDAO();
        List<Category> list = cdb.getAll();
        request.setAttribute("listcat", list);
        String cid_raw = request.getParameter("key");
        String key = request.getParameter("key2");   
        String fromPrice_raw = request.getParameter("fromprice");
        String toPrice_raw = request.getParameter("toprice");
        String fromDate_raw = request.getParameter("fromdate");
        String toDate_raw = request.getParameter("todate");
        double fromPrice, toPrice;
        LocalDate fromDate, toDate;
        int cid;
        try {
            cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
            fromPrice = ((fromPrice_raw == null) || 
                    (fromPrice_raw.equals("")))? null : 
                    Double.parseDouble(fromPrice_raw);
            
            toPrice = ((toPrice_raw == null) || 
                    (toPrice_raw.equals("")))? null : 
                    Double.parseDouble(toPrice_raw);
            
            DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            
            fromDate = ((fromDate_raw == null) || 
                    (fromDate_raw.equals("")))? null : 
                    LocalDate.parse(fromDate_raw, df);
            toDate = ((toDate_raw == null) || 
                    (toDate_raw.equals("")))? null : 
                    LocalDate.parse(toDate_raw, df);
            List<Product> products = pdb.search(key, fromDate, toDate, fromPrice,toPrice , cid);
            request.setAttribute("products", products);
            request.getRequestDispatcher("searchproduct.jsp").forward(request, response);
        } catch (NumberFormatException | DateTimeParseException e) {
        }
        
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
        processRequest(request, response);
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
