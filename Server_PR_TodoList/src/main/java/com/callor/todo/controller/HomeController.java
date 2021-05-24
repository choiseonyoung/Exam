package com.callor.todo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.model.ToDoDTO;
import com.callor.todo.service.ToDoService;
import com.callor.todo.service.impl.ToDoServiceImpl;

@WebServlet("/")
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	ToDoService tdService;
	
	public HomeController() {
		tdService = new ToDoServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<ToDoDTO> toDoList = new ArrayList<ToDoDTO>();
		toDoList = tdService.selectAll();
		
		req.setAttribute("TDLIST", toDoList);
		
		req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(req, resp);
		
	}
	
	
	
}
