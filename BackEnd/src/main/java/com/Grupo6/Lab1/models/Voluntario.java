package com.Grupo6.Lab1.models;

import java.awt.*;

public class Voluntario {
    private Long idVoluntario;
    private String emailVoluntario;
    private String rutVoluntario;
    private String nombreCompletoVoluntario;
    private String contraseniaVoluntario;

    private double latitud;
    private double longitud;
    private Point geom;
    public String getContraseniaVoluntario() {
        return contraseniaVoluntario;
    }

    public void setContraseniaVoluntario(String contraseniaVoluntario) {
        this.contraseniaVoluntario = contraseniaVoluntario;
    }

    public Long getIdVoluntario() {
        return idVoluntario;
    }

    public void setIdVoluntario(Long idVoluntario) {
        this.idVoluntario = idVoluntario;
    }

    public String getEmailVoluntario() {
        return emailVoluntario;
    }

    public void setEmailVoluntario(String emailVoluntario) {
        this.emailVoluntario = emailVoluntario;
    }

    public String getRutVoluntario() {
        return rutVoluntario;
    }

    public void setRutVoluntario(String rutVoluntario) {
        this.rutVoluntario = rutVoluntario;
    }

    public String getNombreCompletoVoluntario() {
        return nombreCompletoVoluntario;
    }

    public void setNombreCompletoVoluntario(String nombreCompletoVoluntario) {
        this.nombreCompletoVoluntario = nombreCompletoVoluntario;
    }


    @Override
    public String toString() {
        return "Voluntario{" +
                "idVoluntario=" + idVoluntario +
                ", emailVoluntario='" + emailVoluntario + '\'' +
                ", rutVoluntario='" + rutVoluntario + '\'' +
                ", nombreCompletoVoluntario='" + nombreCompletoVoluntario + '\'' +
                ", contraseniaVoluntario='" + contraseniaVoluntario + '\'' +
                ", latitud=" + latitud +
                ", longitud=" + longitud +
                ", geom=" + geom +
                '}';
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
}
