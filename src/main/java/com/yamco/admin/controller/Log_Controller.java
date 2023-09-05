package com.yamco.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yamco.admin.model.service.Log_Service;

@Controller
public class Log_Controller {
	 @Autowired 
	 private Log_Service log_Service;
	
	 public int visitorUp() { 
		 return log_Service.visitorUp();
	 }
}
