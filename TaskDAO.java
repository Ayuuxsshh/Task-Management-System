package com.taskmanager.dao;

import com.taskmanager.model.Task;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class TaskDAO {
    private static Map<Integer, Task> tasks = new ConcurrentHashMap<>();
    private static AtomicInteger idCounter = new AtomicInteger(1);
    
    public List<Task> getAllTasks() {
        return new ArrayList<>(tasks.values());
    }
    
    public Task getTaskById(int id) {
        return tasks.get(id);
    }
    
    public void addTask(Task task) {
        task.setId(idCounter.getAndIncrement());
        tasks.put(task.getId(), task);
    }
    
    public void updateTask(Task task) {
        tasks.put(task.getId(), task);
    }
    
    public void deleteTask(int id) {
        tasks.remove(id);
    }
    
    public List<Task> getTasksByStatus(String status) {
        return tasks.values().stream()
                .filter(t -> t.getStatus().equals(status))
                .collect(Collectors.toList());
    }
}