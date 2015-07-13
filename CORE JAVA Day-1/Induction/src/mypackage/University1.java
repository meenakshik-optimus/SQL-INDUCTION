package mypackage;

//class declaration

public class University1 extends University implements detailing{
	
	University1(String s)
	{
	this.name=s;	
	}
	private String location;
	
	private int college_id;
	
	private String col_name;
	
	//getLocation() implementation which gives the location of the university
	
	public  String getLocation()
	{
		return location;

	}
	
	//setLocation() implementation which sets the location of the university
	
	public void setLocation(String location)
	{
		this.location=location;
	}
	
	//setName() method is overloaded to set the name of college under university
	
	 public void setName(int num,String s)
	 {
		 this.college_id=num;
		 this.col_name=s;
	 }
	 
 public void getColDetail()
 {
	 System.out.println("college name is "+col_name+" and college ID is "+college_id);
 }
	 
	//conductExam() implementation which gives the schedule of exam in university
	
	public void conductExam()
	{
		
		try
		{
		
		System.out.println("The exam is conducted in " + getName() + " every three months");
		}
		catch(Exception e)
		{
		System.out.println("no name found");	
		}
		}
	}


