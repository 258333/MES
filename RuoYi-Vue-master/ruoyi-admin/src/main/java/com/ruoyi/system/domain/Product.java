package com.ruoyi.system.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private int productID;
    private String productName;
    private int quantity;
    private double unitPrice;
}
