package com.dailyMarket.www.service;

import java.util.List;
import java.util.Map;

import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.AdminChatVO;
import com.dailyMarket.www.vo.AdminVO;
import com.dailyMarket.www.vo.AdvertVO;
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

public interface AdminService {

	public boolean adminLogin(AdminVO adminVO)throws Exception;
	
	public List<ProductVO>selectProductList(SearchCriteria scri)throws Exception;
	public int selectProductTotalCount(SearchCriteria scri)throws Exception;
	public ProductVO selectProductByProductNo(int productNo)throws Exception;
	public void deleteProduct(int productNo)throws Exception;
	public void updateProduct(int productNo)throws Exception;
	public List<ProductFileVO>selectProductFile(int productNo)throws Exception;
	
	public List<BusiVO>selectBusiList(SearchCriteria scri)throws Exception;
	public BusiVO selectBusiByBusiNo(int busiNo)throws Exception;
	public void updateBusistatus(BusiVO busiVO)throws Exception;
	public int selectBusiTotalCount(SearchCriteria scri)throws Exception;
	public List<BusiFileVO>selectBusiFile(int busiNo)throws Exception;
	public List<StoreFileVO>selectStoreFile(int busiNo)throws Exception;
	public List<MenuVO>selectMenuList(int busiNo)throws Exception;
	
	public List<JobVO> selectJobList(SearchCriteria scri)throws Exception;
	public int selectJobtotalCount(SearchCriteria scri)throws Exception;
	public JobVO selectJobDetail(int jobNo)throws Exception;
	public List<JobFileVO>selectJobFile(int jobNo)throws Exception;
	
	public List<EstateVO>selectEstateList(SearchCriteria scri)throws Exception;
	public int selectEstateTotalCount(SearchCriteria scri)throws Exception;
	public EstateVO selectEstateDetail(int esNo)throws Exception;
	public List<EstateFileVO>selectEstateFile(int esNo)throws Exception;

	public List<CarVO> selectCarList(SearchCriteria scri)throws Exception;
	public int selectCarTotalCount(SearchCriteria scri)throws Exception;
	public CarVO selectCarDetail(int carNo)throws Exception;
	public List<CarFileVO>selectCarFile(int carNo)throws Exception;

	public List<UserVO>selectUserList(SearchCriteria scri)throws Exception; 
	public int selectUserTotalCount(SearchCriteria scri)throws Exception;
	public UserVO selectUserDetail(String userId)throws Exception;
	public List<UserProfileFileVO> selectUserFile(String userId)throws Exception;
	public List<UserAccountVO>selectUserAccount(String userId)throws Exception;
	public List<UserAccountVO> selectUserAccountDetail(UserAccountVO accountVO)throws Exception;
	public List<UserTradeVO>selectUserTrade(String userId)throws Exception;
	
	public void insertEventData(EventVO eventVO)throws Exception;
	public List<EventVO>selectEventList(SearchCriteria scri)throws Exception;
	public int selectEventTotalCnt(SearchCriteria scri)throws Exception;
	public EventVO selectEventVO(int eventNo)throws Exception;
	public void updateEventModify(EventVO eventVO)throws Exception;
	public void updateEventDelete(int eventNo)throws Exception;
	
	public void insertNoticeWrite(NoticeVO noticeVO)throws Exception;
	public void insertNoticeFile(Map<String,Object>map)throws Exception;
	public List<NoticeVO>selectNoticeList(SearchCriteria scri)throws Exception;
	public int selectNoticeTotalCnt(SearchCriteria scri)throws Exception;
	public NoticeVO selectNoticeVO(int noticeNo)throws Exception;
	public List<NoticeFileVO> selectNoticeFile(int noticeNo)throws Exception;
	public Map<String,Object>selectNoticeFileNoMap(Map<String,Object>map)throws Exception;
	public void deleteNoticeFile(int fileNo)throws Exception;
	public void updateNoticeVO(NoticeVO noticeVO)throws Exception;
	public void deleteNoticeVO(int noticeNo)throws Exception;

	public List<InquiryVO> selectInquiryList(SearchCriteria scri)throws Exception;
	public int selectInquiryTotalCnt(SearchCriteria scri)throws Exception;
	public InquiryVO selectByInquiryNo(int inquirtNo)throws Exception;
	public List<InquiryFileVO>selectInquiryFile(int inquirtNo)throws Exception;
	public void insertAnswerByInquiryNo(AnswerVO answerVO)throws Exception;
	public void updateInquiryStatus(int inquiryNo)throws Exception;
	public AnswerVO selectAnswerByInquiryNo(int inquirtNo)throws Exception;
	public void updateAnswerByInquiryNo(AnswerVO answerVO)throws Exception;
	public void deleteAnswerByInquiryNo(int inquirtNo)throws Exception;
	
	public List<AdvertVO>selectAdvertList(SearchCriteria scri)throws Exception;
	public int selectAdvertTotalCnt(SearchCriteria scri)throws Exception;
	public AdvertVO SelectAdvertDetail(int advertNo)throws Exception;
	
	public void updatePriceAgree(int advertNo)throws Exception;
	public void updatePriceDisAgree(int advertNo)throws Exception;
	public void updateApproveAgree(int advertNo)throws Exception;
	public void updateApproveDisAgree(int advertNo)throws Exception;
	
	
	public void insertChatMessage(AdminChatVO chatVO)throws Exception;
	public List<AdminChatVO>selectChatList(int targetUserNo)throws Exception;
	public List<AdminChatVO>selectChatRoom(SearchCriteria scri)throws Exception;
	public int selectChatRoomTotalCnt(SearchCriteria scri)throws Exception;
	public void updateReadMessage(int targetUserNo)throws Exception;

}
