package com.dailyMarket.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailyMarket.www.dao.UserDAO;
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

@Service
public class UserServiceImpl implements UserService{
	

	@Autowired
	private UserDAO userDAO;

	@Override
	public void insertUserRegist(UserVO userVO) throws Exception {
		userDAO.insertUserRegist(userVO);
	}

	@Override
	public boolean selectUserLogin(UserVO userVO) throws Exception {
		int result = userDAO.selectUserLogin(userVO);
		if(result>=1) {
			return true;
		}else {
			return false;
		}
	}

	
	
	@Override
	public UserVO selectUserByUserId(String userId) throws Exception {
		return userDAO.selectUserByUserId(userId);
	}

	@Override
	public void insertUserProduct(ProductVO productVO) throws Exception {
		userDAO.insertUserProduct(productVO);
		
	}

	@Override
	public void insertUserFile(Map<String, Object> map) throws Exception {
		userDAO.insertUserFile(map);
		
	}
	
	@Override
	public List<ProductVO> selectProductList(ProductVO productVO) throws Exception {
		return userDAO.selectProductList(productVO);
	}

	@Override
	public void updateProductHitCnt(int productNo) throws Exception {
		userDAO.updateProductHitCnt(productNo);
	}

	@Override
	public ProductVO selectProductDetail(int productNo) throws Exception {
		return userDAO.selectProductDetail(productNo);
	}
	
	@Override
	public List<ProductFileVO> selectProductFile(int productNo) throws Exception {
		return userDAO.selectProductFile(productNo);
	}

	@Override
	public List<BusiVO> selectBusiList(BusiVO busiVO) throws Exception {
		return userDAO.selectBusiList(busiVO);
	}

	@Override
	public BusiVO selectByBusiNo(BusiVO busiVO) throws Exception {
		return userDAO.selectByBusiNo(busiVO);
	}
	
	@Override
	public BusiFileVO selectBusiFile(int busiNo) throws Exception {
		return userDAO.selectBusiFile(busiNo);
	}

	@Override
	public int updateBusiHitCnt(int busiNo) throws Exception {
		return userDAO.updateBusiHitCnt(busiNo);
	}

	@Override
	public List<StoreFileVO> selectStoreList(int busiNo) throws Exception {
		return userDAO.selectStoreList(busiNo);
	}

	@Override
	public List<MenuVO> selectMenuList(int busiNo) throws Exception {
		return userDAO.selectMenuList(busiNo);
	}

	@Override
	public void insertEstateOne(EstateVO estateVO) throws Exception {
		userDAO.insertEstateOne(estateVO);
	}

	@Override
	public void insertEstateFile(Map<String, Object> map) throws Exception {
		userDAO.insertEstateFile(map);
	}

	@Override
	public void updateEstateTwo(EstateVO estateVO) throws Exception {
		userDAO.updateEstateTwo(estateVO);
	}
	@Override
	public void updateEstateThree(EstateVO estateVO) throws Exception {
		userDAO.updateEstateThree(estateVO);
	}
	@Override
	public List<EstateVO> selectEstateList(EstateVO estateVO) throws Exception {
		return userDAO.selectEstateList(estateVO);
	}

	@Override
	public List<EstateFileVO> selectEstateFile(EstateFileVO estateFileVO) throws Exception {
		return userDAO.selectEstateFile(estateFileVO);
	}

	@Override
	public EstateVO selectEstateDetail(int esNo) throws Exception {
		return userDAO.selectEstateDetail(esNo);
	}

	@Override
	public List<EstateFileVO> selectEstateFileDetail(int esNo) throws Exception {
		return userDAO.selectEstateFileDetail(esNo);
	}

	@Override
	public void updateEstateHitCnt(int esNo) throws Exception {
		userDAO.updateEstateHitCnt(esNo);
	}

	@Override
	public void insertCarRegist(CarVO carVO) throws Exception {
		userDAO.insertCarRegist(carVO);		
	}

	@Override
	public void insertCarFile(Map<String, Object> map) throws Exception {
		userDAO.insertCarFile(map);
	}

	@Override
	public List<CarVO> selectCarList(CarVO carVO) throws Exception {
		return userDAO.selectCarList(carVO);
	}

	@Override
	public List<CarFileVO> selectCarFile(CarFileVO carFileVO) throws Exception {
		return userDAO.selectCarFile(carFileVO);
	}

	@Override
	public CarVO selectCarVO(int carNo) throws Exception {
		return userDAO.selectCarVO(carNo);
	}
	
