package com.dms.test;

import com.dms.dao.AnalystDAO;
import com.dms.model.Analyst;

public class TestAnalystDAO {
	public static void main(String[] args) {
		AnalystDAO dao = new AnalystDAO();
		 
		Analyst a = new Analyst();
		
		a.setName("Manisha");
		a.setEmail("manisha@23.com");
		a.setPassword("67543");
		a.setSpecialization("chest");
		a.setPhone("789054321");
		
		
		boolean result = dao.addAnalyst(a);
		
		if(result)
			System.out.println("✅ anlysist added Successfully!");
		else 
			System.out.println(" Faailed to add analyst!");
		
	}

}
