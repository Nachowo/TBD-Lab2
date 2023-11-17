package com.Grupo6.Lab1.models;

import java.awt.*;

public class Emergencia {
    private Long idEmergencia;
    private String nombreEmergencia;
    private Long idInstitucion;
    private double latitud;
    private double longitud;
    private Point geom;

    public Emergencia(Long idEmergencia, String nombreEmergencia, Long idInstitucion, double latitud, double longitud) {
        this.idEmergencia = idEmergencia;
        this.nombreEmergencia = nombreEmergencia;
        this.idInstitucion = idInstitucion;
        this.latitud = latitud;
        this.longitud = longitud;
    }

    public Long getIdEmergencia() {
        return idEmergencia;
    }

    public void setIdEmergencia(Long idEmergencia) {
        this.idEmergencia = idEmergencia;
    }

    public String getNombreEmergencia() {
        return nombreEmergencia;
    }

    public void setNombreEmergencia(String nombreEmergencia) {
        this.nombreEmergencia = nombreEmergencia;
    }

    public Long getIdInstitucion() {
        return idInstitucion;
    }

    public void setIdInstitucion(Long idInstitucion) {
        this.idInstitucion = idInstitucion;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public Point getGeom() {
        return geom;
    }

    public void setGeom(Point geom) {
        this.geom = geom;
    }

    @Override
    public String toString() {
        return "Emergencia{" +
                "idEmergencia=" + idEmergencia +
                ", nombreEmergencia='" + nombreEmergencia + '\'' +
                ", idInstitucion=" + idInstitucion +
                ", latitud=" + latitud +
                ", longitud=" + longitud +
                ", geom=" + geom +
                '}';
    }
}
