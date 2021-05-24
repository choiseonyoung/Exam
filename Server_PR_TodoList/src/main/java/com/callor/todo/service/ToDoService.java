package com.callor.todo.service;

import java.util.List;

import com.callor.todo.model.ToDoVO;

public interface ToDoService {

	public List<ToDoVO> selectAll();
	
	public ToDoVO findById(Long seq);
	
	public Integer insert(ToDoVO tdVO);
	public Integer update(ToDoVO tdVO);
	public Integer delete(Long seq);
	
}
