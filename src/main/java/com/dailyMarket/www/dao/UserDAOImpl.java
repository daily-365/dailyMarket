package com.dailyMarket.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<ProductVO> selectProductDetail(int productNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectProductDetail",productNo);
	}

	@Override
	public List<BusiVO> selectBusiList(BusiVO busiVO) throws Exception {
		return sqlSession.selectList("UserMapper.selectBusiList",busiVO);
	}
	@Override
	public BusiVO selectByBusiNo(int busiNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectByBusiNo",busiNo);
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
	public List<BusiNoticeVO> selectCompanyNoticeList(String writer) throws Exception {
		return sqlSession.selectList("UserMapper.selectCompanyNoticeList",writer);
	}

	@Override
	public List<BusiNoticeFileVO> selectCompanyNoticeFile(String writer) throws Exception {
		return sqlSession.selectList("UserMapper.selectCompanyNoticeFile",writer);
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
	public BusiReviewVO selectCompanyReviewByBusiNo(int busiNo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectCompanyReviewByBusiNo",busiNo);
	}

	@Override
	public List<BusiReviewVO> selectCompanyReviewListByBusiNo(int busiNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectCompanyReviewListByBusiNo",busiNo);
	}

	@Override
	public List<BusiReviewFileVO> selectCompanyReviewFileByBusiViewNo(int busiReviewNo) throws Exception {
		return sqlSession.selectList("UserMapper.selectCompanyReviewFileByBusiViewNo",busiReviewNo);
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
	public int selectGetUserJobYn(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.selectGetUserJobYn",userId);
	}


	
}
