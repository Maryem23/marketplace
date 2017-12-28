package com.tn.isamm.marketplacebackend.dao;

import java.util.List;

import com.tn.isamm.marketplacebackend.dto.Product;
import com.tn.isamm.marketplacebackend.dto.User;

public interface ProductDAO {

	Product get(int productId);
	List<Product> list();
	
	List<Product> list2(int c);	
	boolean add(Product product);
	boolean update(Product product);
	boolean delete(Product product);

	List<Product> getProductsByParam(String param, int count);	
	
	

	List<Product> listActiveProducts();	
	List<Product> listActiveProductsByCategory(int categoryId);
	List<Product> listActiveProductsBySeller(int userId);
	List<Product> getLatestActiveProducts(int count);
	
}
