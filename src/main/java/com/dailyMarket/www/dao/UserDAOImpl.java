package com.dailyMarket.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dailyMarket.www.vo.BusiVO;
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

	
	
	
	
}