	@Override
	public void updateCarHitCnt(int carNo) throws Exception {
		userDAO.updateCarHitCnt(carNo);
	}

	@Override
	public List<JobVO> selectJobList(JobVO jobVO) throws Exception {
		return userDAO.selectJobList(jobVO);
	}

	@Override
	public List<JobFileVO> selectJobFile(JobFileVO jobFileVO) throws Exception {
		return userDAO.selectJobFile(jobFileVO);
	}

	@Override
	public JobVO selectJobByNo(int jobNo) throws Exception {
		return userDAO.selectJobByNo(jobNo);
	}

	@Override
	public void updateJobHitCnt(int jobNo) throws Exception {
		userDAO.updateCarHitCnt(jobNo);
	}

	@Override
	public List<BusiNoticeVO> selectCompanyNoticeList(BusiNoticeVO busiNoticeVO ) throws Exception {
		return userDAO.selectCompanyNoticeList(busiNoticeVO);
	}


	@Override
	public BusiNoticeVO selectCompanyNoticeByNO(int busiNoticeNo) throws Exception {
		return userDAO.selectCompanyNoticeByNO(busiNoticeNo);
	}

	@Override
	public List<BusiNoticeFileVO> selectCompanyNoticeFileByNo(int busiNoticeNo) throws Exception {
		return userDAO.selectCompanyNoticeFileByNo(busiNoticeNo);
	}

	@Override
	public void updateNoticeHitCnt(int busiNoticeNo) throws Exception {
		userDAO.updateNoticeHitCnt(busiNoticeNo);
	}

	@Override
	public void insertCompanyReview(BusiReviewVO busiReviewVO) throws Exception {
		userDAO.insertCompanyReview(busiReviewVO);		
	}

	@Override
	public void insertCompanyReviewFile(Map<String, Object> map) throws Exception {
		userDAO.insertCompanyReviewFile(map);
	}

	@Override
	public List<BusiReviewVO> selectCompanyReviewList() throws Exception {
		return userDAO.selectCompanyReviewList();
	}

	@Override
	public BusiReviewVO selectReviewByReviewNo(int busiReviewNo)throws Exception {
		return userDAO.selectReviewByReviewNo(busiReviewNo);
	}

	@Override
	public List<BusiReviewVO> selectCompanyReviewByBusiNo(BusiReviewVO busiReviewVO) throws Exception {
		return userDAO.selectCompanyReviewByBusiNo(busiReviewVO);
	}

	@Override
	public List<BusiReviewFileVO> selectCompanyReviewFileByBusiViewNo(int busiReviewNo) throws Exception {
		return userDAO.selectCompanyReviewFileByBusiViewNo(busiReviewNo);
	}

	@Override
	public void updateReviewHitCnt(int busiReviewNo) throws Exception {
		userDAO.updateReviewHitCnt(busiReviewNo);
	}

	@Override
	public void insertUserJob(UserJobVO userJobVO) throws Exception {
		userDAO.insertUserJob(userJobVO);
	}

	@Override
	public void insertUserJobFile(Map<String, Object> map) throws Exception {
		userDAO.insertUserJobFile(map);
		userDAO.deleteUserJobFile();
	}

	@Override
	public UserJobVO selectUserJobByWriter(String writer) throws Exception {
		return userDAO.selectUserJobByWriter(writer);
	}

	@Override
	public void updateUserJob(UserJobVO userJobVO) throws Exception {
		userDAO.updateUserJob(userJobVO);
	}

	@Override
	public void deleteUserJob(String writer) throws Exception {
		userDAO.deleteUserJob(writer);
		userDAO.deleteUserJobFile(writer);
	}

