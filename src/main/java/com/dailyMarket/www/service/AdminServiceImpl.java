package com.dailyMarket.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailyMarket.www.dao.AdminDAO;
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

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public boolean adminLogin(AdminVO adminVO) throws Exception {
		int result =adminDAO.adminLogin(adminVO);
		if(result>=1) {
			return true;
		}else {
			return false;
		}
	}

	
	@Override
	public List<ProductVO> selectProductList(SearchCriteria scri) throws Exception {
		return adminDAO.selectProductList(scri);
	}

	@Override
	public int selectProductTotalCount(SearchCriteria scri) throws Exception {
		return adminDAO.selectProductTotalCount(scri);
	}

	@Override
	public ProductVO selectProductByProductNo(int productNo) throws Exception {
		return adminDAO.selectProductByProductNo(productNo);
	}

	

	@Override
	public List<ProductFileVO> selectProductFile(int productNo) throws Exception {
		return adminDAO.selectProductFile(productNo);
	}





	@Override
	public void deleteProduct(int productNo) throws Exception {
		adminDAO.deleteProduct(productNo);
	}
	@Override
	public void updateProduct(int productNo) throws Exception {
		adminDAO.updateProduct(productNo);
		
	}





	@Override
	public List<BusiVO> selectBusiList(SearchCriteria scri) throws Exception {
		return adminDAO.selectBusiList(scri);
	}

	@Override
	public BusiVO selectBusiByBusiNo(int busiNo) throws Exception {
		return adminDAO.selectBusiByBusiNo(busiNo);
	}

	@Override
	public void updateBusistatus(BusiVO busiVO) throws Exception {
		adminDAO.updateBusistatus(busiVO);
	}

	@Override
	public int selectBusiTotalCount(SearchCriteria scri) throws Exception {
		return adminDAO.selectBusiTotalCount(scri);
	}

	public List<BusiFileVO> selectBusiFile(int busiNo) throws Exception {
		return adminDAO.selectBusiFile(busiNo);
	}

	@Override
	public List<StoreFileVO> selectStoreFile(int busiNo) throws Exception {
		return adminDAO.selcetStoreFile(busiNo);
	}
	
	@Override
	public List<MenuVO> selectMenuList(int busiNo) throws Exception {
		return adminDAO.selectMenuList(busiNo);
	}


	@Override
	public List<JobVO> selectJobList(SearchCriteria scri) throws Exception {
		return adminDAO.selectJobList(scri);
	}
	@Override
	public int selectJobtotalCount(SearchCriteria scri) throws Exception {
		return adminDAO.selectJobtotalCount(scri);
	}
	@Override
	public JobVO selectJobDetail(int jobNo) throws Exception {
		return adminDAO.selectJobDetail(jobNo);
	}
	@Override
	public List<JobFileVO> selectJobFile(int jobNo) throws Exception {
		return adminDAO.selectJobFile(jobNo);
	}
	@Override
	public List<EstateVO> selectEstateList(SearchCriteria scri) throws Exception {
		return adminDAO.selectEstateList(scri);
	}


	@Override
	public int selectEstateTotalCount(SearchCriteria scri) throws Exception {
		return adminDAO.selectEstateTotalCount(scri);
	}
	@Override
	public EstateVO selectEstateDetail(int esNo) throws Exception {
		return adminDAO.selectEstateDetail(esNo);
	}
	@Override
	public List<EstateFileVO> selectEstateFile(int esNo) throws Exception {
		return adminDAO.selectEstateFile(esNo);
	}


	@Override
	public List<CarVO> selectCarList(SearchCriteria scri) throws Exception {
		return adminDAO.selectCarList(scri);
	}
	@Override
	public int selectCarTotalCount(SearchCriteria scri) throws Exception {
		return adminDAO.selectCarTotalCount(scri);
	}
	@Override
	public CarVO selectCarDetail(int carNo) throws Exception {
		return adminDAO.selectCarDetail(carNo);
	}
	@Override
	public List<CarFileVO> selectCarFile(int carNo) throws Exception {
		return adminDAO.selectCarFile(carNo);
	}


	@Override
	public List<UserVO> selectUserList(SearchCriteria scri) throws Exception {
		return adminDAO.selectUserList(scri);
	}
	@Override
	public int selectUserTotalCount(SearchCriteria scri) throws Exception {
		return adminDAO.selectUserTotalCount(scri);
	}


	@Override
	public UserVO selectUserDetail(String userId) throws Exception {
		return adminDAO.selectUserDetail(userId);
	}
	@Override
	public List<UserProfileFileVO> selectUserFile(String userId) throws Exception {
		return adminDAO.selectUserFile(userId);
	}
	@Override
	public List<UserAccountVO> selectUserAccount(String userId) throws Exception {
		return adminDAO.selectUserAccount(userId);
	}
	
	@Override
	public List<UserAccountVO> selectUserAccountDetail(UserAccountVO accountVO) throws Exception {
		return adminDAO.selectUserAccountDetail(accountVO);
	}
	@Override
	public List<UserTradeVO> selectUserTrade(String userId) throws Exception {
		return adminDAO.selectUserTrade(userId);
	}


	@Override
	public void insertEventData(EventVO eventVO) throws Exception {
		adminDAO.insertEventData(eventVO);
	}
	@Override
	public List<EventVO> selectEventList(SearchCriteria scri) throws Exception {
		return adminDAO.selectEventList(scri);
	}

	@Override
	public int selectEventTotalCnt(SearchCriteria scri) throws Exception {
		return adminDAO.selectEventTotalCnt(scri);
	}

	@Override
	public EventVO selectEventVO(int eventNo) throws Exception {
		return adminDAO.selectEventVO(eventNo);
	}

	@Override
	public void updateEventModify(EventVO eventVO) throws Exception {
		adminDAO.updateEventModify(eventVO);
	}
	@Override
	public void updateEventDelete(int eventNo) throws Exception {
		adminDAO.updateEventDelete(eventNo);
	}


	@Override
	public List<NoticeVO> selectNoticeList(SearchCriteria scri) throws Exception {
		return adminDAO.selectNoticeList(scri);
	}
	@Override
	public int selectNoticeTotalCnt(SearchCriteria scri) throws Exception {
		return adminDAO.selectNoticeTotalCnt(scri);
	}
	@Override
	public NoticeVO selectNoticeVO(int noticeNo) throws Exception {
		return adminDAO.selectNoticeVO(noticeNo);
	}
	@Override
	public void insertNoticeWrite(NoticeVO noticeVO) throws Exception {
		adminDAO.insertNoticeWrite(noticeVO);
	}
	@Override
	public void insertNoticeFile(Map<String,Object>map) throws Exception {
		adminDAO.insertNoticeFile(map);
	}
	@Override
	public List<NoticeFileVO> selectNoticeFile(int noticeNo) throws Exception {
		return adminDAO.selectNoticeFile(noticeNo);
	}
	@Override
	public Map<String, Object> selectNoticeFileNoMap(Map<String, Object> map) throws Exception {
		return adminDAO.selectNoticeFileNoMap(map);
	}
	@Override
	public void deleteNoticeFile(int fileNo) throws Exception {
		adminDAO.deleteNoticeFile(fileNo);
	}
	@Override
	public void updateNoticeVO(NoticeVO noticeVO) throws Exception {
		adminDAO.updateNoticeVO(noticeVO);
	}
	@Override
	public void deleteNoticeVO(int noticeNo) throws Exception {
		adminDAO.deleteNoticeVO(noticeNo);
		adminDAO.deleteNoticeVO(noticeNo);
	}


	@Override
	public List<InquiryVO> selectInquiryList(SearchCriteria scri) throws Exception {
		return adminDAO.selectInquiryList(scri);
	}

	@Override
	public int selectInquiryTotalCnt(SearchCriteria scri) throws Exception {
		return adminDAO.selectInquiryTotalCnt(scri);
	}
	@Override
	public InquiryVO selectByInquiryNo(int inquirtNo) throws Exception {
		return adminDAO.selectByInquiryNo(inquirtNo);
	}
	@Override
	public List<InquiryFileVO> selectInquiryFile(int inquirtNo) throws Exception {
		return adminDAO.selectInquiryFile(inquirtNo);
	}
	@Override
	public void insertAnswerByInquiryNo(AnswerVO answerVO) throws Exception {
		adminDAO.insertAnswerByInquiryNo(answerVO);
	}
	
	@Override
	public AnswerVO selectAnswerByInquiryNo(int inquirtNo) throws Exception {
		return adminDAO.selectAnswerByInquiryNo(inquirtNo);
	}
	@Override
	public void updateAnswerByInquiryNo(AnswerVO answerVO) throws Exception {
		adminDAO.updateAnswerByInquiryNo(answerVO);
	}
	@Override
	public void deleteAnswerByInquiryNo(int inquirtNo) throws Exception {
		adminDAO.deleteAnswerByInquiryNo(inquirtNo);
	}
	@Override
	public void updateInquiryStatus(int inquiryNo) throws Exception {
		adminDAO.updateInquiryStatus(inquiryNo);
	}

	
	

	@Override
	public List<AdvertVO> selectAdvertList(SearchCriteria scri) throws Exception {
		return adminDAO.selectAdvertList(scri);
	}
	@Override
	public int selectAdvertTotalCnt(SearchCriteria scri) throws Exception {
		return adminDAO.selectAdvertTotalCnt(scri);
	}
	@Override
	public AdvertVO SelectAdvertDetail(int advertNo) throws Exception {
		return adminDAO.SelectAdvertDetail(advertNo);
	}


	@Override
	public void updatePriceAgree(int advertNo) throws Exception {
		adminDAO.updatePriceAgree(advertNo);
	}
	@Override
	public void updatePriceDisAgree(int advertNo) throws Exception {
		adminDAO.updatePriceDisAgree(advertNo);
	}
	@Override
	public void updateApproveAgree(int advertNo) throws Exception {
		adminDAO.updateApproveAgree(advertNo);
	}
	@Override
	public void updateApproveDisAgree(int advertNo) throws Exception {
		adminDAO.updateApproveDisAgree(advertNo);
	}


	
	@Override
	public void insertChatMessage(AdminChatVO chatVO) throws Exception {
		adminDAO.insertChatMessage(chatVO);
	}
	@Override
	public List<AdminChatVO> selectChatList(int targetUserNo) throws Exception {
		return adminDAO.selectChatList(targetUserNo);
	}
	@Override
	public List<AdminChatVO> selectChatRoom(SearchCriteria scri) throws Exception {
		return adminDAO.selectChatRoom(scri);
	}
	@Override
	public int selectChatRoomTotalCnt(SearchCriteria scri) throws Exception {
		return adminDAO.selectChatRoomTotalCnt(scri);
	}
	@Override
	public void updateReadMessage(int targetUserNo) throws Exception {
		adminDAO.updateReadMessage(targetUserNo);
	}
	

	
}
