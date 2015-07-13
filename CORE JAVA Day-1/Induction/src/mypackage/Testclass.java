package mypackage;

public class Testclass {
	public static void main(String str[])
	{
		University u1=new University1("GGSIPU");
		
		u1.conductExam();
		
		//setName() method inherited from University
		
		u1.setName("GEC");
		
		//setName() method overloaded in University11
		University1 u;
		u=(University1)u1;
		
		u.setName(1,"GEC");
		
		u.getColDetail();
		
		
		//u1.setLocation("Dwarka"); This will give error as setLocation is 
		//not defined for University class
		
		detailing d1=new University1("GGSIPU");
		
		d1.setLocation("Dwarka");
		
		try
		{
		System.out.println(" Location is " +d1.getLocation());
		}
		catch(Exception e)
		{
		System.out.println("no location found");
		}
		
		//System.out.println(" Location is " +d1.location); variable location is private
		
		University u2=new University2("AMITY");
		
		//calling overridden setName() method
		
		u2.setName("AMITY");
		
		u2.conductExam();
		
		detailing d2=new University2("AMITY");
		
		d2.setLocation("Noida");
		try
		{
		System.out.println(" Location is " +d2.getLocation());
		}
		catch(Exception e)
		{
		System.out.println("no location found");
		}
		
		//System.out.println(" Location is " +d2.location); variable location is private
		
		
University u3=new University3("DU");
		
		u3.conductExam();
	
		detailing d3=(University3)u3;
		
		
		//detailing d3=new University3("");
		
		//d3.setLocation("Delhi");
		try
		{
			if(d3.getLocation()==null)
			{
				throw new Exception();
			}
			else
			{
				System.out.println(" Location is " +d3.getLocation());
			}
		
		}
		catch(Exception e)
		{
		System.out.println("no location found");
		}
		finally
		{
			System.out.println(" This is finally");
		}
		//System.out.println(" Location is " +d3.location); variable location is private
		
		
		
		
		
		
	}

}
