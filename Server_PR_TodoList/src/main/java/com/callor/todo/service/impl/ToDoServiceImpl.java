package com.callor.todo.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.callor.todo.config.DBContract;
import com.callor.todo.config.DBInfo;
import com.callor.todo.model.ToDoVO;
import com.callor.todo.service.ToDoService;

public class ToDoServiceImpl implements ToDoService {

	protected Connection dbConn;
	
	public ToDoServiceImpl() {
		dbConn = DBContract.getDBConnection();
	}
	
	public List<ToDoVO> select(PreparedStatement pStr) throws SQLException {
		
		List<ToDoVO> tdList = new ArrayList<ToDoVO>();
		
		ResultSet rSet = pStr.executeQuery();
		
		while(rSet.next()) {
			ToDoVO vo = new ToDoVO();
			vo.setTd_seq(rSet.getLong(DBInfo.할일목록.td_seq));
			vo.setTd_todo(rSet.getString(DBInfo.할일목록.td_todo));
			vo.setTd_date(rSet.getString(DBInfo.할일목록.td_date));
			vo.setTd_place(rSet.getString(DBInfo.할일목록.td_place));
			tdList.add(vo);
		}
		
		return tdList;
	}
	
	@Override
	public List<ToDoVO> selectAll() {
		// TODO 리스트 출력
		String sql = " SELECT * FROM view_할일목록 ";
		
		PreparedStatement pStr = null;
		
		try {
			pStr = dbConn.prepareStatement(sql);
			List<ToDoVO> tdList = this.select(pStr);
			pStr.close();
			return tdList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	@Override
	public ToDoVO findById(Long seq) {
		// TODO seq 번호로 찾기
		String sql = " SELECT * FROM tbl_todo ";
		sql += " WHERE td_seq = ? ";
		
		PreparedStatement pStr = null;
		
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, seq);
			List<ToDoVO> tdList = this.select(pStr);
			pStr.close();
			if(tdList != null && tdList.size() > 0) {
				return tdList.get(0);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public Integer insert(ToDoVO tdVO) {
		// TODO 할일 추가
		
		String sql = " INSERT INTO tbl_todo ";
		sql += " ( ";
		sql += " td_seq, ";
		sql += " td_date, ";
		sql += " td_time, ";
		sql += " td_todo, ";
		sql += " td_place)";
		sql += " VALUES( seq_todo.NEXTVAL, ?, ?, ?, ? )";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, tdVO.getTd_date());
			pStr.setString(2, tdVO.getTd_time());
			pStr.setString(3, tdVO.getTd_todo());
			pStr.setString(4, tdVO.getTd_place());
			
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Integer update(ToDoVO tdVO) {
		// TODO 할일 수정
		
		String sql = " UPDATE tbl_todo SET ";
		sql += " td_date = ?,";
		sql += " td_time = ?,";
		sql += " td_todo = ?,";
		sql += " td_place = ?";
		
		sql += " WHERE td_seq = ? ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, tdVO.getTd_date());
			pStr.setString(2, tdVO.getTd_time());
			pStr.setString(3, tdVO.getTd_todo());
			pStr.setString(4, tdVO.getTd_place());
			
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Integer delete(Long seq) {
		// TODO 할일 삭제
		String sql = " DELETE FROM tbl_todo ";
		sql += " WHERE td_seq = ? ";
		
		PreparedStatement pStr = null;
		
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, seq);
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	

}
