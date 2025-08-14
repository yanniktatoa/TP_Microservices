package com.example.productservice.clients;

import com.example.productservice.model.Categorie;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@FeignClient(name = "category-service") // nom du service enregistré dans Eureka
public interface CategoryClient {

    @GetMapping("/api/categories") // path exposé par category-service
    List<Categorie> getAllCategories();
}
