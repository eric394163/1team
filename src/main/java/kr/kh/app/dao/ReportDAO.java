package kr.kh.app.dao;

import java.util.ArrayList;

import kr.kh.app.model.vo.ReportReasonVO;

public interface ReportDAO {

    ArrayList<ReportReasonVO> selectReportReasonList();
    
}
