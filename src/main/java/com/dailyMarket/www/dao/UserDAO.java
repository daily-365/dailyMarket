package com.dailyMarket.www.dao;

import java.util.List;
import java.util.Map;

import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.AnswerVO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiNoticeFileVO;
import com.dailyMarket.www.vo.BusiNoticeVO;
import com.dailyMarket.www.vo.BusiReviewFileVO;
import com.dailyMarket.www.vo.BusiReviewVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.CarFileVO;
import com.dailyMarket.www.vo.CarVO;
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
import com.dailyMarket.www.vo.UserTradeVO;
import com.dailyMarket.www.vo.UserVO;

public interface UserDAO {

	public void insertUserRegist(UserVO userVO)throws Exception;
	public int selectUserLogin(UserVO userVO)throws Exception;
	public UserVO selectUserByUserId(String userId)throws Exception;
	public void insertUserProduct(ProductVO productVO)throws Exception;
	public void insertUserFile(Map<String,Object> map)throws Exception;
	public List<ProductVO> selectProductList(ProductVO productVO)throws Exception;
	public void updateProductHitCnt(int productNo)throws Exception;
	public ProductVO selectProductDetail(int productNo)throws Exception;
	public List<ProductFileVO> selectProductFile(int productNo)throws Exception;
	public List<BusiVO> selectBusiList(BusiVO busiVO)throws Exception;
	public BusiVO selectByBusiNo(int busiNo)throws Exception;
	public BusiFileVO selectBusiFile(int busiNo)throws Exception;
	public int updateBusiHitCnt(int busiNo)throws Exception;
	public List<StoreFileVO> selectStoreList(int busiNo)throws Exception;
	public List<MenuVO> selectMenuList(int busiNo)throws Exception;
	public void insertEstateOne(EstateVO estateVO)throws Exception;
	public void insertEstateFile(Map<String, Object> map)throws Exception;
	public void updateEstateTwo(EstateVO estateVO)throws Exception;
	public void updateEstateThree(EstateVO estateVO)throws Exception;
	public List<EstateVO>selectEstateList(EstateVO estateVO)throws Exception;
	public List<EstateFileVO>selectEstateFile(EstateFileVO estateFileVO)throws Exception;
	public EstateVO selectEstateDetail(int esNo)throws Exception;
	public List<EstateFileVO> selectEstateFileDetail(int esNo)throws Exception;
	public void updateEstateHitCnt(int esNo)throws Exception;
	public void insertCarRegist(CarVO carVO)throws Exception;
	public void insertCarFile(Map<String, Object>map)throws Exception;
	public List<CarVO>selectCarList(CarVO carVO)throws Exception;
	public List<CarFileVO>selectCarFile(CarFileVO carFileVO)throws Exception;
	public CarVO selectCarVO(int carNo)throws Exception;
	public void updateCarHitCnt(int carNo)throws Exception;
	public List<JobVO>selectJobList(JobVO jobVO)throws Exception;
	public List<JobFileVO>selectJobFile(JobFileVO jobFileVO)throws Exception;
	public JobVO selectJobByNo(int jobNo)throws Exception;
	public List<BusiNoticeVO>selectCompanyNoticeList(BusiNoticeVO busiNoticeVO)throws Exception;
	public BusiNoticeVO selectCompanyNoticeByNO(int busiNoticeNo)throws Exception;
	public List<BusiNoticeFileVO> selectCompanyNoticeFileByNo(int busiNoticeNo)throws Exception;
	public void updateNoticeHitCnt(int busiNoticeNo)throws Exception;
	public void insertCompanyReview (BusiReviewVO busiReviewVO)throws Exception;
	public void insertCompanyReviewFile (Map<String,Object> map)throws Exception;
	public List<BusiReviewVO> selectCompanyReviewList()throws Exception;
	public BusiReviewVO selectReviewByReviewNo(int busiReviewNo)throws Exception;
	public List<BusiReviewVO> selectCompanyReviewByBusiNo(BusiReviewVO busiReviewVO)throws Exception;
	public List<BusiReviewFileVO>selectCompanyReviewFileByBusiViewNo(int busiReviewNo)throws Exception;
	public void updateReviewHitCnt(int busiReviewNo)throws Exception;
	public void insertUserJob(UserJobVO userJobVO)throws Exception;
	public void insertUserJobFile(Map<String, Object> map)throws Exception;
	public UserJobVO selectUserJobByWriter(String writer)throws Exception;
	public void updateUserJob(UserJobVO userJobVO)throws Exception;
	public void deleteUserJobFile()throws Exception;
	public void deleteUserJob(String writer)throws Exception;
	public void deleteUserJobFile(String writer)throws Exception;
	public int selectUserJobWrtieYn(String writer)throws Exception;
	public void insertGetUserJob(GetUserJobVO getUserJovVo)throws Exception;
	public int selectGetUserJobYn(GetUserJobVO getUserJobVO)throws Exception;
	public void updateJobHitCnt(int jobNo)throws Exception;
	public UserVO selectUserByWriter(String userId)throws Exception;
	public int selectUserPassChk(UserVO userVO)throws Exception;
	public void updateUserInfo(UserVO userVO)throws Exception;
	public void insertUserPofileFile(Map<String, Object> map)throws Exception;
	public UserProfileFileVO selectUserProfileYn(String userId)throws Exception;
	public void deleteUserProfileFile(int fileNo)throws Exception;
	public List<UserProfileFileVO> selectUserProfileFileList()throws Exception;
	public UserVO selectPrevPassChk(String userId)throws Exception;
	public void updateModPass(UserVO userVO)throws Exception;
	public void insertAccount(UserAccountVO userAccountVO)throws Exception;
	public List<UserAccountVO> selectAccount(String userId)throws Exception;
	public void insertUserTrade(UserTradeVO userTradeVO)throws Exception;
	public void updateUserLike(int productNo)throws Exception;
	public ProductVO selectProductByNo(int productNo)throws Exception;
	public void updateUserLikeCancle(int productNo)throws Exception;
	public List<UserTradeVO>selectLikeList(String userId)throws Exception;
	public List<ProductVO>selectProductSalesList(String userId)throws Exception;
	public List<EventVO>selectEventList(SearchCriteria scri)throws Exception;
	public List<NoticeVO>selectNoticeList(SearchCriteria scri)throws Exception;
	public int selectEventTotalCnt(SearchCriteria  scri)throws Exception;
	public int selectNoticeTotalCnt(SearchCriteria scri)throws Exception;
	public NoticeVO selectNoticeByNo(int noticeNo)throws Exception;
	public List<NoticeFileVO> selectNoticeFile(int noticeNo)throws Exception;
	public Map<String, Object> selectNoticeFileByNo(Map<String,Object> map)throws Exception;
	public void insertInquiry(InquiryVO inquiryVO)throws Exception;
	public void insertInquiryFile(Map<String,Object> map)throws Exception;
	public List<InquiryVO>selectInquiryList()throws Exception;
	public List<InquiryVO> selectInquiryByWriter(String userId)throws Exception;
	public void updateInquiryHitCnt(int inquiryNo)throws Exception;
	public InquiryVO selectInquiryByNo(int inquiryNo)throws Exception;
	public AnswerVO selectAnswerByInquiryNo(int inquiryNo)throws Exception;
	public List<InquiryVO>selectInquirySearch(SearchCriteria scri)throws Exception;
}