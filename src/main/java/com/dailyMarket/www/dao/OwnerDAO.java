package com.dailyMarket.www.dao;

import java.util.List;
import java.util.Map;

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

public interface OwnerDAO {
	public int selectBusiNumDupChk(String busiNum)throws Exception;
	public void insertOwnerRegist(BusiVO busiVO)throws Exception;
	public void insertBusiFile(Map<String, Object> map)throws Exception;
	public BusiVO selectBusiByWriter(String userId)throws Exception;
	public void deleteBusiFile(int busiFileNo)throws Exception;
	public void updateBusi(BusiVO busiVO)throws Exception;
	public void deleteBusi(int busiNo)throws Exception;
	public void insertStoreFile(Map<String,Object> map)throws Exception;
	public List<StoreFileVO> selectStoreFile(int busiNo)throws Exception;
	public void deleteStoreFile(int busiNo)throws Exception;
	public void deleteStoreFileByFileNo(int fileNo)throws Exception;
	public void insertMenu(Map<String,Object>map)throws Exception;
	public int insertMenuFile(Map<String,Object>map)throws Exception;
	public int menuFileNoCnt()throws Exception;
	public List<MenuVO> selectMenuList(int busiNo)throws Exception;
	public void insertJob(JobVO jobVO)throws Exception;
	public void insertJobFile(Map<String,Object> map)throws Exception;
	public void updateMenuFile(int fileNo)throws Exception;
	public void deleteAllMenu(int busiNo)throws Exception;
	public void deleteAllMenuFile(int busiNo)throws Exception;
	public JobVO selectJobByWriter(String writer)throws Exception;
	public List<JobFileVO>selectJobFile(int jobNo)throws Exception;
	public void updateJobFile(int fileNo)throws Exception;
	public void updateJob(JobVO jobVO)throws Exception;
	public void deleteJob(int jobNo)throws Exception;
	public void deleteJobFile(int jobNo)throws Exception;
	public void insertCompanyNotice(BusiNoticeVO busiNoticeVO)throws Exception;
	public void insertCompanyNoticeFile(Map<String,Object> map)throws Exception;
	public List<GetUserJobVO>selectGetUserJobList(int jobNo)throws Exception;
	public void updateGetUserJobStatusY(int getUserJobNo)throws Exception;
	public void updateGetUserJobStatusN(int getUserJobNo)throws Exception;
	public void insertAdvert(AdvertVO advertVO)throws Exception;
	public void insertAdvertFile(Map<String,Object>map)throws Exception;
	public AdvertVO selectAdvertByuserNo(int userNo)throws Exception;
	public UserAccountVO selectUserAcoount(UserAccountVO accountVO)throws Exception;
	public void updateUserSumAccountMinus(UserSumAccountVO sumAccountVO)throws Exception;
	public void insertUserAccountMinus(UserAccountVO accountVO)throws Exception;
	public void insertAdminAccount(AdminAccountVO admAccountVO)throws Exception;
	public void updateAdminSumAccount(AdminSumAccountVO admSumAccountVO)throws Exception;
	public void updateAdvertModify(AdvertVO advertVO)throws Exception;
	public void updateAdvertDelete(int userNo)throws Exception;
	public void updatePrevAdvertFileDelete(int fileNo)throws Exception;
	
}
