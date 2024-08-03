package com.dailyMarket.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailyMarket.www.dao.UserDAO;
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
import com.dailyMarket.www.vo.GetUserJobVO;
import com.dailyMarket.www.vo.JobFileVO;
import com.dailyMarket.www.vo.JobVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;
import com.dailyMarket.www.vo.UserJobVO;
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
	public List<ProductVO> selectProductDetail(int productNo) throws Exception {
		return userDAO.selectProductDetail(productNo);
	}

	@Override
	public List<BusiVO> selectBusiList(BusiVO busiVO) throws Exception {
		return userDAO.selectBusiList(busiVO);
	}

	@Override
	public BusiVO selectByBusiNo(int busiNo) throws Exception {
		return userDAO.selectByBusiNo(busiNo);
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
	public List<BusiNoticeVO> selectCompanyNoticeList(String writer) throws Exception {
		return userDAO.selectCompanyNoticeList(writer);
	}

	@Override
	public List<BusiNoticeFileVO> selectCompanyNoticeFile(String writer) throws Exception {
		return userDAO.selectCompanyNoticeFile(writer);
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
	public BusiReviewVO selectCompanyReviewByBusiNo(int busiNo) throws Exception {
		return userDAO.selectCompanyReviewByBusiNo(busiNo);
	}

	@Override
	public List<BusiReviewVO> selectCompanyReviewListByBusiNo(int busiNo) throws Exception {
		return userDAO.selectCompanyReviewListByBusiNo(busiNo);
	}

	@Override
	public List<BusiReviewFileVO> selectCompanyReviewFileByBusiViewNo(int busiReviewNo) throws Exception {
		return userDAO.selectCompanyReviewFileByBusiViewNo(busiReviewNo);
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
	public boolean selectGetUserJobYn(String userId) throws Exception {
		int result = userDAO.selectGetUserJobYn(userId);
		if(result>0) {
			return true;
		}else {
			return false;
		}

	}

	

	
}
