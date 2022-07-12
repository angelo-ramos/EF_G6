package com.example.ef_g6.Servlets;

import com.example.ef_g6.Daos.CarteleraDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CarteleraServlet", value = "/CarteleraServlet")
public class CarteleraServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CarteleraDao carteleraDao = new CarteleraDao();

        switch(action){
            case "listar" ->{
                request.setAttribute("cartelera", carteleraDao.listarCartelera("3"));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Cartelera.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
