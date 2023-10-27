package kr.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.board.mapper.BoardMapper;

@Controller
public class pageController {
	
	
	// BoardDAO dao = new BoardDAO();
	// dao.boardList();
	// 의존성 주입(DI) : 특정 메모리에 객체를 다 넣어놓고 사용하는 방법
	@Autowired
	private BoardMapper mapper;

	
	//url로 요청가져오는건 get방식
	@GetMapping("/Main.do")
	public String boardAjaxMain() {

		// return 1) view의 논리적 이름
		// 			-> viewResolver가 WEB-INF/views/_ _ _ _/.jsp붙여줌.
		// return 2) 다른요청을 다시 실행하는 경우 redirect:/
		// 			-> jsp를 부르는게 아니라 다른 메소드를 실행한다.
		
		return "maininfo";
	}
	
	
    @GetMapping("/maininfo")  //메인
    public String maininfo() {
        return "maininfo";
    }
    @GetMapping("/userInfoPage")  //개인정보조회
    public String userInfoPage() {
        return "userInfoPage";
    }
    @GetMapping("/editUserInfoPage")  //개인정보수정
    public String editUserInfoPage() {
        return "editUserInfoPage";
    }
    
    @GetMapping("/DriMyuinfo")  // 여행지 정보
    public String DriMyuinfo() {
        return "DriMyuinfo";
    }
    
    @GetMapping("/infopage")  // 여행지 정보
    public String infopage() {
        return "infopage";
    }

    @GetMapping("/DriMyuA") //일반 추천
    public String DriMyuA() {
        return "DriMyuA";
    }
    
    @GetMapping("/DriMyuB") // 콘텐츠기반 추천
    public String DriMyuB() {
        return "DriMyuB";
    }
    
    @GetMapping("/boardList") // 게시판
    public String boardList() {
        return "boardList";
    }
    
    @GetMapping("/Resultpage") // 결과페이지
    public String Resultpage() {
        return "Resultpage";
    }

	/*
	 * @GetMapping("/boardAjaxList.do") public @ResponseBody List<Board>
	 * boardAjaxList(){ // 리턴타입 앞에 @ResponseBody 붙이면 forwarding 이동이 아니라 // 데이터를 보내줌을
	 * 의미하게 된다. // spring mvc jackson-databind api를 pom.xml에 추가 // 보내줄 데이터를 json으로
	 * 알아서 변환 List<Board> list = mapper.boardList();
	 * 
	 * return list; // return에 데이터를 돌려줄 수 있는것은 @ResponseBody때문 // 자바객체 list는
	 * jackson-databind에 의해서 json형식으로 전달 }
	 * */
}
