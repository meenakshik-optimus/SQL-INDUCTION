package EmployeeDetails;

//Abstract class declaration

public abstract class Abscalculation implements Calculation{
	
	//final variable maximum leave for an employee
	
	final int maxLeave=15;
	
	//variables declaration
	
	private int salary;
	private int basic;
	private int HR;
	private int DA;
	public int leaveLeft;
	
	//countLeaves() method declaration
	
	public abstract int countLeaves();
	
	//definition of calculate() method
	
	public int calculate()
	{
		
       this.salary=basic+HR+DA;
		
		return salary;
		
	}

}
