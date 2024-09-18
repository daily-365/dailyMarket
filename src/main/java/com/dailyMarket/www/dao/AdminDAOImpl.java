package com.dailyMarket.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.AdminVO;
import com.dailyMarket.www.vo.AnswerVO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.CarFileVO;
import com.dailyMarket.www.vo.CarVO;
import com.dailyMarket.www.vo.EstateFileVO;
import com.dailyMarket.www.vo.EstateVO;
import com.dailyMarket.www.vo.EventVO;
import com.dailyMarket.www.vo.InquiryFileVO;
import com.dailyMarket.www.vo.InquiryVO;
import com.dailyMarket.www.vo.JobFileVO;
import com.dailyMarket.www.vo.JobVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.NoticeFileVO;
import com.dailyMarket.www.vo.NoticeVO;
import com.dailyMarket.www.vo.ProductFileVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;
import com.dailyMarket.www.vo.UserAccountVO;
import com.dailyMarket.www.vo.UserProfileFileVO;
import com.dailyMarket.www.vo.UserTradeVO;
import com.dailyMarket.www.vo.UserVO;
import com.mysql.cj.protocol.x.Notice;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int adminLogin(AdminVO adminVO) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectAdminLogin",adminVO) ;
	}

	
	
	@Override
	public List<ProductVO> selectProductList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("AdminMapper.selectProductList",scri);
	}

	@Override
	public int selectProductTotalCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectProductTotalCount",scri);
	}

	@Override
	public ProductVO selectProductByProductNo(int productNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectProductByProductNo",productNo);
	}
	
	@Override
	public List<ProductFileVO> selectProductFile(int productNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectProductFile",productNo);
	}



	@Override
	public void deleteProduct(int productNo) throws Exception {
		sqlSession.update("AdminMapper.deleteProduct",productNo);
	}
	@Override
	public void updateProduct(int productNo) throws Exception {
		sqlSession.update("AdminMapper.updateProduct",productNo);
	}



	@Override
	public List<BusiVO> selectBusiList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("AdminMapper.selectBusiList",scri);
	}

	@Override
	public BusiVO selectBusiByBusiNo(int busiNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectBusiByBusiNo",busiNo);
	}

	@Override
	public void updateBusistatus(BusiVO busiVO) throws Exception {
		sqlSession.update("AdminMapper.updateBusistatus",busiVO);
	}

	@Override
	public int selectBusiTotalCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectBusiTotalCount",scri);
	}

	@Override
	public List<BusiFileVO> selectBusiFile(int busiNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectBusiFile",busiNo);
	}

	@Override
	public List<StoreFileVO> selcetStoreFile(int busiNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectStoreFile",busiNo);
	}

	@Override
	public List<MenuVO> selectMenuList(int busiNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectMenuList",busiNo);
	}



	@Override
	public List<JobVO> selectJobList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("AdminMapper.selectJobList",scri);
	}

	@Override
	public int selectJobtotalCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectJobTotalCount",scri);
	}

	@Override
	public JobVO selectJobDetail(int jobNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectJobDetail",jobNo);
	}

	@Override
	public List<JobFileVO> selectJobFile(int jobNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectJobFile",jobNo);
	}



	@Override
	public List<EstateVO> selectEstateList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("AdminMapper.selectEstateList",scri);
	}

	@Override
	public int selectEstateTotalCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectEstateTotalCount",scri);
	}

	@Override
	public EstateVO selectEstateDetail(int esNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectEstateDetail",esNo);
	}

	@Override
	public List<EstateFileVO> selectEstateFile(int esNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectEstateFile",esNo);
	}



	
	@Override
	public List<CarVO> selectCarList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("AdminMapper.selectCarList",scri);
	}

	@Override
	public int selectCarTotalCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectCarTotalCount",scri);
	}

	@Override
	public CarVO selectCarDetail(int carNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectCarDetail",carNo);
	}
	@Override
	public List<CarFileVO> selectCarFile(int carNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectCarFile",carNo);
	}



	@Override
	public List<UserVO> selectUserList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("AdminMapper.selectUserList",scri);
	}
	@Override
	public int selectUserTotalCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectUserTotalCount",scri);
	}



	@Override
	public UserVO selectUserDetail(String userId) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectUserDetail",userId);
	}
	@Override
	public List<UserProfileFileVO> selectUserFile(String userId) throws Exception {
		return sqlSession.selectList("AdminMapper.selectUserFile",userId);
	}

	@Override
	public List<UserAccountVO> selectUserAccount(String userId) throws Exception {
		return sqlSession.selectList("AdminMapper.selectUserAccount",userId);
	}
	@Override
	public List<UserTradeVO> selectUserTrade(String userId) throws Exception {
		return sqlSession.selectList("AdminMapper.selectUserTrade",userId);
	}



	@Override
	public void insertEventData(EventVO eventVO) throws Exception {
		sqlSession.insert("AdminMapper.insertEventData",eventVO);
	}

	@Override
	public List<EventVO> selectEventList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("AdminMapper.selectEventList",scri);
	}
	@Override
	public int selectEventTotalCnt(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectEventTotalCnt",scri);
	}
	@Override
	public EventVO selectEventVO(int eventNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectEventVO",eventNo);
	}
	@Override
	public void updateEventModify(EventVO eventVO) throws Exception {
		sqlSession.update("AdminMapper.updateEventModify",eventVO);
	}
	@Override
	public void updateEventDelete(int eventNo) throws Exception {
		sqlSession.update("AdminMapper.updateEventDelete",eventNo);
		
	}



	@Override
	public List<NoticeVO> selectNoticeList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("AdminMapper.selectNoticeList",scri);
	}
	@Override
	public int selectNoticeTotalCnt(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectNoticeTotalCnt",scri);
	}
	@Override
	public NoticeVO selectNoticeVO(int noticeNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectNoticeVO",noticeNo);
	}
	@Override
	public void insertNoticeWrite(NoticeVO noticeVO) throws Exception {
		sqlSession.insert("AdminMapper.insertNoticeWrite",noticeVO);
	}
	@Override
	public void insertNoticeFile(Map<String,Object>map) throws Exception {
		sqlSession.insert("AdminMapper.insertNoticeFile",map);
	}
	@Override
	public List<NoticeFileVO> selectNoticeFile(int noticeNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectNoticeFile",noticeNo);
	}
	@Override
	public Map<String, Object> selectNoticeFileNoMap(Map<String, Object> map) throws Exception {
		Map<String, Object > result =sqlSession.selectOne("AdminMapper.selectNoticeFileNoMap", map);
		return result;
	}
	@Override
	public void deleteNoticeFile(int fileNo) throws Exception {
		sqlSession.update("AdminMapper.deleteNoticeFile",fileNo);
	}
	@Override
	public void updateNoticeVO(NoticeVO noticeVO) throws Exception {
		sqlSession.update("AdminMapper.updateNoticeVO",noticeVO);
	}
	@Override
	public void deleteNoticeVO(int noticeNo) throws Exception {
		sqlSession.update("AdminMapper.deleteNoticeVO",noticeNo);
	}
	@Override
	public void deleteNoticeFileVO(int noticeNo) throws Exception {
		sqlSession.update("AdminMapper.deleteNoticeFileVO",noticeNo);
		
	}



	@Override
	public List<InquiryVO> selectInquiryList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("AdminMapper.selectInquiryList",scri);
	
	}
	@Override
	public int selectInquiryTotalCnt(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectInquiryTotalCnt",scri);
	}
	@Override
	public InquiryVO selectByInquiryNo(int inquiryNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectByInquiryNo",inquiryNo);
	}
	@Override
	public List<InquiryFileVO> selectInquiryFile(int inquiryNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectInquiryFile",inquiryNo);
	}
	@Override
	public void insertAnswerByInquiryNo(AnswerVO answerVO) throws Exception {
		sqlSession.insert("AdminMapper.insertAnswerByInquiryNo",answerVO);
	}
	
	@Override
	public void updateInquiryStatus(int inquiryNo) throws Exception {
		sqlSession.update("AdminMapper.updateInquiryStatus",inquiryNo);
	}

	@Override
	public AnswerVO selectAnswerByInquiryNo(int inquiryNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectAnswerByInquiryNo",inquiryNo);
	}
	@Override
	public void updateAnswerByInquiryNo(AnswerVO answerVO) throws Exception {
		sqlSession.insert("AdminMapper.updateAnswerByInquiryNo",answerVO);
	}
	@Override
	public void deleteAnswerByInquiryNo(int inquiryNo) throws Exception {
		sqlSession.insert("AdminMapper.deleteAnswerByInquiryNo",inquiryNo);
		
	}
	
	

	
	
}
