package com.nisrinekane.productsandcategories.services;

import com.nisrinekane.productsandcategories.models.Category;
import com.nisrinekane.productsandcategories.models.Product;
import com.nisrinekane.productsandcategories.repositories.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    //create a product
    public void createProduct(Product product) {
        productRepository.save(product);
    }

    // retrieve a product
    public Product  findProduct(Long id) {
        Optional<Product> product = productRepository.findById(id);
        return product.orElse(null);
    }

    //retrieve all products
    public List<Product> allProducts() {
        return productRepository.findAll();
    }

    //update a product
    public Product updateProduct(Product product) {
        return productRepository.save(product);
    }

    //delete a product
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }


    //set category to product
    public void setCategory(Long id, Object category) {
        Product thisProduct = productRepository.findById(id).get();
        thisProduct.getCategories().add((Category) category);
        productRepository.save(thisProduct);
    }

    //find categories not linked to this product
    public List<Category> getOtherCategories(Product product, List<Category> categories) {
        return categories.stream().filter(category ->
                !category.getProducts().contains(product)).collect(Collectors.toList());
    }

}
