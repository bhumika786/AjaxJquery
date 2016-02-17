package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.google.gson.Gson;
import com.model.Status;

public class AddController extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//for adding a product
		
		String name=request.getParameter("name");
		int price=Integer.parseInt(request.getParameter("price"));
		UserDao dd=new UserDao();
		int flag=dd.addProduct(name,price);
		
		Status s=new Status();
		if(flag==0)
		{
			s.setFlag(false);
		}
		else
		{
			s.setFlag(true);
		}
		String json = null;
		json = new Gson().toJson(s);
		response.setContentType("application/json");
        response.getWriter().write(json);
		
}
}
