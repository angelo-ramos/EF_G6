package com.example.ef_g6.Servlets;

import com.example.ef_g6.Beans.Empleado;
import com.example.ef_g6.Beans.Rol;
import com.example.ef_g6.Daos.LoginDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action")==null?"lista":request.getParameter("action");
        switch (action){
            case "lista" -> {
                RequestDispatcher view = request.getRequestDispatcher("iniciaSesion.jsp");
                view.forward(request, response);
            }
            case "logout" -> {
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect(request.getContextPath());
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginDao loginDao = new LoginDao();

        Integer dni = Integer.valueOf(request.getParameter("dni"));
        Integer pass = Integer.valueOf(request.getParameter("pass"));
        Integer sal = loginDao.getSal(dni);

        if(pass == dni - sal){
            Empleado usuario = loginDao.getEmpleado(dni);
            HttpSession session = request.getSession();

            if(usuario !=null){
                session.setAttribute("usuarioSesion",usuario);
                ArrayList<Rol> roles = usuario.getRoles();
                Rol rol = roles.get(0);
                Integer idRol = rol.getIdRol();
                session.setAttribute("rol",idRol);
                session.setMaxInactiveInterval(60*60);
                if(idRol == 1){
                    response.sendRedirect(request.getContextPath()+"/AdminServlet");
                }else if(idRol == 2){
                    response.sendRedirect(request.getContextPath()+"/GestorServlet");
                }else{
                    response.sendRedirect(request.getContextPath()+"/VendedorServlet");
                }
            }else{
                request.getSession().setAttribute("msg","Error en contraseña o usuario");
                response.sendRedirect(request.getContextPath());
            }
        }else{
            request.getSession().setAttribute("msg","Error en contraseña o usuario");
            response.sendRedirect(request.getContextPath());
        }
    }
}
