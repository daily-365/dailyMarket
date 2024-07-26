package com.dailyMarket.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.CarFileVO;
import com.dailyMarket.www.vo.CarVO;
import com.dailyMarket.www.vo.EstateFileVO;
import com.dailyMarket.www.vo.EstateVO;
import com.dailyMarket.www.vo.JobFileVO;
import com.dailyMarket.www.vo.JobVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;
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
	
	
}
