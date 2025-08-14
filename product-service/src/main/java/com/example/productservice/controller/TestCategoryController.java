package com.example.productservice.controller;

import com.example.productservice.clients.CategoryClient;
import com.example.productservice.model.Categorie;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestCategoryController {

    private final CategoryClient categoryClient;

    public TestCategoryController(CategoryClient categoryClient) {
        this.categoryClient = categoryClient;
    }

    @GetMapping("/test-categories")
    public List<Categorie> testCallCategoryService() {
        return categoryClient.getAllCategories();
    }
}
