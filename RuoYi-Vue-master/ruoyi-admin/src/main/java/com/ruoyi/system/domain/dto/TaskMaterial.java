package com.ruoyi.system.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaskMaterial {
    private Long materialId;
    private Long taskId;
    private Integer quantity;
}
