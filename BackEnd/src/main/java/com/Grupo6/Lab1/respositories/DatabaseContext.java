package com.Grupo6.Lab1.respositories;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.sql2o.Sql2o;

@Configuration
public class DatabaseContext {

    @Value("jdbc:postgresql://localhost:5432/lab2")
    private String dbUrl;

    @Value("postgres")
    private String dbUser;

    @Value("raam161029")

    private String dbPass;

    @Bean
    public Sql2o sql2o() {
        return new Sql2o(dbUrl, dbUser, dbPass);
    }
}