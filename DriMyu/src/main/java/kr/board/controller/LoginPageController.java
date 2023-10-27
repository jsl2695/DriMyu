package kr.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginPageController {

	@GetMapping("/login")
    public String loginPage() {
        return "loginPage"; // 뷰 이름을 그대로 반환
    }

    @GetMapping("/join")
    public String joinPage() {
        return "join"; // 뷰 이름을 그대로 반환
    }

}

