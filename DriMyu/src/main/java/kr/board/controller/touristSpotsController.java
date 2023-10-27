package kr.board.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import kr.board.entity.Board;
import kr.board.entity.touristSpots;
import kr.board.entity.works;
import kr.board.mapper.BoardMapper;


	@RestController
	public class touristSpotsController {

		@Autowired
	    private BoardMapper mapper;
				
			// RestFul 규약 : 데이터 전송방식
			// get, post, put(update), delete
			// 요청의 내용만 있으면 요청의 종류에 따라서 (전송방식에 따라서)
			// 각각 요청을 받을 수 있음
			
		@GetMapping("/touristSpots")
		public List<touristSpots> touristSpotsList(){ 
		    List<touristSpots> touristSpotsList = mapper.touristSpotsList(); 
		    return touristSpotsList; 
		}
			 
			
	}


