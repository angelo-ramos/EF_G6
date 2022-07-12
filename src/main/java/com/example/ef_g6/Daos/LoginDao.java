package com.example.ef_g6.Daos;

import com.example.ef_g6.Beans.*;

import java.sql.*;
import java.util.ArrayList;

public class LoginDao extends DaoBase{
    public Integer getSal(Integer dni){
        Integer sal = null;
        String sql = "SELECT e.salario FROM empleado e WHERE e.dni = ?;";
        try (Connection connection = this.obtenerConexion();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, String.valueOf(dni));

            try(ResultSet rs = pstmt.executeQuery();){
                if (rs.next()){
                    sal = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sal;
    }
    public Empleado getEmpleado(Integer dni){
        Empleado user = new Empleado();
        Rol rol = new Rol();
        String sql = "SELECT e.nombre, e.apellido, r.nombre FROM empleado e, rolempleado re, rol r\n" +
                "WHERE e.idempleado = re.idempleado\n" +
                "AND re.idrol = r.idrol\n" +
                "AND e.dni = ?;";
        try (Connection connection = this.obtenerConexion();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, String.valueOf(dni));

            try(ResultSet rs = pstmt.executeQuery();){
                if (rs.next()){
                    user.setNombre(rs.getString(1));
                    user.setApellido(rs.getString(2));
                    rol.setIdRol(rs.getInt(3));
                    rol.setNombre(rs.getString(4));
                    ArrayList <Rol> roles = new ArrayList<>();
                    roles.add(rol);
                    user.setRoles(roles);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}


