package com.ruoyi.system.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.service.IOtherService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("other")
@RequiredArgsConstructor
public class otherController {

    private final IOtherService otherService;

    //请求用户的id以及姓名
    @GetMapping("users")
    public AjaxResult getUserInfo(){
        return AjaxResult.success(otherService.selectUserInfo());
    }

}
