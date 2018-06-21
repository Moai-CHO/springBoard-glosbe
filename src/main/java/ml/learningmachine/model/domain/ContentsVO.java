package ml.learningmachine.model.domain;

import java.util.Date;

public class ContentsVO {
    public int board_number;
    public int writer_id;
    public String wordset_subject;
    public String wordset_comment;
    public String wordset;
    public Date regdate;
    public String nick_name;
    public int view_count;

    @Override
    public String toString() {
        return "ContentsVO{" +
                "board_number=" + board_number +
                ", writer_id=" + writer_id +
                ", wordset_subject='" + wordset_subject + '\'' +
                ", wordset_comment='" + wordset_comment + '\'' +
                ", wordset='" + wordset + '\'' +
                ", regdate=" + regdate +
                ", nick_name='" + nick_name + '\'' +
                ", view_count=" + view_count +
                '}';
    }

    public int getBoard_number() {
        return board_number;
    }

    public void setBoard_number(int board_number) {
        this.board_number = board_number;
    }

    public int getWriter_id() {
        return writer_id;
    }

    public void setWriter_id(int writer_id) {
        this.writer_id = writer_id;
    }

    public String getWordset_subject() {
        return wordset_subject;
    }

    public void setWordset_subject(String wordset_subject) {
        this.wordset_subject = wordset_subject;
    }

    public String getWordset_comment() {
        return wordset_comment;
    }

    public void setWordset_comment(String wordset_comment) {
        this.wordset_comment = wordset_comment;
    }

    public String getWordset() {
        return wordset;
    }

    public void setWordset(String wordset) {
        this.wordset = wordset;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
    }

    public int getView_count() {
        return view_count;
    }

    public void setView_count(int view_count) {
        this.view_count = view_count;
    }
}
