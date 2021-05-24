package com.callor.todo.service;

import java.util.List;

import com.callor.todo.model.ToDoDTO;
import com.callor.todo.model.ToDoVO;

public interface ToDoService {

	public List<ToDoDTO> selectAll();
	
	public List<ToDoVO> findById(Long seq);
	
	public Integer insert(ToDoVO tdVO);
	public Integer update(ToDoVO tdVO);
	public Integer delete(Long seq);
	
}
