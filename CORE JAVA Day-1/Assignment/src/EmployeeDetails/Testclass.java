package EmployeeDetails;

// this is testcalss having main method

public class Testclass {
	
	//main() method starts
	
	public static void main(String s[])
	
	{
		
		// objects of Employee class are created
		
		Employee E1=new Employee("Sumit",1000);
		
		Employee E2=new Employee("Nitish",500);
		
		Employee E3=new Employee("Abhay");
		
		Employee E4=new Employee("Parveen");
		
		//setting the salary details of employee
		
		E1.setDetails(10000, 2500, 1500);
		
		E2.setDetails(12000, 3500, 2000);
		
		E3.setDetails(20000, 3500, 2500);
		
		E4.setDetails(30000, 4500, 2000);
		
		//calling getName() and calculate() method
		
		System.out.println(" Salary of "+ E1.getName()+" is "+E1.calculate());
		
		System.out.println(" Salary of "+ E2.getName()+" is "+E2.calculate());
		
		System.out.println(" Salary of "+ E3.getName()+" is "+E3.calculate());
		
		System.out.println(" Salary of "+ E4.getName()+" is "+E4.calculate());
		
		
		//counting the leave before taking the leave
		
		System.out.println(" Leaves left in "+ E1.getName()+"'s account is "+ E1.countLeaves());
		
		//Employee E1 took leave for 2 days
		
		 E1.takeLeave(2);
		
		
		//calling countLeaves() method to count the leaves for employee
		
		System.out.println(" Leaves left in "+ E2.getName()+"'s account is "+ E2.countLeaves());
		
		
		//Employee E1 took leave for 4 days
		
		E2.takeLeave(4);
		
		
		System.out.println(" Leaves left in "+ E1.getName()+"'s account is "+ E1.countLeaves());
		
		//calling takeLeave() method
		
		E1.takeLeave(2);
				
		// using refeernce variable of Abscalculation class but the objects are different
		
		
	Abscalculation ab;
	
	//assigning object E1 and E2 to ab one by one for the purpose of polymorphism
	
	ab=E1;
	
	System.out.println(" Salary of "+ E1.getName()+" is "+ab.calculate());
	
	ab=E2;
	
	System.out.println(" Salary of "+ E2.getName()+" is "+ab.calculate());
	
	//calling overloaded countLeaves() method
	
	E1.countLeaves("Sumit");
	
	E1.takeLeave(12);
	
	E2.countLeaves("Nitish");
	
	E2.takeLeave(5);
	
	}

}
