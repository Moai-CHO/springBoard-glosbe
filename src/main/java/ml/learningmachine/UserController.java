package ml.learningmachine;

import ml.learningmachine.model.domain.AccountsVO;
import ml.learningmachine.model.service.AccountsDAO;
import ml.learningmachine.util.mailAuth.SendAuthEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@RequestMapping("user/")
@Controller
public class UserController {

    @Autowired
    private AccountsDAO accountsDAO;


    // 인증페이지
    @RequestMapping(path = "auth")
    public String authInfo() {

        return "user/auth";
    }

    @RequestMapping(path = "login", method = RequestMethod.GET)
    public String loginPage(Model model, HttpSession session) {
        if (session.getAttribute("login") != null) {
            return "redirect:/user/caution";
        }
        model.addAttribute("accounts", new AccountsVO());
        return "user/login";
    }

    @RequestMapping(path = "tryLogin", method = RequestMethod.POST)
    public String asd(@Valid @ModelAttribute("accounts") AccountsVO vo, BindingResult bindingResult, HttpSession httpSession) {
        System.out.println(vo.getEmail());
        System.out.println(vo.getPassword());

        AccountsVO accountInfo = null;

        try {
            if (bindingResult.hasErrors()) {
                return "user/login";
            }
            accountInfo = accountsDAO.isAccountCheck(vo);
            System.out.println(accountInfo.getId());
            if (accountInfo.getMail_auth_state() == 0)
                // 인증되지 않은 계정
                return "redirect:authInfo";
        } catch (NullPointerException e) {
            System.out.println("auth_state 찾을 수 없음, 아이디 비번 맞지 않음.");
            System.out.println("tostring :: " + bindingResult.toString());
            return "redirect:login";
        } catch (Exception e) {
            e.printStackTrace();
        }
        httpSession.setAttribute("login", accountInfo);
        System.out.println(httpSession.getAttribute("login"));
        return "redirect:/";
    }

    @RequestMapping(path = "dpNickName", method = RequestMethod.POST) // 닉네임중복확인
    public ResponseEntity<String> dpEmail(@RequestParam(value = "nick_name") String nick_name) { // 닉네임중복확인
        System.out.println("닉중복확인시작" + nick_name);
        ResponseEntity<String> entity = null;


        try {
            String dpNickName = accountsDAO.dpNickName(nick_name);
            System.out.println(dpNickName);
            if (dpNickName == null) {
                entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); // 중복없음
            } else {
                entity = new ResponseEntity<String>("DUPLICATE_CHECK_ERROR", HttpStatus.OK); // 중복된 닉네임
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return entity;
    }

    @RequestMapping(path = "dpEmail", method = RequestMethod.POST) // 이메일중복확인
    public ResponseEntity<String> dpNickName(@RequestParam(value = "email") String email) {
        System.out.println("닉중복확인시작" + email);
        ResponseEntity<String> entity = null;


        try {
            String dpEmail = accountsDAO.dpEmail(email);
            System.out.println(dpEmail);
            if (dpEmail == null) {
                entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); // 중복없음
            } else {
                entity = new ResponseEntity<String>("DUPLICATE_CHECK_ERROR", HttpStatus.OK); // 중복된 닉네임
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return entity;
    }

    @RequestMapping(path = "regist", method = RequestMethod.GET)
    public String registForm(Model model, HttpSession session) {
        if (session.getAttribute("login") != null) {
            return "redirect:/user/caution";
        }
        model.addAttribute("accounts", new AccountsVO());
        return "user/regist";


    }

    @RequestMapping(path = "logout", method = RequestMethod.GET)
    public void logout() {
        System.out.println("로그아웃");
    }

    @RequestMapping(path = "tryRegist", method = RequestMethod.POST)
    public String asd(@Valid @ModelAttribute("accounts") AccountsVO vo, BindingResult bindingResult) {

        SendAuthEmail sendAuthEmail = new SendAuthEmail();
        System.out.println("ㅎㅎ");
        if (bindingResult.hasErrors()) { // 검증 실패
            System.out.println("검증실패");
            System.out.println(vo.toString());
            return "user/regist";
        }
        System.out.println("성공");
        System.out.println(vo.toString());
        String token = sendAuthEmail.createToken();
        System.out.println("1 :: " + token);
        vo.setAuth_token(token);

        try {
            System.out.println("2 :: " + token);
            accountsDAO.register(vo);
            System.out.println("3 :: " + token);
            sendAuthEmail.sendMail(token);
            System.out.println("4 :: " + token);
        } catch (Exception e) {
            System.out.println("regist failed");
            e.printStackTrace();
        }
        System.out.println("가입성공");
        return "user/auth"; //인증안내페이지이동
    }

}
