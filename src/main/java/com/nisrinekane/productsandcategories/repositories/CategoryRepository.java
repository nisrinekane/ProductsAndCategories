package com.nisrinekane.productsandcategories.repositories;

import com.nisrinekane.productsandcategories.models.Category;
import com.nisrinekane.productsandcategories.models.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.awt.print.Book;
import java.util.List;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {

    List<Category> findAll();

}
