package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

// 이 컨트롤러는 json데이터만 통신하는 전문 컨트롤러
@RestController
public class BoardRestController {

	@Autowired
	private BoardMapper mapper;
		
	// RestFul 규약 : 데이터 전송방식
	// get, post, put(update), delete
	// 요청의 내용만 있으면 요청의 종류에 따라서 (전송방식에 따라서)
	// 각각 요청을 받을 수 있음
	
	@GetMapping("/board")
	public List<Board> boardAjaxList(){
		// @RestController표시 덕분에 @ResponseBody 안써도 됨
		List<Board> list = mapper.boardList();
		return list;
	}
	
	
	@PostMapping("/board")
	public void boardAjaxInsert(Board vo) { // title, content, writer
		System.out.println("vo에 담긴 boardContent : "+vo.getBoardContent());
		mapper.boardInsert(vo);
		// 돌려줄 데이터 없음
	}
	
	@DeleteMapping("/board/{boardIdx}")
	public void boardAjaxDelete(@PathVariable int boardIdx) {
		mapper.boardDelete(boardIdx);
	}
	
	@PutMapping("/board")
	public void boardAjaxUpdate(@RequestBody Board vo) {
		// 전에는 contentType이 지정되어있지 않아서 넘어오는 값을
		// 바로 Board객체로 묶어 줄수 있었음
		// json 형식으로 넘어오는 값은 표시를 해줘야함 (@RequestBody)
		
		mapper.boardUpdate(vo);
	}
	
	@PutMapping("/board/{boardIdx}")
	public Board boardAjaxUpdate(@PathVariable int boardIdx, @RequestBody Board vo) {
	    // 전에는 contentType이 지정되어있지 않아서 넘어오는 값을
	    // 바로 Board객체로 묶어 줄수 있었음
	    // json 형식으로 넘어오는 값은 표시를 해줘야함 (@RequestBody)

	    // 수정된 내용을 데이터베이스에 업데이트
	    mapper.boardUpdate(vo);

	    // 수정된 내용을 반환
	    return mapper.boardContent(boardIdx);
	}
	
	@GetMapping("/updateCount/{boardIdx}")
	public Board updateCount(@PathVariable int boardIdx) {
		mapper.boardCount(boardIdx);
		
		// 기존에 idx를 이용해서 해당 게시글 하나 가져오는 메소드 만든적 있음
		// +1된 조회수가 반영된 게시글 DB
		Board vo = mapper.boardContent(boardIdx);
		
		return vo;
	}
	
}