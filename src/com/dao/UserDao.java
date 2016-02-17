package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.model.Product;
import com.util.Database;

public class UserDao
{
	private Connection connection;
	
	public UserDao()
	{
		connection=Database.getConnection();
	}
	
	public List<Product> getAllProducts()
	{
		List<Product> products=new ArrayList<Product>();
		try {
	    	System.out.println("In dao");
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Product");
           
            while (rs.next()) {
            	Product product = new Product();
            	product.setId(rs.getInt("id"));
            	product.setName(rs.getString("name"));
            	product.setPrice(rs.getInt("price"));
            	System.out.println(product.getId());
            	System.out.println(product.getName());
            	System.out.println(product.getPrice());
            	products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return products;
		
	}
	public int deleteProduct(String productId)
	{
		int f=0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from Product where id=?");
            preparedStatement.setString(1, productId);
           f=preparedStatement.executeUpdate();
            System.out.println("Product delete method "+f);
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return f;
    }
	public int addProduct(String name,int price) {
		 Product product=new Product();
		 int f=0;
	        try {
	        	
	        	product.setName(name);
	        	product.setPrice(price);
	           PreparedStatement preparedStatement = connection.prepareStatement("insert into Product(name,price) values (?,?)");
	          
	        	// Parameters start with 1
	           preparedStatement.setString(1, product.getName());
	           preparedStatement.setInt(2, product.getPrice());
	            	        
	           f=preparedStatement.executeUpdate();    
	           System.out.println("Query is executed or not " +f);
	 
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
			return f;
	    }
	
}
