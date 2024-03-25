package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.ReportDAO;
import kr.kh.app.model.vo.ReportReasonVO;

public class ReportServiceImp implements ReportService {

    ReportDAO reportDAO;

    public ReportServiceImp() {
        String resource = "kr/kh/app/config/mybatis-config.xml";

        try {
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            SqlSession session = sessionFactory.openSession(true);
            reportDAO = session.getMapper(ReportDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<ReportReasonVO> getReportReasonList() {
        return reportDAO.selectReportReasonList();
    }

}
