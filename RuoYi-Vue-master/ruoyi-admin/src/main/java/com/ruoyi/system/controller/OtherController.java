package com.ruoyi.system.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.TaskAssignment;
import com.ruoyi.system.mapper.TaskAssignmentMapper;
import com.ruoyi.system.service.IMachineService;
import com.ruoyi.system.service.IOperationService;
import com.ruoyi.system.service.IOtherService;
import com.ruoyi.system.service.ITaskAssignmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("other")
@RequiredArgsConstructor
public class OtherController {

    private final IOtherService otherService;
    private final ITaskAssignmentService taskAssignmentService;
    private final IMachineService machineService;
    private final IOperationService operationService;
    private final TaskAssignmentMapper taskAssignmentMapper;

    //请求用户的id以及姓名
    @GetMapping("users")
    public AjaxResult getUserInfo() {
        return AjaxResult.success(otherService.selectUserInfo());
    }

    @GetMapping("machines")
    public AjaxResult getMachineInfo(@RequestParam Long operationId) {
        return AjaxResult.success(otherService.selectMachineInfo(operationId));
    }

    //任务分配
    @PostMapping("taskAssignment")
    public AjaxResult taskAssignment(@RequestBody TaskAssignment taskAssignment) {
        taskAssignment.setAssignedDate(new Date());
        taskAssignment.setIsCompleted(0);
        //调用service层记录使用的参数
        otherService.updateDatabase(taskAssignment);
        return AjaxResult.success(taskAssignmentService.insertTaskAssignment(taskAssignment));
    }

    //查询某个员工的所欲任务
    @GetMapping("taskAssignment")
    public AjaxResult getTaskAssignment(@RequestParam Long userId) {
        System.out.println("userId : " + userId);
        return AjaxResult.success(otherService.selectTaskAssignmentByUserId(userId));
    }

    //开始任务
    @GetMapping("startTask")
    public AjaxResult startTask(@RequestParam Long takeId) {
        TaskAssignment taskAssignment = taskAssignmentService.selectTaskAssignmentByTakeId(takeId);
        taskAssignment.setIsStarted(1);
        taskAssignmentMapper.updateTaskAssignment(taskAssignment);
        return AjaxResult.success();
    }

    //报工
    @GetMapping("finishTask")
    public AjaxResult finishTask(@RequestParam Long takeId, @RequestParam int quantity) {
        otherService.finishTask(takeId, quantity);
        return AjaxResult.success();
    }

}
