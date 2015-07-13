package EmployeeDetails;

public class Employee extends Abscalculation{
	
	//variables declaration
	
	public String name;
	private int salary;
	private int basic;
	private int HR;
	private int DA;
	private int bonus=0;
	
	
	// constructor with one argument as name and other as bonus
	
	Employee(String name,int bonus)
	{
		this.leaveLeft=maxLeave;
		this.name=name;
		this.bonus=bonus;
	}
	
	//constructor with only name as argument
	
	Employee(String name)
	{
		this.leaveLeft=maxLeave;
		this.name=name;
	}
	
	//getName method returns the name of the employee
	
	public String getName()
	{
	return name;	
	}
	
	//setDetails() method for setting details about salary
	
	public void setDetails(int basic,int HR,int DA)
	{
		this.basic=basic;
		this.HR=HR;
		this.DA=DA;
	}
	
	//implementation of overridden calculate() method
	
	public int calculate()
	{
		this.salary=basic+HR+DA+bonus;
		
		return salary;
	}

	// takeLeave() method which maintains the leave left in the account
	
	public void takeLeave(int leave)
	{
		
		leaveLeft=leaveLeft-leave;
		
		try
		
		{
	
	 if(leaveLeft<0)
		
	{
		
		throw new MyException(); // Exception thrown
		
	}
	 else
	 {
		 System.out.println(" Leave granted");
	 }
	
		}
		
		catch(Exception e)
		
		{
			
			System.out.println(" Leave cannot be granted.");
			
		}
		
		finally
		
		{
			
		System.out.println("Check balanced leave in your account First "
					+ "before requesting for leave.");
			
		}
		
	}
	
	//countLeave method which returns the numbers of leaves left in account
	
	public int countLeaves()
	
	{
		
	return leaveLeft;	
	
	}
	
	// overloading countLeave method()
	
	public void countLeaves(String name)
	
	{
		
		String EmpName= name;
		
		System.out.println(" The leaves in "+EmpName+"'s account is "+ leaveLeft);
		
	}
}
