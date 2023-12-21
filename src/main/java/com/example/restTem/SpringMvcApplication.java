package com.example.restTem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class SpringMvcApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringMvcApplication.class, args);
    }

}
