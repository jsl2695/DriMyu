package kr.board.entity;

public class works {

		// 테이블 당 한개씩 객체 만들기
		// 테이블 이름으로 객체 이름 짓기
		// ***** MyBatis 사용할 경우 필드명에 언더바(_)사용하지 않기
		// 기왕이면 테이블 컬럼명과 프로퍼티명을 일치시키기
		
		// 프로퍼티(=> 속성, property)
		// 게시글 번호, 제목, 내용, 작성자, 작성일, 조회수
		
		private int workID;
		private char mediaType;
		private String title;
		private String location;
		private String location2;
		
		
		
		public int getWorkID() {
			return workID;
		}
		public void setWorkID(int workID) {
			this.workID = workID;
		}
		
		public char getMediaType() {
			return mediaType;
		}
		public void setMediaType(char mediaType) {
			this.mediaType = mediaType;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getLocation2() {
			return location2;
		}
		public void setLocation2(String location2) {
			this.location2 = location2;
		}

	
}
