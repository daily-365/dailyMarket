package com.dailyMarket.www.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dailyMarket.www.vo.BusiNoticeVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.GetUserJobVO;
import com.dailyMarket.www.vo.JobFileVO;
import com.dailyMarket.www.vo.JobVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.StoreFileVO;

@Repository
public class OwnerDAOImpl implements OwnerDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectBusiNumDupChk(String busiNum) throws Exception {
		return sqlSession.selectOne("OwnerMapper.selectBusiNumDupChk",busiNum);
	}
	@Override
	public void insertOwnerRegist(BusiVO busiVO) throws Exception {
		sqlSession.insert("OwnerMapper.insertOwnerRegist",busiVO);
	}
	@Override
	public void insertBusiFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("OwnerMapper.insertBusiFile",map);
	}
	@Override
	public BusiVO selectBusiByWriter(String userId) throws Exception {
		return sqlSession.selectOne("OwnerMapper.selectBusiByWriter",userId);
	}
	
	@Override
	public void deleteBusiFile(int busiFileNo) throws Exception {
		sqlSession.update("OwnerMapper.deleteBusiFile",busiFileNo);
		
	}
	@Override
	public void updateBusi(BusiVO busiVO) throws Exception {
		sqlSession.update("OwnerMapper.updateBusi",busiVO);
	}
	@Override
	public void deleteBusi(int busiNo) throws Exception {
		sqlSession.update("OwnerMapper.deleteBusi",busiNo);
	}
	@Override
	public void insertStoreFile(Map<String,Object>map) throws Exception {
		sqlSession.insert("OwnerMapper.insertStoreFile",map);
	}
	@Override
	public List<StoreFileVO> selectStoreFile(int busiNo) throws Exception {
		return sqlSession.selectList("OwnerMapper.selectStoreFile",busiNo);
	}
	@Override
	public void deleteStoreFile(int busiNo) throws Exception {
		sqlSession.update("OwnerMapper.deleteStoreFile",busiNo);
	}
	@Override
	public void deleteStoreFileByFileNo(int fileNo) throws Exception {
		sqlSession.update("OwnerMapper.deleteStoreFileByFileNo",fileNo);
	}
	
	@Override
	public int selectMenuExist(int busiNo) throws Exception {
		return sqlSession.selectOne("OwnerMapper.selectMenuExist");
	}
	@Override
	public int selectJobExist(String userId) throws Exception {
		return sqlSession.selectOne("OwnerMapper.selectJobExist");
	}
	@Override
	public void insertMenu( Map<String,Object>map) throws Exception {
		sqlSession.insert("OwnerMapper.insertMenu",map);
	}
	@Override
	public int insertMenuFile(Map<String, Object> map) throws Exception {
		//mybatis forEach 구문에 들어갈 collection 사용을 위함
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> paramMap = new HashMap<String, Object>();
		list.add(map);
		// collection 이름 : menuFileMap
		paramMap.put("menuFileMap", list);
		return sqlSession.insert("OwnerMapper.insertMenuFile",paramMap);
	}
	@Override
	public int menuFileNoCnt() throws Exception {
		return sqlSession.selectOne("OwnerMapper.selectMenuFileNoCnt");
	}
	@Override
	public List<MenuVO> selectMenuList(int busiNo) throws Exception {
		return sqlSession.selectList("OwnerMapper.selectMenuList",busiNo);
	}
	
	@Override
	public void deleteAllMenu(int busiNo) throws Exception {
		sqlSession.update("OwnerMapper.deleteAllMenu",busiNo);
	}
	
	@Override
	public void deleteAllMenuFile(int busiNo) throws Exception {
		sqlSession.update("OwnerMapper.deleteAllMenuFile",busiNo);
	}
	
	@Override
	public void updateMenuFile(int fileNo) throws Exception {
		sqlSession.update("OwnerMapper.updateMenuFile",fileNo);
	}
	@Override
	public void insertJob(JobVO jobVO) throws Exception {
		sqlSession.insert("OwnerMapper.insertJob",jobVO);
	}
	@Override
	public void insertJobFile(Map<String,Object> map) throws Exception {
		sqlSession.insert("OwnerMapper.insertJobFile",map);
		
	}
	@Override
	public JobVO selectJobByWriter(String writer) throws Exception {
		return sqlSession.selectOne("OwnerMapper.selectJobByWriter",writer);
	}
	@Override
	public List<JobFileVO> selectJobFile(int jobNo) throws Exception {
		return sqlSession.selectList("OwnerMapper.selectJobFile",jobNo);
	}
	@Override
	public void updateJobFile(int fileNo) throws Exception {
		sqlSession.update("OwnerMapper.updateJobFile",fileNo);
	}
	@Override
	public void updateJob(JobVO jobVO) throws Exception {
		sqlSession.update("OwnerMapper.updateJob",jobVO);
	}
	@Override
	public void deleteJob(int jobNo) throws Exception {
		sqlSession.update("OwnerMapper.deleteJob",jobNo);
	}
	@Override
	public void deleteJobFile(int jobNo) throws Exception {
		sqlSession.update("OwnerMapper.deleteJobFile",jobNo);
	}
	
	@Override
	public void insertCompanyNotice(BusiNoticeVO busiNoticeVO) throws Exception {
		sqlSession.insert("OwnerMapper.insertCompanyNotice",busiNoticeVO);		
	}
	@Override
	public void insertCompanyNoticeFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("OwnerMapper.insertCompanyNoticeFile",map);
	}
	@Override
	public List<GetUserJobVO> selectGetUserJobList(int jobNo) throws Exception {
		return sqlSession.selectList("OwnerMapper.selectGetUserJobList",jobNo);
	}
	@Override
	public void updateGetUserJobStatusY(int getUserJobNo) throws Exception {
		sqlSession.update("OwnerMapper.updateGetUserJobStatusY",getUserJobNo);
	}
	@Override
	public void updateGetUserJobStatusN(int getUserJobNo) throws Exception {
		sqlSession.update("OwnerMapper.updateGetUserJobStatusN",getUserJobNo);
	}

	
	
}
