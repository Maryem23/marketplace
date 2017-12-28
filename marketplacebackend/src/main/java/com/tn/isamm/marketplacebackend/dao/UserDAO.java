package com.tn.isamm.marketplacebackend.dao;

import java.util.List;

import com.tn.isamm.marketplacebackend.dto.Address;
import com.tn.isamm.marketplacebackend.dto.Cart;
import com.tn.isamm.marketplacebackend.dto.User;

public interface UserDAO {


	User getByEmail(String email);
	User get(int id);

	boolean add(User user);
	

	Address getAddress(int addressId);
    void updateuser(String id,String mail,String nom,String prenom,String contact,String pass);
	boolean addAddress(Address address);
	boolean updateAddress(Address address);
	Address getBillingAddress(int userId);
	List<Address> listShippingAddresses(int userId);
	
}
