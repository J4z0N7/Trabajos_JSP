package Dao;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class ConectarDb {
    public DriverManagerDataSource conectarDB (){
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
    dataSource.setDriverClassName("com.mysql.jdbc.Driver");
    dataSource.setUrl("jdbc:mysql://localhost:3306/tradetodo");
    dataSource.setUsername("root");
    dataSource.setPassword("");
    return dataSource;
}
}