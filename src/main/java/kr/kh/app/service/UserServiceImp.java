package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.UserDAO;
import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.UserVO;

public class UserServiceImp implements UserService {
    private UserDAO userDao;

    public UserServiceImp() {
        String resource = "kr/kh/app/config/mybatis-config.xml";

        try {
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            SqlSession session = sessionFactory.openSession(true);
            userDao = session.getMapper(UserDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public UserVO login(LoginDTO loginDTO) {
        if (loginDTO == null) {
            System.out.println("loginDTO is null");
            return null;
        }
        // 아이디를 주고 회원 정보를 요청
        String id = loginDTO.getId();
        System.out.println("id: " + id);
        UserVO user = userDao.selectUser(id);
        System.out.println("user: " + user);

        if (user == null) {
            System.out.println("user is null");
            return null;
        }
        // 비번이 같은지 확인
        if (user.getUser_pw().equals(loginDTO.getPw())) {
            System.out.println("login success");
            return user;
        }
        return null;
    }

    @Override
    public boolean signUp(SignUpDTO signUpDTO) {
        if (signUpDTO == null ||
                signUpDTO.getId() == null ||
                signUpDTO.getPw==  null ||
                signUpDTO.getEmail==  null) {
            return false;
        }
        // 정규표현식 체크 : to do

        try {
            // 아이디가 중복되면 예외가 발생
            return userDao.insertMember(signUpDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
