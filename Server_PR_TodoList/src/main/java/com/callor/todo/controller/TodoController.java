package com.callor.todo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.model.ToDoVO;
import com.callor.todo.service.ToDoService;
import com.callor.todo.service.impl.ToDoServiceImpl;

@WebServlet("/insert")
public class TodoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	ToDoService tdService;
	
	public TodoController() {
		tdService = new ToDoServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String subPath = req.getPathInfo();
		if(subPath.equals("/insert")) {
			
			
		} else if(subPath.equals("/update")) {
			
			String strSeq = req.getParameter("td_seq");
			Integer seq = Integer.valueOf(strSeq);
			
			
			
			
			tdService.update(null);
			
		} else if(subPath.equals("/delete")) {
			
		}
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		ToDoVO vo = new ToDoVO();
		String date = req.getParameter("td_date");
		String time = req.getParameter("td_time");
		String todo = req.getParameter("td_todo");
		String place = req.getParameter("td_place");
		vo.setTd_date(date);
		vo.setTd_time(time);
		vo.setTd_todo(todo);
		vo.setTd_place(place);
		
		tdService.insert(vo);
		req.setAttribute("", place);
		req.getRequestDispatcher("/WEB-INF/views/insert.jsp");
		
	}
	
	

	
	
}
