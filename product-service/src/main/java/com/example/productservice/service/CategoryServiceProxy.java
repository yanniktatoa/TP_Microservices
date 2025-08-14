package com.example.productservice.service;

import com.example.productservice.model.Categorie;
import com.example.productservice.clients.CategoryClient;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceProxy {

    private final CategoryClient categoryClient;

    public CategoryServiceProxy(CategoryClient categoryClient) {
        this.categoryClient = categoryClient;
    }

    public List<Categorie> fetchCategories() {
        return categoryClient.getAllCategories();
    }
}
