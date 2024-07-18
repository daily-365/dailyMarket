package com.dailyMarket.www.dao;

import java.util.List;
import java.util.Map;

import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;
import com.dailyMarket.www.vo.UserVO;

public interface UserDAO {

	public void insertUserRegist(UserVO userVO)throws Exception;
	public int selectUserLogin(UserVO userVO)throws Exception;
	public void insertUserProduct(ProductVO productVO)throws Exception;
	public void insertUserFile(Map<String,Object> map)throws Exception;
	public List<ProductVO> selectProductList(ProductVO productVO)throws Exception;
	public List<ProductVO> selectProductDetail(int productNo)throws Exception;
	public List<BusiVO> selectBusiList(BusiVO busiVO)throws Exception;
	public BusiVO selectByBusiNo(int busiNo)throws Exception;
	public List<StoreFileVO> selectStoreList(int busiNo)throws Exception;
	public List<MenuVO> selectMenuList(int busiNo)throws Exception;
}
