package com.ruoyi.system.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetails {
    private int productId;
    private String productCode;
    private String productName;
    private long quantity;
    private double unitPrice;
    private double allPrice;
}
