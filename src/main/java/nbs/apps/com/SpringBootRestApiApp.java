package nbs.apps.com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;


//@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class })
@SpringBootApplication(scanBasePackages={"nbs.apps.com"})// same as @Configuration @EnableAutoConfiguration @ComponentScan
public class SpringBootRestApiApp {
    @Autowired
    DataSource dataSource;
    public static void main(String[] args) {
        SpringApplication.run(SpringBootRestApiApp.class, args);
        //System.out.println("hello world");
    }
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

}