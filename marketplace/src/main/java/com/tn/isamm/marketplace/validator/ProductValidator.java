package com.tn.isamm.marketplace.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.tn.isamm.marketplacebackend.dto.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Product.class.equals(clazz);
	}
 
	@Override
	public void validate(Object target, Errors errors) {
		
		Product product = (Product) target;
		if(product.getFile() == null || product.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Veuillez s�lectionner un fichier !");
			return;
		}
		if(! (product.getFile().getContentType().equals("image/jpeg") || 
				product.getFile().getContentType().equals("image/png")) ||
				product.getFile().getContentType().equals("image/gif")
			 )
			{
				errors.rejectValue("file", null, "Veuillez s�lectionner une image !");
				return;	
			}

	}

}
