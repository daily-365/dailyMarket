package com.dailyMarket.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.AdminVO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.ProductFileVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int adminLogin(AdminVO adminVO) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectAdminLogin",adminVO) ;
	}

	
	
	@Override
	public List<ProductVO> selectProductList(ProductVO productVO) throws Exception {
		return sqlSession.selectList("AdminMapper.selectProductList",productVO);
	}

	@Override
	public int selectProductTotalCount(ProductVO productVO) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectProductTotalCount",productVO);
	}

	@Override
	public ProductVO selectProductByProductNo(int productNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectProductByProductNo",productNo);
	}
	
	@Override
	public List<ProductFileVO> selectProductFile(int productNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectProductFile",productNo);
	}



	@Override
	public void deleteProduct(int productNo) throws Exception {
		sqlSession.update("AdminMapper.deleteProduct",productNo);
	}
	@Override
	public void updateProduct(int productNo) throws Exception {
		sqlSession.update("AdminMapper.updateProduct",productNo);
	}



	@Override
	public List<BusiVO> selectBusiList(BusiVO busiVO) throws Exception {
		return sqlSession.selectList("AdminMapper.selectBusiList",busiVO);
	}

	@Override
	public BusiVO selectBusiByBusiNo(int busiNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectBusiByBusiNo",busiNo);
	}

	@Override
	public void updateBusiState(BusiVO busiVO) throws Exception {
		sqlSession.update("AdminMapper.updateBusiState",busiVO);
	}

	@Override
	public int selectBusiTotalCount(BusiVO busiVO) throws Exception {
		return sqlSession.selectOne("AdminMapper.selectBusiTotalCount",busiVO);
	}

	@Override
	public List<BusiFileVO> selectBusiFile(int busiNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectBusiFile",busiNo);
	}


	@Override
	public List<StoreFileVO> selcetStoreFile(int busiNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectStoreFile",busiNo);
	}



	
	
}
