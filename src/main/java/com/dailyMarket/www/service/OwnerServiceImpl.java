package com.dailyMarket.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailyMarket.www.dao.OwnerDAO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.JobVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.StoreFileVO;

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
	public void insertJob(JobVO jobVO) throws Exception {
		ownerDAO.insertJob(jobVO);
	}
	@Override
	public void insertJobFile(Map<String, Object> map) throws Exception {
		ownerDAO.insertJobFile(map);		
	}
	
	
	
	
	
}
