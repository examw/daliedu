package com.changh.sccms.test;

public class Parent {
	public static void main(String[] args) {
		Parent p = new Child(15);
		print(p);
	}
	public int getId() {return 10;}
	public static void print(Parent p)
	{
		System.out.println(p.getId());
		System.out.println(p.getClass().toString());
	}
}
class Child extends Parent
{
	
	private int id=5;
	
	public Child() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Child(int id) {
		super();
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}