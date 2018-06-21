package ml.learningmachine.model.domain;

public class Pagination {

    public int page;
    public int countList; // 페이지당 게시글 수
    public int countPage; //볼 페이지 수
    public int totalCount; // 총 게시글
    public int totalPage;
    public int startPage;
    public int endPage;
    public int calcLimitPage;
    public String keyword;


    public void calcPage() {
        if (page == 0)
            page = 1;

        this.totalPage = this.totalCount / this.countList;

        if (this.totalCount % this.countList > 0) {
            this.totalPage++;
        }
        if (this.totalPage < page) {
            this.page = this.totalPage;
        }

        if (this.totalPage < this.page) {
            this.page = this.totalPage;
        }
        this.startPage = ((this.page - 1) / 6) * 6 + 1;
        this.endPage = this.startPage + this.countPage - 1;
        if (this.endPage > this.totalPage) {
            this.endPage = this.totalPage;
        }
        this.calcLimitPage = (this.page - 1) * countList;

    }

    @Override
    public String toString() {
        return "Pagination{" +
                "page=" + page +
                ", countList=" + countList +
                ", countPage=" + countPage +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                ", calcLimitPage=" + calcLimitPage +
                ", keyword='" + keyword + '\'' +
                '}';
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getCountList() {
        return countList;
    }

    public void setCountList(int countList) {
        this.countList = countList;
    }

    public int getCountPage() {
        return countPage;
    }

    public void setCountPage(int countPage) {
        this.countPage = countPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

//    public int getCalcLimitPage() {
//        return this.calcLimitPage = (this.page - 1) * countList;
//    }

    public int getCalcLimitPage() {
        return calcLimitPage;
    }

    public void setCalcLimitPage(int calcLimitPage) {
        this.calcLimitPage = calcLimitPage;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
