package com.dailyMarket.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailyMarket.www.dao.UserDAO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;
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


	
}
