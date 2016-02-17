package com.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.google.gson.Gson;
import com.model.Product;
import com.model.Status;


public class DisplayController extends HttpServlet
{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		UserDao dao=new UserDao();
		System.out.println("inside controller class ");
		List<Product> pro=dao.getAllProducts();
		System.out.println("Dao in controller");
		Iterator it=pro.iterator();
		for(Product p:pro)
		{
			System.out.println(p.getId()+" " +p.getName() + " " +p.getPrice());
		}
		
		/*request.setAttribute("products", dao.getAllProducts());
		RequestDispatcher rd=request.getRequestDispatcher("/product.jsp");
		rd.forward(request,response);*/
		
		String json = null;
		json = new Gson().toJson(pro);
		response.setContentType("application/json");
        response.getWriter().write(json);
		
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		/*//for adding a product
		
		String name=request.getParameter("name");
		int price=Integer.parseInt(request.getParameter("price"));
		UserDao dd=new UserDao();
		int flag1=dd.addProduct(name,price);
		
		Status s=new Status();
		if(flag1==0)
		{
			s.setFlag(false);
		}
		else
		{
			s.setFlag(true);
		}
		
		String json1 = null;
		json1 = new Gson().toJson(s);
		response.setContentType("application/json");
        response.getWriter().write(json1);*/
		//for deleting a row
		String productid=request.getParameter("productid");
		System.out.println(productid);
		UserDao dao=new UserDao();
		int flag=dao.deleteProduct(productid);
		
		Status status=new Status();
		if(flag==0)
		{
			status.setFlag(false);
			System.out.println(status.isFlag());
		}
		else
		{
			status.setFlag(true);System.out.println(status.isFlag());
		}
		String json = null;
		json = new Gson().toJson(status);
		response.setContentType("application/json");
        response.getWriter().write(json);
	}

}
