package ml.learningmachine.model.service;


import ml.learningmachine.model.domain.ContentsVO;
import ml.learningmachine.model.domain.Pagination;

import java.util.List;

public interface ContentsDAO {
    public void writeContents(ContentsVO vo) throws Exception;

    public ContentsVO viewContents(int board_num) throws Exception;

    public List<ContentsVO> listContents(Pagination pagination) throws Exception;

    public int totalCount() throws Exception;

    public int searchTCount(String keyword) throws Exception;

}