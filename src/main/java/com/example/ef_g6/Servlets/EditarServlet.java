package com.example.ef_g6.Servlets;

import com.example.ef_g6.Daos.CarteleraDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditarServlet", value = "/EditarServlet")
public class EditarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "editar" : request.getParameter("a");
        CarteleraDao carteleraDao = new CarteleraDao();

        switch(action){
            case "editar" ->{
                String id = request.getParameter("id");
                request.setAttribute("funcion",carteleraDao.mostrarFuncion(id));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditarFuncion.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
