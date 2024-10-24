package com.the.dto;

public class ProductDto {
	private int p_id;
	private String name;
	private String brand;
	private String type;
	private int price;
	
	public ProductDto() {}
	public ProductDto(int p_id, String name, String brand, String type, int price) {
		super();
		this.p_id = p_id;
		this.name = name;
		this.brand = brand;
		this.type = type;
		this.price = price;
	}
	@Override
	public String toString() {
		return "ProductDto [p_id=" + p_id + ", name=" + name + ", brand=" + brand + ", type=" + type + ", price=" + price
				+ "]";
	}
	public int getp_id() {
		return p_id;
	}
	public void setp_id(int p_id) {
		this.p_id = p_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	

}
