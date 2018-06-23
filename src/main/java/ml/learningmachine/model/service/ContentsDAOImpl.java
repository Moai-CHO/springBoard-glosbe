package ml.learningmachine.model.service;

import ml.learningmachine.model.domain.ContentsVO;
import ml.learningmachine.model.domain.Pagination;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class ContentsDAOImpl implements ContentsDAO {

    @Autowired
    private SqlSession sqlSession;
    static final String NAMESPACE = "ml.learningmachine.contents";

    @Override
    public void writeContents(ContentsVO contentsVO) throws Exception {
        System.out.println("글작성");
        sqlSession.insert(NAMESPACE + ".writeContents", contentsVO);
    }

    @Override
    public ContentsVO viewContents(int board_num) throws Exception {
        System.out.println("글 보기");
        return sqlSession.selectOne(NAMESPACE + ".viewContents", board_num);
    }

    @Override
    public List<ContentsVO> listContents(Pagination pagination) throws Exception {
        System.out.println("글 리스트 불러오기");
        System.out.println(pagination.getKeyword());
        return sqlSession.selectList(NAMESPACE + ".listContents", pagination);

    }

    @Override
    public int totalCount() throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".totalCount");
    }

    @Override
    public int searchTCount(String keyword) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".searchTCount", keyword);
    }

    @Override
    public void updateViewCount(int board_number) throws Exception {
        sqlSession.update(NAMESPACE + ".updateViewCount", board_number);
    }

    @Override
    public ContentsVO get_modifyContent(HashMap modifyMap) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".get_modifyContent", modifyMap);
    }

    @Override
    public void board_modify(ContentsVO vo) throws Exception {
        System.out.println(vo);
        sqlSession.update(NAMESPACE + ".board_modify", vo);
    }
}
