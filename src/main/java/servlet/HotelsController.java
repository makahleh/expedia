/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import servlet.Hotel;
import servlet.Offers;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author makahleh
 */
@WebServlet(name = "HotelsController", urlPatterns = {"/HotelsController"})
public class HotelsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  

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
        String id=request.getParameter("show");
        String DestinationCity=request.getParameter("DestinationCity");
        String MinTripDate=request.getParameter("MinTripDate");
        String MaxTripDate=request.getParameter("MaxTripDate");
        String lengthOfStay=request.getParameter("lengthOfStay");
        String MinGuestRating=request.getParameter("MinGuestRating");
        String MaxGuestRating=request.getParameter("MaxGuestRating");
       Offers offer=new Offers();
        offer.FillHotelsList(DestinationCity,MinTripDate,MaxTripDate,lengthOfStay,MinGuestRating,MaxGuestRating);
        request.setAttribute("Hotels", offer.hotels);
        
        if(id!=null)
        {
            if(! id.isEmpty())
            {
                Hotel hotel=offer.showHotelDetails(offer.hotels,id);
                request.setAttribute("hotel", hotel);
                RequestDispatcher veiw=request.getRequestDispatcher("/showHotelDetails.jsp");
                veiw.forward(request,response);
            }
        }
        RequestDispatcher veiw=request.getRequestDispatcher("/Hotels.jsp");
         veiw.forward(request,response);
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
