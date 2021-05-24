package com.callor.todo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.model.ToDoVO;
import com.callor.todo.service.ToDoService;
import com.callor.todo.service.impl.ToDoServiceImpl;

@WebServlet("/todo/*")
public class TodoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	ToDoService tdService;
	
	public TodoController() {
		tdService = new ToDoServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String subPath = req.getPathInfo();
		
		if(subPath.equals("/select")) {
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			ToDoVO tdVO = tdService.findById(td_seq);

			req.setAttribute("TD", tdVO);
			RequestForwardController.forward(req, resp, "select");
		} else if(subPath.equals("/insert")) {
			ToDoVO tdVO = new ToDoVO();
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat st = new SimpleDateFormat("HH:mm");
			Date date = new Date(System.currentTimeMillis());
			
			tdVO.setTd_seq(0L);
			tdVO.setTd_date(sd.format(date));
			tdVO.setTd_time(st.format(date));
			
			req.setAttribute("TD", tdVO);
			
			RequestForwardController.forward(req, resp, "insert");
			
		} else if(subPath.equals("/update")) {
			
			String strSeq = req.getParameter("td_seq");
			Long seq = Long.valueOf(strSeq);
			
			ToDoVO tdVO = tdService.findById(seq);
			
			req.setAttribute("TD", tdVO);
			RequestForwardController.forward(req, resp, "insert");
			
		} else if(subPath.equals("/delete")) {
			String strSeq = req.getParameter("td_seq");
			Long seq = Long.valueOf(strSeq);
			tdService.delete(seq);
			
			resp.sendRedirect("/todo/");
		}
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String subPath = req.getPathInfo();
		String date = req.getParameter("td_date");
		String time = req.getParameter("td_time");
		String todo = req.getParameter("td_todo");
		String place = req.getParameter("td_place");
		
		ToDoVO vo = new ToDoVO();
		vo.setTd_date(date);
		vo.setTd_time(time);
		vo.setTd_todo(todo);
		vo.setTd_place(place);
		
		// System.out.println(vo.toString());
		// 테스트
		
		if(subPath.equals("/insert")) {
			tdService.insert(vo);
			resp.sendRedirect("/todo/");
		} else if(subPath.equals("/update")) {
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			ToDoVO tdVO = tdService.findById(td_seq);
			
			tdService.update(tdVO);
			
			resp.sendRedirect("/todo/");
			
		}
		
	}
	
	
}
