package ml.learningmachine.model.domain;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;

public class AccountsVO {
    private int id;
    @Email(message = "이메일 형식에 맞지않습니다.")
    @NotBlank(message = "이메일 형식에 맞지않습니다.")
    private String email;

    @Size(min = 6, max = 20, message = "비밀번호는 6자리 이상 20자리 미만입니다.")
    private String password;
    @Size(min = 2, max = 12)
    private String nick_name;
    private String auth_token;
    private int mail_auth_state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
    }

    public String getAuth_token() {
        return auth_token;
    }

    public void setAuth_token(String auth_token) {
        this.auth_token = auth_token;
    }

    public int getMail_auth_state() {
        return mail_auth_state;
    }

    public void setMail_auth_state(int mail_auth_state) {
        this.mail_auth_state = mail_auth_state;
    }

    @Override
    public String toString() {
        return "AccountsVO{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", nick_name='" + nick_name + '\'' +
                ", auth_token='" + auth_token + '\'' +
                ", mail_auth_state=" + mail_auth_state +
                '}';
    }
}
