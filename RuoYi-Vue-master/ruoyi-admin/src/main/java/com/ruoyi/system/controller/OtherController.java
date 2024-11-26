package com.ruoyi.system.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.mapper.TaskMapper;
import com.ruoyi.system.service.IMachineService;
import com.ruoyi.system.service.IOperationService;
import com.ruoyi.system.service.IOtherService;
import com.ruoyi.system.service.ITaskService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("other")
@RequiredArgsConstructor
public class OtherController {

    private final IOtherService otherService;
    private final ITaskService taskAssignmentService;
    private final IMachineService machineService;
    private final IOperationService operationService;
    private final TaskMapper taskAssignmentMapper;

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
    public AjaxResult taskAssignment(@RequestBody Task taskAssignment) {
        taskAssignment.setAssignedDate(new Date());
        taskAssignment.setIsCompleted(0);
        //调用service层记录使用的参数
        otherService.updateDatabase(taskAssignment);
        return AjaxResult.success(taskAssignmentService.insertTask(taskAssignment));
    }

    //查询某个员工的所欲任务
    @GetMapping("taskAssignment")
    public AjaxResult getTaskAssignment(@RequestParam Long userId) {
        return AjaxResult.success(otherService.selectTaskAssignmentByUserId(userId));
    }

    //开始任务
    @GetMapping("startTask")
    public AjaxResult startTask(@RequestParam Long takeId) {
        Task taskAssignment = taskAssignmentService.selectTaskByTaskId(takeId);
        taskAssignment.setIsStarted(1);
        taskAssignmentMapper.updateTask(taskAssignment);
        return AjaxResult.success();
    }

    //报工
    @GetMapping("finishTask")
    public AjaxResult finishTask(@RequestParam Long takeId, @RequestParam int quantity) {
        otherService.finishTask(takeId, quantity);
        return AjaxResult.success();
    }

    //根据工序ID查询需要的物料
    @GetMapping("material/{operationId}")
    public AjaxResult getMaterialbyOperationId(@PathVariable Long operationId) {
        return AjaxResult.success(otherService.selectMaterialsByOperationId(operationId));
    }

    //计算工资
    @GetMapping("salary")
    public AjaxResult getSalary(@RequestParam Long userId) {
        Map<String,Object> salary = otherService.getSalary(userId);
        return AjaxResult.success(salary);
    }
}
