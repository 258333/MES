package com.ruoyi.system.domain.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductOperation {
    private int productId;
    private int operationId;
    private int sequenceNumber;

    // getters and setters
}
