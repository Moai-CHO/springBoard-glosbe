package ml.learningmachine.model.service;

import ml.learningmachine.model.domain.AccountsVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountsDAOImpl implements AccountsDAO {

    @Autowired
    private SqlSession sqlSession;
    static final String namespace = "ml.learningmachine.accounts";

    @Override
    public String dpNickName(String nickName) throws Exception {
        return sqlSession.selectOne(namespace + ".dpNickName", nickName);

    }

    @Override
    public String dpEmail(String email) throws Exception {
        return sqlSession.selectOne(namespace + ".dpEmail", email);
    }

    @Override
    public void register(AccountsVO vo) throws Exception {
        System.out.println("회원가입임");
        sqlSession.insert(namespace + ".register", vo);
    }

    @Override
    public AccountsVO isAccountCheck(AccountsVO vo) throws Exception {
        return sqlSession.selectOne(namespace + ".isAccountCheck", vo);
    }
}
