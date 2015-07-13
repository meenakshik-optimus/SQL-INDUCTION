package mypackage;

public class University2 extends University implements detailing{
	University2(String s)
	{
	this.name=s;	
	}
	private String location;
	 private String u_name;
	 
	//Overridden setName() method
	
	public void setName(String name)
	{
		this.u_name=name;
	}
	
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
	
	//conductExam() implementation which gives the schedule of exam in university
	
	public void conductExam()
	{
		System.out.println("The exam is conducted in " + u_name + " every six months");
	}
}
