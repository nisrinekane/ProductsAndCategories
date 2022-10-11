package com.nisrinekane.productsandcategories.controllers;


import com.nisrinekane.productsandcategories.models.Category;
import com.nisrinekane.productsandcategories.models.Product;
import com.nisrinekane.productsandcategories.services.CategoryService;
import com.nisrinekane.productsandcategories.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.print.Book;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    //show all products (also shows all categories)
    @RequestMapping("/")
    public String index(Model model,
                        @ModelAttribute("product") Product product,
                        @ModelAttribute("category") Category category,
                        HttpSession session) {
        List<Product> products = productService.allProducts();
        List<Category> categories = categoryService.allCategories();
        model.addAttribute("products", products);
        model.addAttribute("categories", categories);
        return "index.jsp";
    }

    // new product: render form
    @GetMapping("/products/new")
    public String newProductForm(Model model,
                                 @ModelAttribute("product") Product product) {
        return "newProduct.jsp";
    }

    // new product: post route
    @PostMapping("/createProduct")
    public String createProduct(@Valid @ModelAttribute("product") Product product,
                             BindingResult result) {

        if (result.hasErrors()) {
            return "newProduct.jsp";
        }
        productService.createProduct(product);
        return "redirect:/";
    }

    //show product and add cetegories to products
    @GetMapping("/products/{id}")
    public String showProduct(@PathVariable("id") Long id,
                              Model model) {
        Product product = productService.findProduct(id);
        List<Category> categories = categoryService.allCategories();
        model.addAttribute("product", product);
        model.addAttribute("categories", productService.getOtherCategories(product, categories));
        return "showProduct.jsp";
    }

    //add category to product
    @PostMapping("/updateProduct/{id}")
    public String updateProduct(@PathVariable("id") Long productId,
                                Model model,
                                @RequestParam("categoryId") Long categoryId,
                                @Valid @ModelAttribute("product") Product product){
        Category category = categoryService.findCategory(categoryId);
        productService.setCategory(productId, category);
        return "redirect:/products/{id}";
    }
}