	@Override
	public boolean selectUserJobWrtieYn(String writer) throws Exception {
		int result = userDAO.selectUserJobWrtieYn(writer);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void insertGetUserJob(GetUserJobVO getUserJovVo) throws Exception {
		userDAO.insertGetUserJob(getUserJovVo);
	}

	@Override
	public boolean selectGetUserJobYn(GetUserJobVO getUserJobVO) throws Exception {
		int result = userDAO.selectGetUserJobYn(getUserJobVO);
		if(result>0) {
			return true;
		}else {
			return false;
		}

	}

	@Override
	public UserVO selectUserByWriter(String userId) throws Exception {
		return userDAO.selectUserByWriter(userId);
	}

	@Override
	public boolean selectUserPassChk(UserVO userVO) throws Exception {
		int result = userDAO.selectUserPassChk(userVO);
		
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void updateUserInfo(UserVO userVO) throws Exception {
		userDAO.updateUserInfo(userVO);
	}

	@Override
	public void insertUserPofileFile(Map<String, Object> map) throws Exception {
		userDAO.insertUserPofileFile(map);
	}

	@Override
	public UserProfileFileVO selectUserProfileYn(String userId) throws Exception {
		return userDAO.selectUserProfileYn(userId);
	}

	@Override
	public void deleteUserProfileFile(int fileNo) throws Exception {
		userDAO.deleteUserProfileFile(fileNo);
	}
	
	@Override
	public List<UserProfileFileVO> selectUserProfileFileList() throws Exception {
		return userDAO.selectUserProfileFileList();
	}

	@Override
	public UserVO selectPrevPassChk(String userId) throws Exception {
		return userDAO.selectPrevPassChk(userId);
	}

	@Override
	public void updateModPass(UserVO userVO) throws Exception {
		userDAO.updateModPass(userVO);
		
	}

	@Override
	public void insertAccount(UserAccountVO userAccountVO) throws Exception {
		userDAO.insertAccount(userAccountVO);
		
		
	}

	@Override
	public List<UserAccountVO> selectSumAccountList(int userNo) throws Exception {
		return userDAO.selectSumAccountList(userNo);
	}

	@Override
	public void insertUserTrade(UserTradeVO userTradeVO) throws Exception {
		userDAO.insertUserTrade(userTradeVO);
	}

	@Override
	public void updateUserLike(int productNo) throws Exception {
		userDAO.updateUserLike(productNo);
	}

	@Override
	public ProductVO selectProductByNo(int productNo) throws Exception {
		return userDAO.selectProductByNo(productNo);
	}

	@Override
	public void updateUserLikeCancle(int productNo) throws Exception {
		userDAO.updateUserLikeCancle(productNo);		
	}
	

	@Override
	public List<UserTradeVO> selectLikeList(int userNo) throws Exception {
		return userDAO.selectLikeList(userNo);
	}

	@Override
	public List<ProductVO> selectProductSalesList(int userNo) throws Exception {
		return userDAO.selectProductSalesList(userNo);
	}
	
	@Override
	public void updateProductSaleCancle(int productNo) throws Exception {
		userDAO.updateProductSaleCancle(productNo);
		
	}

	@Override
	public List<EventVO> selectEventList(SearchCriteria scri) throws Exception {
		return userDAO.selectEventList(scri);
	}
	@Override
	public List<NoticeVO> selectNoticeList(SearchCriteria scri) throws Exception {
		return userDAO.selectNoticeList(scri);
	}

	@Override
	public int selectEventTotalCnt(SearchCriteria scri) throws Exception {
		return userDAO.selectEventTotalCnt(scri);
	}
	@Override
	public int selectNoticeTotalCnt(SearchCriteria scri) throws Exception {
		return userDAO.selectNoticeTotalCnt(scri);
	}
	@Override
	public NoticeVO selectNoticeByNo(int noticeNo) throws Exception {
		return userDAO.selectNoticeByNo(noticeNo);
	}
	@Override
	public List<NoticeFileVO> selectNoticeFile(int noticeNo) throws Exception {
		return userDAO.selectNoticeFile(noticeNo);
	}
	@Override
	public Map<String, Object> selectNoticeFileByNo(Map<String, Object> map) throws Exception {
		return userDAO.selectNoticeFileByNo(map);
	}

	@Override
	public void insertInquiry(InquiryVO inquiryVO) throws Exception {
		userDAO.insertInquiry(inquiryVO);
	}

	@Override
	public void insertInquiryFile(Map<String, Object> map) throws Exception {
		userDAO.insertInquiryFile(map);
	}

	@Override
	public List<InquiryVO> selectInquiryList() throws Exception {
		return userDAO.selectInquiryList();
	}

	@Override
	public List<InquiryVO> selectInquiryByWriter(String userId) throws Exception {
		return userDAO.selectInquiryByWriter(userId);
	}

	@Override
	public void updateInquiryHitCnt(int inquiryNo) throws Exception {
		userDAO.updateInquiryHitCnt(inquiryNo);
	}
	@Override
	public InquiryVO selectInquiryByNo(int inquiryNo) throws Exception {
		return userDAO.selectInquiryByNo(inquiryNo);
	}
	@Override
	public AnswerVO selectAnswerByInquiryNo(int inquiryNo) throws Exception {
		return userDAO.selectAnswerByInquiryNo(inquiryNo);
	}
	@Override
	public List<InquiryVO> selectInquirySearch(SearchCriteria scri) throws Exception {
		return userDAO.selectInquirySearch(scri);
	}

	@Override
	public void insertConnexion(ConnexionVO connexionVO) throws Exception {
		userDAO.insertConnexion(connexionVO);
	}

	@Override
	public boolean selectConnexionYn(ConnexionVO connexionVO) throws Exception {
		int result = userDAO.selectConnexionYn(connexionVO);
		if(result>0) {
			return true;
		}else {
			return false;
		}
		 
	}

	@Override
	public void updateConnexionDel(ConnexionVO connexionVO) throws Exception {
		userDAO.updateConnexionDel(connexionVO);
		
	}

	@Override
	public List<GetUserJobVO> selectGetJobList(String userId) throws Exception {
		return userDAO.selectGetJobList(userId);
	}

	@Override
	public void updateGetjobDel(int jobNo) throws Exception {
		userDAO.updateGetjobDel(jobNo);
	}

	@Override
	public List<ConnexionVO> selectConnexionList(int userNo) throws Exception {
		return userDAO.selectConnexionList(userNo);
	}

	@Override
	public List<BusiReviewVO> selectReviewList(String userId) throws Exception {
		return userDAO.selectReviewList(userId);
	}

	@Override
	public void updateConnexionNoticeY(ConnexionVO connexionVO) throws Exception {
		userDAO.updateConnexionNoticeY(connexionVO);
	}

	@Override
	public void updateConnexionNoticeN(ConnexionVO connexionVO) throws Exception {
		userDAO.updateConnexionNoticeN(connexionVO);
	}

	@Override
	public List<BusiNoticeVO> selectBusiNoticeList(int userNo) throws Exception {
		return userDAO.selectBusiNoticeList(userNo);
	}
	@Override
	public void updateUserSumAccountPlus(UserSumAccountVO sumAccountVO) throws Exception {
		userDAO.updateUserSumAccountPlus(sumAccountVO);
	}
	@Override
	public List<AdvertVO> selectBusiKeywordList() throws Exception {
		return userDAO.selectBusiKeywordList();
	}
	@Override
	public AdvertVO selectBusiKeywordByAdvertNo(int advertNo) throws Exception {
		
		return userDAO.selectBusiKeywordByAdvertNo(advertNo);
	}
	@Override
	public void updateDeductAdvert(int advertNo) throws Exception {
		userDAO.updateDeductAdvert(advertNo);
	}
	@Override
	public boolean selectChatYn(int targetUserNo) throws Exception {
		int result= userDAO.selectChatYn(targetUserNo);
		
		if(result>0) {
			return true;
		}else {
			return false;
		}
	
	}
	@Override
	public ProductVO selectAccountByProductNo(int productNo) throws Exception {
		return userDAO.selectAccountByProductNo(productNo);
	}

	@Override
	public void insertSumAccount(UserSumAccountVO sumAccount) throws Exception {
		userDAO.insertSumAccount(sumAccount);
	}

	@Override
	public int selectSumAccountCnt(String accountNum ) throws Exception {
		return userDAO.selectSumAccountCnt(accountNum);
	}

	@Override
	public void updatePurchaseTrade(UserTradeVO tradeVO) throws Exception {
		userDAO.updatePurchaseTrade(tradeVO);
	}

	@Override
	public void updatePurchaseProduct(ProductVO productVO) throws Exception {
		userDAO.updatePurchaseProduct(productVO);
	}

	@Override
	public void insertPurchaseAccount(UserAccountVO accountVO) throws Exception {
		userDAO.insertPurchaseAccount(accountVO);
	}
	@Override
	public void updatePurchaseSumAccount(UserSumAccountVO sumAccountVO) throws Exception {
		userDAO.updatePurchaseSumAccount(sumAccountVO);
	}

	@Override
	public void insertSalesAccount(UserAccountVO accountVO) throws Exception {
		userDAO.insertSalesAccount(accountVO);
	}

	@Override
	public void updateSalesSumAccount(UserSumAccountVO sumAccountVO) throws Exception {
		userDAO.updateSalesSumAccount(sumAccountVO);
	}

	@Override
	public List<ProductVO> selectPurchaseList(int tradeUserNo) throws Exception {
		return userDAO.selectPurchaseList(tradeUserNo);
	}

	@Override
	public ProductVO selectPurchaseDetail(ProductVO productVO) throws Exception {
		return userDAO.selectPurchaseDetail(productVO);
	}


	
	

	
}
