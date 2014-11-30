package com.mimir.library.search;

public class FilterOption {
	private String name;
	private int count;
	
	public FilterOption(String name){
		this.name = name;
		this.count = 1;
	}
	
	public void increment(){
		count++;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public boolean matches (String other){
		return name.equals(other);
	}
	
}
