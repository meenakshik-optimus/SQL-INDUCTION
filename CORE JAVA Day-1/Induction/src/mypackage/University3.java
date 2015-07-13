package mypackage;

public class University3 extends University implements detailing{
	University3(String s)
	{
	this.name=s;	
	}
	private String location;
	
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
		System.out.println("The exam is conducted in " + name + " anually");
	}

}
