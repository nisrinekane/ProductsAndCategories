package com.nisrinekane.productsandcategories.services;

import com.nisrinekane.productsandcategories.models.Category;
import com.nisrinekane.productsandcategories.models.Product;
import com.nisrinekane.productsandcategories.repositories.CategoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    //create a category
    public void createCategory(Category category) {
        categoryRepository.save(category);
    }

    //retrieve a category
    public Category findCategory(Long id) {
        Optional<Category> category = categoryRepository.findById(id);
        return category.orElse(null);
    }

    //find all categories
    public List<Category> allCategories() {
        return categoryRepository.findAll();
    }

    //update a category
    public Category updateCategory(Category category) {
        return categoryRepository.save(category);
    }

    //delete a category
    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }

    //set product to category
    public void setProduct(Long id, Object product) {
        Category thisCategory = categoryRepository.findById(id).get();
        thisCategory.getProducts().add((Product)product);
        categoryRepository.save(thisCategory);
    }

    //remove product from category
    public void removeProduct(Long id, Object product) {
        Category thisCategory = categoryRepository.findById(id).get();
        thisCategory.getProducts().remove((Product) product);
        categoryRepository.save(thisCategory);
    }

    //find products not linked to this product
    public List<Product> getOtherProducts(Category category, List<Product> products) {
        return products.stream().filter(product ->
                !product.getCategories().contains(category)).collect(Collectors.toList());
    }

}
