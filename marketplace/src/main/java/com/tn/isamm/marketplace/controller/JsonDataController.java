package com.tn.isamm.marketplace.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tn.isamm.marketplace.model.UserModel;
import com.tn.isamm.marketplacebackend.dao.ProductDAO;
import com.tn.isamm.marketplacebackend.dto.Product;

@Controller
@RequestMapping("/json/data")
public class JsonDataController { 

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private HttpSession session;

	@RequestMapping("/admin/all/products")
	@ResponseBody
	public List<Product> getAllProductsList() {	
		UserModel u=((UserModel)session.getAttribute("userModel"));
        System.out.println("____________________"+u.getId());
        int idd=u.getId();
		return productDAO.list2(idd);
				
	}	
	
	
	@RequestMapping("/all/products")
	@ResponseBody
	public List<Product> getAllProducts() {
		
		return productDAO.listActiveProducts();
				
	}
	
	@RequestMapping("/category/{id}/products")
	@ResponseBody
	public List<Product> getProductsByCategory(@PathVariable int id) {
		
		return productDAO.listActiveProductsByCategory(id);
				
	}
	
	
	@RequestMapping("/mv/products")
	@ResponseBody
	public List<Product> getMostViewedProducts() {		
		return productDAO.getProductsByParam("views", 3);	
		//return productDAO.listActiveProducts();
	}
		
	@RequestMapping("/mp/products")
	@ResponseBody
	public List<Product> getMostPurchasedProducts() {		
		return productDAO.getProductsByParam("purchases", 3);				
	}
	
	
	@RequestMapping("/seller/{id}/products")
	@ResponseBody
	public List<Product> getProductsBySeller(@PathVariable int id) {
		
		return productDAO.listActiveProductsBySeller(id);
				
	}
	
	
	
	
}
