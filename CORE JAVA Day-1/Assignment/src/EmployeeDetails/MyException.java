package EmployeeDetails;

public class MyException extends Exception{
	
	//constructor for MyException class
	
	MyException()
	{
		
		System.out.println(" The number of leaves you demanded "
		 		+ "exceeds the maximum leave left in your account");
	}
	
}
