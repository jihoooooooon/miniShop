package com.the.dto;

public class CartDto {
    private int p_id;
    private String name;
    private String brand;
    private String type;
    private int price;
    private String u_id; // u_id를 마지막에 위치하도록 이동

    public CartDto() {}

    public CartDto(int p_id, String name, String brand, String type, int price, String u_id) {
        this.p_id = p_id;
        this.name = name;
        this.brand = brand;
        this.type = type;
        this.price = price;
        this.u_id = u_id; // 생성자에서 u_id 초기화
    }

    @Override
    public String toString() {
        return "CartDto [p_id=" + p_id + ", name=" + name + ", brand=" + brand + ", type=" + type + ", price=" + price + ", u_id=" + u_id + "]";
    }

    // Getters and setters
    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
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

    public String getU_id() {
        return u_id; // Getter 위치는 변경하지 않음
    }

    public void setU_id(String u_id) {
        this.u_id = u_id; // Setter 위치는 변경하지 않음
    }
}
