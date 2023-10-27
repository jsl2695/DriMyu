package kr.board.entity;
import java.util.Date;

public class Board {
	// 테이블 당 한개씩 객체 만들기
	// 테이블 이름으로 객체 이름 짓기
	// ***** MyBatis 사용할 경우 필드명에 언더바(_)사용하지 않기
	// 기왕이면 테이블 컬럼명과 프로퍼티명을 일치시키기
	
	// 프로퍼티(=> 속성, property)
	// 게시글 번호, 제목, 내용, 작성자, 작성일, 조회수
	private int boardIdx;
	private String id;
	private String boardTitle;
	private String boardContent;
	private String created;
	private int views;
	private int commentNum;
	private int commentIdx;
	private String commentContent;
	private String commentCreated;
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getCommentIdx() {
		return commentIdx;
	}
	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentCreated() {
		return commentCreated;
	}
	public void setCommentCreated(String commentCreated) {
		this.commentCreated = commentCreated;
	}
	
	// 생성자를 안만들어도 내가 원하는 만큼 알아서 담을 수 있다~
	// 디폴트 생성자는 눈에 볼수 없지만 이미 만들어져서 기능하고 있음
	
	// getters, setters
	
	
	

}