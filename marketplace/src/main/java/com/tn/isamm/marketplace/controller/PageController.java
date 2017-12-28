package com.tn.isamm.marketplace.controller;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.tn.isamm.marketplace.exception.ProductNotFoundException;
import com.tn.isamm.marketplace.model.UserModel;
import com.tn.isamm.marketplacebackend.dao.CategoryDAO;
import com.tn.isamm.marketplacebackend.dao.ProductDAO;
import com.tn.isamm.marketplacebackend.dao.UserDAO;
import com.tn.isamm.marketplacebackend.dto.Category;
import com.tn.isamm.marketplacebackend.dto.Product;

@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	 @Autowired 
	 private PasswordEncoder passwordEncoder;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value = {"/", "/home", "/index"})
	public ModelAndView index(@RequestParam(name="logout",required=false)String logout) {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Home");
		
		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - DEBUG");
		System.out.println("HOME APPEL INDEXX");

		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		
		if(logout!=null) {
			mv.addObject("message", "Vous vous êtes déconnecté(e) avec succès !");			
		}
		
		mv.addObject("userClickHome",true);
		return mv;				
	}
	
	@RequestMapping(value = "/about")
	public ModelAndView about() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","A propos");
		mv.addObject("userClickAbout",true);
		return mv;				
	}	
	
	@RequestMapping(value = "/contact")
	public ModelAndView contact() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Nous contacter");
		mv.addObject("userClickContact",true);
		return mv;				
	}	
	
	

	
	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Tous les produits");


		System.out.println("appeeeeeeelllll");

		mv.addObject("categories", categoryDAO.list());
		
		mv.addObject("userClickAllProducts",true);
		return mv;				
	}	
	
	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {		
		ModelAndView mv = new ModelAndView("page");
		

		Category category = null;
		
		category = categoryDAO.get(id);
		
		mv.addObject("title",category.getName());

		mv.addObject("categories", categoryDAO.list());
		

		mv.addObject("category", category);
		
		mv.addObject("userClickCategoryProducts",true);
		return mv;				
	}	
	

	
	@RequestMapping(value = "/show/{id}/product") 
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
		
		ModelAndView mv = new ModelAndView("page");
		
		Product product = productDAO.get(id);
		
		if(product == null) throw new ProductNotFoundException();
		

		product.setViews(product.getViews() + 1);
		productDAO.update(product);
		//---------------------------
		
		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		
		mv.addObject("userClickShowProduct", true);
		
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/membership")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("flows/membership/signup-personal");		
		mv.addObject("title","S'inscrire - Informations personnelles");
		mv.addObject("userClickSignup-personal",true);
		return mv;	
	}
	@RequestMapping(value="/profile")
	public ModelAndView edit() {
		UserModel u=((UserModel)session.getAttribute("userModel"));
		System.out.println("nom"+u.getNom()+"  pass"+u.getPass());
		ModelAndView mv = new ModelAndView("flows/membership/edit_profile");		
		mv.addObject("title","Modifier profil");
		mv.addObject("nom",u.getNom());
		mv.addObject("prenom",u.getPrenom());
		mv.addObject("mail",u.getEmail());
		mv.addObject("pass",u.getPass());
		mv.addObject("contact",u.getContact());
		mv.addObject("userClickSignup-personal",true);
		return mv;	
	}
	@RequestMapping(value="/modif")
	public ModelAndView modif(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("flows/membership/edit_profile");		
		UserModel u=((UserModel)session.getAttribute("userModel"));

		String id=u.getId()+"";
		String prenom=request.getParameter("prenom").toString();
		String nom=request.getParameter("nom").toString();
		String contact=request.getParameter("contact").toString();
		String pass=passwordEncoder.encode(request.getParameter("pass").toString());
		String mail=request.getParameter("mail").toString();
		userDAO.updateuser(id, mail, nom, prenom, contact, pass);
	System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaMODIFRRRaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +request.getParameter("prenom").toString());
	return mv;	
	}
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam(name="error", required = false)	String error,
			@RequestParam(name="logout", required = false) String logout) {
		ModelAndView mv= new ModelAndView("login");
		mv.addObject("title", "Se connecter");
		if(error!=null) {
			mv.addObject("message", "Adresse ou mot de passe invalides !");
		}
		if(logout!=null) {
			mv.addObject("logout", "Vous vous êtes déconnecté(e) avec succès !");
		}
		return mv;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
	
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		
		return "redirect:/login?logout";
	}	
	
	
	@RequestMapping(value="/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");		
		mv.addObject("errorTitle", "Aha ! Erreur !");		
		mv.addObject("errorDescription", "Vous n'êtes pas autorisé(e) à voir cette page !");		
		mv.addObject("title", "403 Accès refusé");		
		return mv;
	}	
		
	
	
}
