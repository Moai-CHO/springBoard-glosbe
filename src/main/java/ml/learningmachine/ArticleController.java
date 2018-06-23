package ml.learningmachine;

import ml.learningmachine.model.domain.AccountsVO;
import ml.learningmachine.model.domain.ContentsVO;
import ml.learningmachine.model.domain.Pagination;
import ml.learningmachine.model.service.ContentsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@RequestMapping("article/")
@Controller
public class ArticleController {

    @Autowired
    private ContentsDAO contentsDAO;


    //글작성 페이지
    @RequestMapping(path = "write", method = RequestMethod.GET)
    public String write(HttpSession session) {
        if (session.getAttribute("login") == null) {
            return "redirect:/user/login";
        }
        return "article/write";
    }

    // 글 작성
    @RequestMapping(path = "write", method = RequestMethod.POST)
    public ResponseEntity<String> wirte_wordBook(ContentsVO contentsVO) {

        System.out.println("dd");

        System.out.println("data ::" + contentsVO);
        ResponseEntity<String> entity = null;

        try {
            contentsDAO.writeContents(contentsVO);
            entity = new ResponseEntity<String>("WRITE_SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>("WRITE_FAIL", HttpStatus.BAD_REQUEST);
        }
        System.out.println("entity ::: " + entity);
        System.out.println(entity.getBody());
        return entity;
    }

    @RequestMapping(path = "/list", method = RequestMethod.GET)
    public void loginMain(Pagination pagination, Model model) throws Exception {
        System.out.println(pagination.getKeyword());
        System.out.println(pagination.getKeyword() == null);
/*        if (pagination.getPage() == 0)
            pagination.setPage(1);*/



        /*pagination.getPage(); //현재 페이지
        System.out.println("현재 페이지 " + pagination.getPage());*/

        pagination.setCountList(15); //게시물 15개씩
        pagination.setCountPage(6); // 6페이지씩

        if (pagination.getKeyword() != null) {
            System.out.println("키워드있음");
            System.out.println("키워드 :: " + pagination.getKeyword());
            System.out.println("COUNT :: " + contentsDAO.searchTCount(pagination.getKeyword()));
            pagination.setTotalCount(contentsDAO.searchTCount(pagination.getKeyword()));

        } else {
            System.out.println("키워드없음");
            System.out.println("noneKeyword :: " + contentsDAO.totalCount());
            pagination.setTotalCount(contentsDAO.totalCount());

        }
        pagination.calcPage(); // 페이지 계산, limitPage

        System.out.println(pagination.toString());
        List<ContentsVO> listContents = contentsDAO.listContents(pagination); // 게시글 불러오기
        model.addAttribute("listContents", listContents);
        model.addAttribute("pagination", pagination);

    }

    @RequestMapping(path = "modify", method = RequestMethod.GET)
    public void asd11(@RequestParam(value = "no") int board_num, HttpSession session, Model model) throws Exception {
        System.out.println("IN");
        AccountsVO accountsVO = (AccountsVO) session.getAttribute("login");
        HashMap<String, Integer> modifyMap = new HashMap<String, Integer>();
        modifyMap.put("writer_id", accountsVO.getId());
        modifyMap.put("board_number", board_num);

        model.addAttribute("modify", contentsDAO.get_modifyContent(modifyMap));
    }

    @RequestMapping(path = "myBook", method = RequestMethod.GET)
    public String myBookPage(HttpSession session) {
        if (session.getAttribute("login") == null) {
            return "redirect:/user/login";
        }
        System.out.println();
        return "article/myBook";
    }

    @RequestMapping(path = "content_modify", method = RequestMethod.POST)
    public ResponseEntity<String> content_modify(ContentsVO contentsVO) {
        System.out.println("data ::" + contentsVO);
        ResponseEntity<String> entity = null;

        try {
            contentsDAO.board_modify(contentsVO);
            System.out.println("수정완료");
            entity = new ResponseEntity<String>("WRITE_SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>("WRITE_FAIL", HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    @RequestMapping(path = "view", method = RequestMethod.GET)
    public void view_wordBook(@RequestParam(value = "no") int board_num, Model model) {
        System.out.println(board_num);


        try {
            contentsDAO.viewContents(board_num);
            contentsDAO.updateViewCount(board_num);
            model.addAttribute("view_wordBook", contentsDAO.viewContents(board_num));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
