package com.luv2code.springboot.demosecurity.controller;

import java.util.logging.Logger;

import com.luv2code.springboot.demosecurity.entity.User;
import com.luv2code.springboot.demosecurity.service.UserService;
import com.luv2code.springboot.demosecurity.user.WebUser;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	private Logger logger = Logger.getLogger(getClass().getName());

    private UserService userService;

	@Autowired
	public RegistrationController(UserService userService) {
		this.userService = userService;
	}

	
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {				//   URL/register/** yolundaki isteklere gelen verilere (örneğin, form verileri) bu düzenlemelerin uygulanmasını sağlar. 
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);  //String değerlerinin başındaki ve sonundaki boşlukları kırpar. Böylece, boş bir String yerine null değeri alırız.
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);		//String sınıfı için StringTrimmerEditor nesnesini kaydeder.
	}	

	
	
																											
	@GetMapping("/showRegistrationForm")
	public String showMyLoginPage(Model theModel) {
																											
		theModel.addAttribute("webUser", new WebUser());
		
		return "register/registration-form";	//forma webUser BOŞ şablon gönder
	}


	
	
	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(	@Valid   @ModelAttribute("webUser") WebUser theWebUser,	//FORM dan gelen DOLU model 
											BindingResult theBindingResult,
											HttpSession session, 
											Model theModel) {
																								
		String userName = theWebUser.getUserName();
		logger.info("Processing registration form for: " + userName);
		
		// form validation
		 if (theBindingResult.hasErrors()){
			 return "register/registration-form";
		 }

		// check the database if user already exists
        User existing = userService.findByUserName(userName);        
        if (existing != null){
        	theModel.addAttribute("webUser", new WebUser());	//theModel in adını webUser YAP -- formun yeniden yüklenmesi durumunda form alanlarının boş olmasını sağlar
			theModel.addAttribute("registrationError", "User name already exists.");	

			logger.warning("User name already exists.");		//2023-12-22T15:42:49.113+01:00[0;39m [33m WARN[0;39m [35m29460[0;39m [2m---[0;39m [2m[nio-8080-exec-8][0;39m [36mc.l.s.d.c.RegistrationController        [0;39m [2m:[0;39m User name already exists.
        	return "register/registration-form";
        }
        
        // create user account and store in the databse
        userService.save(theWebUser);
        
        logger.info("Successfully created user: " + userName);

		// place user in the web http session for later use
		session.setAttribute("user", theWebUser);

        return "register/registration-confirmation";
	}
}


																																			