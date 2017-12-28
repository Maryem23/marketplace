package com.tn.isamm.marketplace.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.tn.isamm.marketplace.model.RegisterModel;
import com.tn.isamm.marketplacebackend.dao.UserDAO;
import com.tn.isamm.marketplacebackend.dto.Address;
import com.tn.isamm.marketplacebackend.dto.Cart;
import com.tn.isamm.marketplacebackend.dto.User;

@Component
public class RegisterHandler {

 
 @Autowired
 private PasswordEncoder passwordEncoder;
	
	
 @Autowired
 private UserDAO userDAO;
 public RegisterModel init() { 
  return new RegisterModel();
 } 
 public void addUser(RegisterModel registerModel, User user) {
  registerModel.setUser(user);
 } 
 public void addBilling(RegisterModel registerModel, Address billing) {
  registerModel.setBilling(billing);
 }

 public String validateUser(User user, MessageContext error) {
  String transitionValue = "success";
   if(!user.getPassword().equals(user.getConfirmPassword())) {
    error.addMessage(new MessageBuilder().error().source(
      "confirmPassword").defaultText("Les mots de passe ne correspondent pas !").build());
    transitionValue = "failure";    
   }  
   if(userDAO.getByEmail(user.getEmail())!=null) {
    error.addMessage(new MessageBuilder().error().source(
      "email").defaultText("Adresse mail déjà existante !").build());
    transitionValue = "failure";
   }
  return transitionValue;
 }
 
 public String saveAll(RegisterModel registerModel) {
  String transitionValue = "success";
  User user = registerModel.getUser();
  if(user.getRole().equals("BUYER")) {

   Cart cart = new Cart();
   cart.setUser(user);
   user.setCart(cart);
  }
   

  user.setPassword(passwordEncoder.encode(user.getPassword()));
  

  userDAO.add(user);

  Address billing = registerModel.getBilling();
  billing.setUserId(user.getId());
  billing.setBilling(true);  
  userDAO.addAddress(billing);
  return transitionValue ;
 } 
}
