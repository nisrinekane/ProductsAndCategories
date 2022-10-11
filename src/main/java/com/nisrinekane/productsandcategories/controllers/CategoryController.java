package com.nisrinekane.productsandcategories.controllers;

import com.nisrinekane.productsandcategories.models.Category;
import com.nisrinekane.productsandcategories.models.Product;
import com.nisrinekane.productsandcategories.repositories.CategoryRepository;
import com.nisrinekane.productsandcategories.services.CategoryService;
import com.nisrinekane.productsandcategories.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    // new category: render form
    @GetMapping("/category/new")
    public String newCategoryForm(Model model,
                                 @ModelAttribute("category") Category category) {
        return "newCategory.jsp";
    }

    // new category: post route
    @PostMapping("/createCategory")
    public String createCategory(@Valid @ModelAttribute("category")
                                Category category,
                                BindingResult result) {

        if (result.hasErrors()) {
            return "newCategory.jsp";
        }
        categoryService.createCategory(category);
        return "redirect:/";
    }

    //show category and and productc
    @GetMapping("/categories/{id}")
    public String showCategory(@PathVariable("id") Long id, Model model) {
        Category category = categoryService.findCategory(id);
        List<Product> products = productService.allProducts();
        model.addAttribute("category", category);
        model.addAttribute("products", categoryService.getOtherProducts(category, products));
        return "showCategory.jsp";
    }

    //add product to category
    @PostMapping("/updateCategory/{id}")
    public String updateCategory(@PathVariable("id") Long categoryId,
                                Model model,
                                @RequestParam("productId") Long productId,
                                @Valid @ModelAttribute("category") Category category){
        Product product = productService.findProduct(productId);
        categoryService.setProduct(categoryId, product);
        return "redirect:/categories/"+ categoryId;
    }

    //remove product from category
    @GetMapping("/categories/{id}/removeProduct/{productId}")
    public String removeProduct(@PathVariable("id") Long categoryID,
                                @PathVariable("productId") Long categoryProdId,
                                Model model,
//                                @RequestParam("categoryProdId") Long categoryProdId,
                                @Valid @ModelAttribute("category") Category category) {
        Product product = productService.findProduct(categoryProdId);
        categoryService.removeProduct(categoryID, product);
        return "redirect:/categories/" + categoryID;
    }

}
