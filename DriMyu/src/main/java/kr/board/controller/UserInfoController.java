package kr.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.board.entity.UserInfo;
import kr.board.mapper.BoardMapper;

@Controller
public class UserInfoController {

    @Autowired
    private BoardMapper mapper;
    
    @GetMapping("/userInfoPage.do")
    public String userInfoPage(Model model, HttpSession session) {
        UserInfo loginMember = (UserInfo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        return "userInfoPage"; // userInfoPage.jsp로 포워딩합니다.
    }
    
    @GetMapping("/editUserInfoPage.do")
    public String editUserInfoPage(Model model, HttpSession session) {
        UserInfo loginMember = (UserInfo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        return "editUserInfoPage"; // editUserInfoPage.jsp로 포워딩합니다.
    }
    
    @PostMapping("/register.do")
    public String register(UserInfo userInfo) {
        try {
            int result = mapper.insertUser(userInfo);
            if (result > 0) {
                return "redirect:/login";
            } else {
                return "redirect:/join?error=1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/join?error=1";
        }
    }
    
    @PostMapping("/updateUserInfo.do")
    public ModelAndView updateUserInfo(@ModelAttribute UserInfo userInfo, HttpSession session) {
        ModelAndView mav = new ModelAndView();

        try {
            int result = mapper.updateUserInfo(userInfo);
            if (result > 0) {
                // 성공적으로 업데이트됨
                // 세션에 업데이트된 정보 저장
                session.setAttribute("loginMember", userInfo);
                mav.setViewName("redirect:/userInfoPage.do");
            } else {
                // 업데이트 실패
                mav.addObject("success", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("success", false);
        }
        return mav;
    }





    @PostMapping("/delete.do")
    public String delete(String id) {
        try {
            int result = mapper.deleteUser(id);
            if (result > 0) {
                return "redirect:/logout.do";
            } else {
                return "redirect:/userInfoView.do?id=" + id + "&error=2";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/userInfoView.do?id=" + id + "&error=2";
        }
    }


    @PostMapping("/login.do")
    public String login(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session) {
        try {
            UserInfo userInfo = new UserInfo();
            userInfo.setId(id);
            userInfo.setPw(pw);
            UserInfo loggedInUser = mapper.login(userInfo);

            if (loggedInUser != null) {
                session.setAttribute("loginMember", loggedInUser);
                return "redirect:/Main.do";
            } else {
                return "redirect:/loginPage?error=1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/loginPage?error=1";
        }
    }
    
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.removeAttribute("loginMember");
        return "redirect:/Main.do";
    }

    @GetMapping("/loginPage")
    public String loginPage(Model model, HttpSession session) {
        UserInfo loginMember = (UserInfo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        return "loginPage";
    }
}