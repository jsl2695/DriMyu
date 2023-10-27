package kr.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.board.mapper.BoardMapper;
import kr.board.entity.Board;

@Service
public class BoardService {

   @Autowired
   private BoardMapper mapper;

    public Board getBoardContent(int boardIdx) {
        // 조회수를 먼저 증가시킵니다.
       mapper.increaseBoardViewCount(boardIdx);

        // 그 다음, 게시글의 내용을 반환합니다.
        return mapper.boardContent(boardIdx);
    }
}