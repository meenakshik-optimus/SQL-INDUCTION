package mypackage;

public abstract class University {
String name;
public  String getName()throws Exception
{
	return name;

}
public void setName(String name)
{
	this.name=name;
}

public abstract void conductExam();
}

