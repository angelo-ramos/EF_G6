package com.example.ef_g6.Daos;

import com.example.ef_g6.Beans.Cadena;
import com.example.ef_g6.Beans.Cartelera;
import com.example.ef_g6.Beans.Cine;
import com.example.ef_g6.Beans.Pelicula;

import java.sql.*;
import java.util.ArrayList;

public class CarteleraDao extends DaoBase {


    public ArrayList<Cartelera> listarCartelera(String idCine) {
        ArrayList<Cartelera> listaCar = new ArrayList<>();
        String sql = "SELECT C.idCartelera, D.nombre,D.idcine,E.nombre_comercial ,D.idcadena ,P.nombre, P.idpelicula, C.3d,C.doblada,C.subtitulada,C.horario FROM cartelera C, pelicula P, cine D, cadena E where C.idpelicula = P.idpelicula and C.idcine = D.idcine and D.idcadena = E.idcadena and C.idcine = ?";
        try (Connection connection = this.obtenerConexion();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1,idCine);

            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    Cartelera cartelera = new Cartelera();
                    Cine cine = new Cine();
                    Cadena cadena = new Cadena();
                    Pelicula pelicula = new Pelicula();
                    cartelera.setIdCartelera(rs.getInt(1));
                    cine.setNombre(rs.getString(2));
                    cine.setIdCine(rs.getInt(3));
                    cadena.setNombreComercial(rs.getString(4));
                    cine.setCadena(cadena);
                    cartelera.setCine(cine);
                    pelicula.setNombre(rs.getString(6));
                    pelicula.setIdPelicula(rs.getInt(7));
                    cartelera.setPelicula(pelicula);
                    cartelera.setTresD(rs.getInt(8));
                    cartelera.setDoblada(rs.getInt(9));
                    cartelera.setSubtitulada(rs.getInt(10));
                    cartelera.setHorario(rs.getString(11));
                    listaCar.add(cartelera);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return listaCar;
    }


}