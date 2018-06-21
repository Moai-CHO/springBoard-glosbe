package ml.learningmachine.model.service;

import ml.learningmachine.model.domain.AccountsVO;

public interface AccountsDAO {
    public String dpNickName(String nickName) throws Exception;
    public String dpEmail(String email) throws Exception;
    public void register(AccountsVO vo) throws Exception;
    public AccountsVO isAccountCheck(AccountsVO vo) throws Exception;
}
