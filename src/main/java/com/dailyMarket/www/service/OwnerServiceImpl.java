package com.dailyMarket.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailyMarket.www.dao.OwnerDAO;
import com.dailyMarket.www.vo.AdminAccountVO;
import com.dailyMarket.www.vo.AdminSumAccountVO;
import com.dailyMarket.www.vo.AdvertFileVO;
import com.dailyMarket.www.vo.AdvertVO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiNoticeVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.GetUserJobVO;
import com.dailyMarket.www.vo.JobFileVO;
import com.dailyMarket.www.vo.JobVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.StoreFileVO;
import com.dailyMarket.www.vo.UserAccountVO;
import com.dailyMarket.www.vo.UserSumAccountVO;

@Service
public class OwnerServiceImpl implements OwnerService {

	@Autowired
	private OwnerDAO ownerDAO;

	@Override
	public boolean selectBusiNumDupChk(String busiNum) throws Exception {
		int result = ownerDAO.selectBusiNumDupChk(busiNum);
		if(result>0) {
			return false;
		}else {
			return true;
		}
	}
	@Override
	public void insertOwnerRegist(BusiVO busiVO) throws Exception {
		ownerDAO.insertOwnerRegist(busiVO);
	}
	@Override
	public void insertBusiFile(Map<String, Object> map) throws Exception {
		ownerDAO.insertBusiFile(map);
	}
	@Override
	public BusiVO selectBusiByWriter(String userId) throws Exception {
		return ownerDAO.selectBusiByWriter(userId);
	}
	
	
	@Override
	public void deleteBusiFile(int busiFileNo) throws Exception {
		ownerDAO.deleteBusiFile(busiFileNo);
	}
	@Override
	public void updateBusi(BusiVO busiVO) throws Exception {
		ownerDAO.updateBusi(busiVO);
	}
	@Override
	public void deleteBusi(int busiNo) throws Exception {
		ownerDAO.deleteBusi(busiNo);
	}
	@Override
	public void insertStoreFile(Map<String,Object>map) throws Exception {
		ownerDAO.insertStoreFile(map);
	}
	@Override
	public List<StoreFileVO> selectStoreFile(int busiNo) throws Exception {
		return ownerDAO.selectStoreFile(busiNo);
	}
	@Override
	public void deleteStoreFile(int busiNo) throws Exception {
		ownerDAO.deleteStoreFile(busiNo);
	}
	@Override
	public void deleteStoreFileByFileNo(int fileNo) throws Exception {
		ownerDAO.deleteStoreFileByFileNo(fileNo);
	}

	@Override
	public void insertMenu( Map<String,Object>map) throws Exception {
		ownerDAO.insertMenu(map);
	}
	@Override
	public void insertMenuFile(Map<String, Object> map) throws Exception {
		ownerDAO.insertMenuFile(map);
		
	}
	@Override
	public int menuFileNoCnt() throws Exception {
		return ownerDAO.menuFileNoCnt();
	}
	@Override
	public List<MenuVO> selectMenuList(int busiNo) throws Exception {
		return ownerDAO.selectMenuList(busiNo);
	}
	
	@Override
	public void updateMenuFile(int fileNo) throws Exception {
		ownerDAO.updateMenuFile(fileNo);
	}
	
	@Override
	public void deleteAllMenu(int busiNo) throws Exception {
		//Servie에서 메뉴 관련 파일 전체 삭제. 2개의 쿼리를 받아 수행.
		ownerDAO.deleteAllMenu(busiNo);
		ownerDAO.deleteAllMenuFile(busiNo);
	}
	
	@Override
	public void insertJob(JobVO jobVO) throws Exception {
		ownerDAO.insertJob(jobVO);
	}
	@Override
	public void insertJobFile(Map<String, Object> map) throws Exception {
		ownerDAO.insertJobFile(map);		
	}
	@Override
	public JobVO selectJobByWriter(String writer) throws Exception {
		return ownerDAO.selectJobByWriter(writer);
	}
	@Override
	public List<JobFileVO> selectJobFile(int jobNo) throws Exception {
		return ownerDAO.selectJobFile(jobNo);
	}
	@Override
	public void updateJobFile(int fileNo) throws Exception {
		ownerDAO.updateJobFile(fileNo);
	}
	@Override
	public void updateJob(JobVO jobVO) throws Exception {
		ownerDAO.updateJob(jobVO);
	}
	
	@Override
	public void deleteJob(int jobNo) throws Exception {
		//job과 jobFile 동시 삭제
		ownerDAO.deleteJob(jobNo);
		ownerDAO.deleteJobFile(jobNo);
	}
	
	@Override
	public void insertCompanyNotice(BusiNoticeVO busiNoticeVO) throws Exception {
		ownerDAO.insertCompanyNotice(busiNoticeVO);		
	}
	@Override
	public void insertCompanyNoticeFile(Map<String, Object> map) throws Exception {
		ownerDAO.insertCompanyNoticeFile(map);
	}
	
	@Override
	public List<GetUserJobVO> selectGetUserJobList(int jobNo) throws Exception {
		return ownerDAO.selectGetUserJobList(jobNo);
	}
	@Override
	public void updateGetUserJobStatusY(int getUserJobNo) throws Exception {
		ownerDAO.updateGetUserJobStatusY(getUserJobNo);
	}
	@Override
	public void updateGetUserJobStatusN(int getUserJobNo) throws Exception {
		ownerDAO.updateGetUserJobStatusN(getUserJobNo);
	}
	@Override
	public void insertAdvert(AdvertVO advertVO) throws Exception {
		ownerDAO.insertAdvert(advertVO);
	}
	@Override
	public void insertAdvertFile(Map<String,Object>map) throws Exception {
		ownerDAO.insertAdvertFile(map);
	}
	@Override
	public AdvertVO selectAdvertByuserNo(int userNo) throws Exception {
		return ownerDAO.selectAdvertByuserNo(userNo);
	}
	@Override
	public UserAccountVO selectUserAcoount(UserAccountVO accountVO) throws Exception {
		return ownerDAO.selectUserAcoount(accountVO);
		
	}
	@Override
	public void updateUserSumAccountMinus(UserSumAccountVO sumAccountVO) throws Exception {
		ownerDAO.updateUserSumAccountMinus(sumAccountVO);
	}
	@Override
	public void insertUserAccountMinus(UserAccountVO accountVO) throws Exception {
		ownerDAO.insertUserAccountMinus(accountVO);
	}
	@Override
	public void insertAdminAccount(AdminAccountVO admAccountVO) throws Exception {
		ownerDAO.insertAdminAccount(admAccountVO);		
	}
	@Override
	public void updateAdminSumAccount(AdminSumAccountVO admSumAccountVO) throws Exception {
		ownerDAO.updateAdminSumAccount(admSumAccountVO);
	}
	@Override
	public void updateAdvertModify(AdvertVO advertVO) throws Exception {
		ownerDAO.updateAdvertModify(advertVO);
	}
	@Override
	public void updateAdvertDelete(int userNo) throws Exception {
		ownerDAO.updateAdvertDelete(userNo);
	}
	@Override
	public void updatePrevAdvertFileDelete(int fileNo) throws Exception {
		ownerDAO.updatePrevAdvertFileDelete(fileNo);
	}

	
	
	
	
}
