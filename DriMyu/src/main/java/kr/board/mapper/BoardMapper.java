package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;
import kr.board.entity.UserInfo;
import kr.board.entity.touristSpots;
import kr.board.entity.works;

// class로 안만드는 이유 : 구구절절 정해서 DB연결할 필요가 없어서
// DAO용도로 쓰는데 SQL문 관리하는 id와 연결만 하면됨
// @Repository 라고 사용하기도 함
@Mapper
public interface BoardMapper {
	
	// ***** interface의 이름과 xml의 이름이 같아야 연결이 된다
	// @Select("")
	public List<Board> boardList();

	public void boardInsert(Board vo);

	public Board boardContent(int boardIdx);

	public void boardUpdate(Board vo);

	public void boardDelete(int boardIdx);
	
	
	public List<works> worksList();
	public List<touristSpots> touristSpotsList();

	// 추상 메소드로 parameterType과 resultType 알 수 있음
	// xml로 sql문을 따로 만들지 않아도 쏠 수 있음
	@Update("update board set views=views+1 where boardIdx=#{boardIdx}")
	
	public void boardCount(int boardIdx);

	public UserInfo login(UserInfo mvo);
	
	public Board getBoardWithComments(int boardIdx);

	public int updateUser(UserInfo userInfo);

	public int deleteUser(String id);

	public int insertUser(UserInfo userInfo);

	public UserInfo login(String id, String pw);

	public Board getBoard(int boardIdx);

	public void commentInsert(int boardIdx, String commentContent);

	public void increaseBoardViewCount(int boardIdx);

	public int updateUserInfo(UserInfo userInfo);
	

}
