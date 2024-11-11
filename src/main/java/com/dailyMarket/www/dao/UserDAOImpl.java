package com.dailyMarket.www.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.AdvertVO;
import com.dailyMarket.www.vo.AnswerVO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiNoticeFileVO;
import com.dailyMarket.www.vo.BusiNoticeVO;
import com.dailyMarket.www.vo.BusiReviewFileVO;
import com.dailyMarket.www.vo.BusiReviewVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.CarFileVO;
import com.dailyMarket.www.vo.CarVO;
import com.dailyMarket.www.vo.ChatRoomVO;
import com.dailyMarket.www.vo.ConnexionVO;
import com.dailyMarket.www.vo.EstateFileVO;
import com.dailyMarket.www.vo.EstateVO;
import com.dailyMarket.www.vo.EventVO;
import com.dailyMarket.www.vo.GetUserJobVO;
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
import com.dailyMarket.www.vo.UserJobVO;
import com.dailyMarket.www.vo.UserProfileFileVO;
import com.dailyMarket.www.vo.UserSumAccountVO;
import com.dailyMarket.www.vo.UserTradeVO;
import com.dailyMarket.www.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertUserRegist(UserVO userVO) throws Exception {
		sqlSession.insert("UserMapper.insertUserRegist",userVO);
	}

	@Override
	public int selectUserLogin(UserVO userVO) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUserLogin",userVO);
	}

	
	@Override
	public UserVO selectUserByUserId(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUserByUserId",userId);
	}

	@Override
	public void insertUserProduct(ProductVO productVO) throws Exception {
		sqlSession.insert("UserMapper.insertUserProduct",productVO);
		
	}

	@Override
	public void insertUserFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("UserMapper.insertUserFile",map);
	}

	@Override
	public List<ProductVO> selectProductList(ProductVO productVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectProductList",productVO);
	}

	@Override
	public void updateProductHitCnt(int productNo) throws Exception {
		sqlSession.update("UserMapper.updateProductHitCnt",productNo);
	}

	@Override
	public ProductVO selectProductDetail(int productNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectProductDetail",productNo);
	}
	
	@Override
	public List<ProductFileVO> selectProductFile(int productNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectProductFile",productNo);
	}

	@Override
	public List<BusiVO> selectBusiList(BusiVO busiVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectBusiList",busiVO);
	}
	@Override
	public BusiVO selectByBusiNo(BusiVO busiVO) throws Exception {
		return sqlSession.selectOne("UserMapper.selectByBusiNo",busiVO);
	}
	
	
	@Override
	public BusiFileVO selectBusiFile(int busiNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectBusiFile",busiNo);
	}

	
	@Override
	public int updateBusiHitCnt(int busiNo) throws Exception {
		return sqlSession.update("UserMapper.updateBusiHitCnt",busiNo);
	}

	@Override
	public List<StoreFileVO> selectStoreList(int busiNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectStoreList",busiNo);
	}

	@Override
	public List<MenuVO> selectMenuList(int busiNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectMenuList",busiNo);
	}

	@Override
	public void insertEstateOne(EstateVO estateVO) throws Exception {
		sqlSession.insert("UserMapper.insertEstateOne",estateVO);
	}

	@Override
	public void insertEstateFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("UserMapper.insertEstateFile",map);
	}

	@Override
	public void updateEstateTwo(EstateVO estateVO) throws Exception {
		sqlSession.update("UserMapper.updateEstateTwo",estateVO);
		
	}
	@Override
	public void updateEstateThree(EstateVO estateVO) throws Exception {
		sqlSession.update("UserMapper.updateEstateThree",estateVO);
		
	}
	

	@Override
	public List<EstateVO> selectEstateList(EstateVO estateVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectEstateList",estateVO);
	}

	@Override
	public List<EstateFileVO> selectEstateFile(EstateFileVO estateFileVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectEstateFile",estateFileVO);
	}

	@Override
	public EstateVO selectEstateDetail(int esNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectEstateDetail",esNo);
	}
	

	@Override
	public void updateEstateHitCnt(int esNo) throws Exception {
		sqlSession.update("UserMapper.updateEstateHitCnt",esNo);
	}

	@Override
	public List<EstateFileVO> selectEstateFileDetail(int esNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectEstateFileDetail",esNo);
	}

	@Override
	public void insertCarRegist(CarVO carVO) throws Exception {
		sqlSession.insert("UserMapper.insertCarRegist",carVO);
	}

	@Override
	public void insertCarFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("UserMapper.insertCarFile",map);
	}

	@Override
	public List<CarVO> selectCarList(CarVO carVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectCarList",carVO);
	}

	@Override
	public List<CarFileVO> selectCarFile(CarFileVO carFileVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectCarFile",carFileVO );
	}

	@Override
	public CarVO selectCarVO(int carNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectCarVO",carNo);
	}
	
	@Override
	public void updateCarHitCnt(int carNo) throws Exception {
		sqlSession.update("UserMapper.updateCarHitCnt",carNo);
	}

	@Override
	public List<JobVO> selectJobList(JobVO jobVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectJobList",jobVO);
	}

	@Override
	public List<JobFileVO> selectJobFile(JobFileVO jobFileVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectJobFile",jobFileVO);
	}

	@Override
	public JobVO selectJobByNo(int jobNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectJobByNo",jobNo);
	}

	@Override
	public void updateJobHitCnt(int jobNo) throws Exception {
		sqlSession.update("UserMapper.updateJobHitCnt",jobNo);
		
	}

	@Override
	public List<BusiNoticeVO> selectCompanyNoticeList(BusiNoticeVO busiNoticeVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectCompanyNoticeList",busiNoticeVO);
	}
	
	@Override
	public BusiNoticeVO selectCompanyNoticeByNO(int busiNoticeNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectCompanyNoticeByNO",busiNoticeNo);
	}

	@Override
	public List<BusiNoticeFileVO> selectCompanyNoticeFileByNo(int busiNoticeNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectCompanyNoticeFileByNo",busiNoticeNo);
	}

	@Override
	public void updateNoticeHitCnt(int busiNoticeNo) throws Exception {
		sqlSession.update("UserMapper.updateNoticeHitCnt",busiNoticeNo);
	}

	@Override
	public void insertCompanyReview(BusiReviewVO busiReviewVO) throws Exception {
		sqlSession.insert("UserMapper.insertCompanyReview",busiReviewVO);
	}

	@Override
	public void insertCompanyReviewFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("UserMapper.insertCompanyReviewFile",map);
	}

	@Override
	public List<BusiReviewVO> selectCompanyReviewList() throws Exception {
		return sqlSession.selectList("UserMapper.selectCompanyReviewList");
	}

	@Override
	public BusiReviewVO selectReviewByReviewNo(int busiReviewNo)throws Exception {
		return sqlSession.selectOne("UserMapper.selectReviewByReviewNo",busiReviewNo);
	}

	@Override
	public List<BusiReviewVO> selectCompanyReviewByBusiNo(BusiReviewVO busiReviewVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectCompanyReviewByBusiNo",busiReviewVO);
	}
	@Override
	public List<BusiReviewFileVO> selectCompanyReviewFileByBusiViewNo(int busiReviewNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectCompanyReviewFileByBusiViewNo",busiReviewNo);
	}

	
	@Override
	public void updateReviewHitCnt(int busiReviewNo) throws Exception {
		sqlSession.update("UserMapper.updateReviewHitCnt",busiReviewNo);
	}

	@Override
	public void insertUserJob(UserJobVO userJobVO) throws Exception {
		sqlSession.insert("UserMapper.insertUserJob",userJobVO);
	}

	@Override
	public void insertUserJobFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("UserMapper.insertUserJobFile",map);
	}

	@Override
	public UserJobVO selectUserJobByWriter(String writer) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUserJobByWriter",writer);
	}

	@Override
	public void updateUserJob(UserJobVO userJobVO) throws Exception {
		sqlSession.update("UserMapper.updateUserJob",userJobVO);
	}

	@Override
	public void deleteUserJobFile() throws Exception {
		sqlSession.update("UserMapper.updateUserJobFile");
	}

	@Override
	public void deleteUserJob(String writer) throws Exception {
		sqlSession.update("UserMapper.deleteUserJob",writer);
	}

	@Override
	public void deleteUserJobFile(String writer) throws Exception {
		sqlSession.update("UserMapper.deleteUserJobFile",writer);
	}

	@Override
	public int selectUserJobWrtieYn(String writer) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUserJobWrtieYn",writer);
	}

	@Override
	public void insertGetUserJob(GetUserJobVO getUserJovVo) throws Exception {
		sqlSession.insert("UserMapper.insertGetUserJob",getUserJovVo);
	}

	@Override
	public int selectGetUserJobYn(GetUserJobVO getUserJobVO) throws Exception {
		return sqlSession.selectOne("UserMapper.selectGetUserJobYn",getUserJobVO);
	}

	@Override
	public UserVO selectUserByWriter(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUserByWriter",userId);
	}

	@Override
	public int selectUserPassChk(UserVO userVO) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUserPassChk", userVO);
	}

	@Override
	public void updateUserInfo(UserVO userVO) throws Exception {
		sqlSession.update("UserMapper.updateUserInfo",userVO);
	}

	@Override
	public void insertUserPofileFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("UserMapper.insertUserPofileFile",map);
	}

	@Override
	public UserProfileFileVO selectUserProfileYn(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUserProfileYn",userId);
	}

	@Override
	public void deleteUserProfileFile(int fileNo) throws Exception {
		sqlSession.update("UserMapper.deleteUserProfileFile",fileNo);
		
	}

	@Override
	public List<UserProfileFileVO> selectUserProfileFileList() throws Exception {
		return sqlSession.selectList("UserMapper.selectUserProfileFileList");
	}

	@Override
	public UserVO selectPrevPassChk(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.selectPrevPassChk",userId);
	}

	@Override
	public void updateModPass(UserVO userVO) throws Exception {
		sqlSession.update("UserMapper.updateModPass",userVO);
	}

	@Override
	public void insertAccount(UserAccountVO userAccountVO) throws Exception {
		sqlSession.insert("UserMapper.insertAccount",userAccountVO);
	}

	@Override
	public List<UserAccountVO> selectSumAccountList(int userNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectSumAccountList",userNo);
	}

	@Override
	public void insertUserTrade(UserTradeVO userTradeVO) throws Exception {
		sqlSession.insert("UserMapper.insertUserTrade",userTradeVO)	;	
	}

	@Override
	public void updateUserLike(int productNo) throws Exception {
		sqlSession.update("UserMapper.updateUserLike",productNo);
	}
	

	@Override
	public ProductVO selectProductByNo(int productNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectProductByNo",productNo);
	}

	@Override
	public void updateUserLikeCancle(int productNo) throws Exception {
		sqlSession.update("UserMapper.updateUserLikeCancle",productNo);
	}

	@Override
	public List<UserTradeVO> selectLikeList(int userNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectLikeList",userNo);
	}

	@Override
	public List<ProductVO> selectProductSalesList(int userNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectProductSalesList",userNo);
	}

	@Override
	public void updateProductSaleCancle(int productNo) throws Exception {
		sqlSession.update("UserMapper.updateProductSaleCancle",productNo);
		
	}

	@Override
	public List<EventVO> selectEventList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("UserMapper.selectEventList",scri);
	}
	@Override
	public List<NoticeVO> selectNoticeList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("UserMapper.selectNoticeList",scri);
	}
	@Override
	public int selectEventTotalCnt(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("UserMapper.selectEventTotalCnt",scri);
	}
	@Override
	public int selectNoticeTotalCnt(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("UserMapper.selectNoticeTotalCnt",scri);
	}
	@Override
	public NoticeVO selectNoticeByNo(int noticeNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectNoticeByNo",noticeNo);
	}
	@Override
	public List<NoticeFileVO> selectNoticeFile(int noticeNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectNoticeFile",noticeNo);
	}
	@Override
	public Map<String, Object> selectNoticeFileByNo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("UserMapper.selectNoticeFileByNo",map);
	}

	@Override
	public void insertInquiry(InquiryVO inquiryVO) throws Exception {
		sqlSession.insert("UserMapper.insertInquiry",inquiryVO);
	}

	@Override
	public void insertInquiryFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("UserMapper.insertInquiryFile",map);
	}

	@Override
	public List<InquiryVO> selectInquiryList() throws Exception {
		return sqlSession.selectList("UserMapper.selectInquiryList");
	}

	@Override
	public List<InquiryVO> selectInquiryByWriter(String userId) throws Exception {
		return sqlSession.selectList("UserMapper.selectInquiryByWriter",userId);
	}

	@Override
	public void updateInquiryHitCnt(int inquiryNo) throws Exception {
		sqlSession.update("UserMapper.updateInquiryHitCnt",inquiryNo);
	}
	@Override
	public InquiryVO selectInquiryByNo(int inquiryNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectInquiryByNo",inquiryNo);
	}

	@Override
	public AnswerVO selectAnswerByInquiryNo(int inquiryNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectAnswerByInquiryNo",inquiryNo);
	}
	@Override
	public List<InquiryVO> selectInquirySearch(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("UserMapper.selectInquirySearch",scri);
	}

	@Override
	public void insertConnexion(ConnexionVO connexionVO) throws Exception {
		sqlSession.insert("UserMapper.insertConnexion",connexionVO);
	}

	@Override
	public int selectConnexionYn(ConnexionVO connexionVO) throws Exception {
		return sqlSession.selectOne("UserMapper.selectConnexionYn",connexionVO);
	}

	@Override
	public void updateConnexionDel(ConnexionVO connexionVO) throws Exception {
		sqlSession.update("UserMapper.updateConnexionDel",connexionVO);
	}

	@Override
	public List<GetUserJobVO> selectGetJobList(String userId) throws Exception {
		return sqlSession.selectList("UserMapper.selectGetJobList",userId);
	}

	@Override
	public void updateGetjobDel(int jobNo) throws Exception {
		sqlSession.update("UserMapper.updateGetjobDel",jobNo);
	}

	@Override
	public List<ConnexionVO> selectConnexionList(int userNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectConnexionList",userNo);
	}

	@Override
	public List<BusiReviewVO> selectReviewList(String userId) throws Exception {
		return sqlSession.selectList("UserMapper.selectReviewList",userId);
	}

	@Override
	public void updateConnexionNoticeY(ConnexionVO connexionVO) throws Exception {
		sqlSession.update("UserMapper.updateConnexionNoticeY",connexionVO);		
	}

	@Override
	public void updateConnexionNoticeN(ConnexionVO connexionVO) throws Exception {
		sqlSession.update("UserMapper.updateConnexionNoticeN",connexionVO);				
	}

	@Override
	public List<BusiNoticeVO> selectBusiNoticeList(int userNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectBusiNoticeList",userNo);
	}
	@Override
	public void updateUserSumAccountPlus(UserSumAccountVO sumAccountVO) throws Exception {
		sqlSession.insert("UserMapper.updateUserSumAccountPlus",sumAccountVO);
		
	}
	@Override
	public List<AdvertVO> selectBusiKeywordList() throws Exception {
		return sqlSession.selectList("UserMapper.selectBusiKeywordList");
	}

	@Override
	public AdvertVO selectBusiKeywordByAdvertNo(int advertNo) throws Exception {
				
		return sqlSession.selectOne("UserMapper.selectBusiKeywordByAdvertNo",advertNo);
	}
	@Override
	public void updateDeductAdvert(int advertNo) throws Exception {
		 sqlSession.update("UserMapper.updateDeductAdvert",advertNo);
		
	}
	@Override
	public int selectChatYn(int targetUserNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectChatYn",targetUserNo);
	}

	@Override
	public ProductVO selectAccountByProductNo(int productNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectAccountByProductNo",productNo);
	}
	@Override
	public void insertSumAccount(UserSumAccountVO sumAccount) throws Exception {
		sqlSession.insert("UserMapper.insertSumAccount",sumAccount);
		
	}
	@Override
	public int selectSumAccountCnt(String accountNum) throws Exception {
		return sqlSession.selectOne("UserMapper.selectSumAccountCnt",accountNum);
	}

	@Override
	public void updatePurchaseTrade(UserTradeVO tradeVO) throws Exception {
		sqlSession.update("UserMapper.updatePurchaseTrade",tradeVO);
	}

	@Override
	public void updatePurchaseProduct(ProductVO productVO) throws Exception {
		sqlSession.update("UserMapper.updatePurchaseProduct",productVO);
	}

	@Override
	public void insertPurchaseAccount(UserAccountVO accountVO) throws Exception {
		sqlSession.insert("UserMapper.insertPurchaseAccount",accountVO);
	}

	@Override
	public void updatePurchaseSumAccount(UserSumAccountVO sumAccountVO) throws Exception {
		sqlSession.update("UserMapper.updatePurchaseSumAccount",sumAccountVO);
	}

	@Override
	public void insertSalesAccount(UserAccountVO accountVO) throws Exception {
		sqlSession.insert("UserMapper.insertSalesAccount",accountVO);
		
	}

	@Override
	public void updateSalesSumAccount(UserSumAccountVO sumAccountVO) throws Exception {
		sqlSession.update("UserMapper.updateSalesSumAccount",sumAccountVO);
		
	}
	@Override
	public List<ProductVO> selectPurchaseList(int tradeUserNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectPurchaseList",tradeUserNo);
	}

	@Override
	public ProductVO selectPurchaseDetail(ProductVO productVO) throws Exception {
		return sqlSession.selectOne("UserMapper.selectPurchaseDetail",productVO);
	}

	

	
}
