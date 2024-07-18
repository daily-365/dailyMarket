package com.dailyMarket.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailyMarket.www.dao.AdminDAO;
import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.AdminVO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.ProductFileVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;

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
	public List<ProductVO> selectProductList(ProductVO productVO) throws Exception {
		return adminDAO.selectProductList(productVO);
	}

	@Override
	public int selectProductTotalCount(ProductVO productVO) throws Exception {
		return adminDAO.selectProductTotalCount(productVO);
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
	public List<BusiVO> selectBusiList(BusiVO busiVO) throws Exception {
		return adminDAO.selectBusiList(busiVO);
	}

	@Override
	public BusiVO selectBusiByBusiNo(int busiNo) throws Exception {
		return adminDAO.selectBusiByBusiNo(busiNo);
	}

	@Override
	public void updateBusiState(BusiVO busiVO) throws Exception {
		adminDAO.updateBusiState(busiVO);
	}

	@Override
	public int selectBusiTotalCount(BusiVO busiVO) throws Exception {
		return adminDAO.selectBusiTotalCount(busiVO);
	}

	public List<BusiFileVO> selectBusiFile(int busiNo) throws Exception {
		return adminDAO.selectBusiFile(busiNo);
	}


	@Override
	public List<StoreFileVO> selectStoreFile(int busiNo) throws Exception {
		return adminDAO.selcetStoreFile(busiNo);
	}

	
	
}
